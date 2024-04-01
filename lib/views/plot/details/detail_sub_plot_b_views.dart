part of '../../views.dart';

class DetailSubPlotBPageScreen extends StatefulWidget {
  const DetailSubPlotBPageScreen({super.key});

  @override
  State<DetailSubPlotBPageScreen> createState() =>
      _DetailSubPlotBPageScreenState();
}

class _DetailSubPlotBPageScreenState extends State<DetailSubPlotBPageScreen> {
  final TextEditingController _pancangKelilingController =
      TextEditingController();
  final TextEditingController _pancangDiameterController =
      TextEditingController();
  final TextEditingController _pancangNamaLokalController =
      TextEditingController();
  final TextEditingController _pancangNamaIlmiahController =
      TextEditingController();
  final TextEditingController _pancangKerapatanJenisController =
      TextEditingController();

  RxDouble pancangBiomassLand = 0.0.obs;
  RxDouble pancangKerapatan = 0.0.obs;
  RxDouble pancangKarbon = 0.0.obs;

  List<String> knownPancangList = [
    'Mandarahan',
    'Nyatuah',
    'Rangeh',
    'Medang',
    'Kolek',
    'Kolek',
    'Rasak',
    'Rasak',
    'Medang',
    'Sarang tuotuo',
    'Kubin',
    'Mang',
    'Jarum',
    'Mang',
    'Mang'
  ];

  void initializePancang(String value) {
    Set<String> knownSet = Set.from(knownPancangList);
    if (knownSet.contains(value)) {
      pancangKerapatan.value = 0.6;
    } else {
      pancangKerapatan.value = 0.0;
      pancangBiomassLand.value = 0.0;
    }

    _pancangKerapatanJenisController.text = '${pancangKerapatan.value}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Detail Sub Plot B',
          style: TextStyle(
            fontSize: 20.sp,
            color: colorPrimaryWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        backgroundColor: colorSecondaryGreen,
      ),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        margin: EdgeInsets.only(
          top: 16.h,
          left: 16.w,
          right: 16.w,
          bottom: 24.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildDetailInfo(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colorButtonAccentGreen,
                fixedSize: Size(1.sw, 45.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'Simpan',
                style: TextStyle(
                  color: colorPrimaryWhite,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailInfo() {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Daftar Sub Plot',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: colorPrimaryBlack,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 16.h),
        buildPancangInfo(),
      ],
    );
  }

  ExpansionTileCard buildPancangInfo() {
    return ExpansionTileCard(
      title: const Text(
        'Sub Plot B (5x5) - Pancang',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      onExpansionChanged: (value) {},
      children: [
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100.w,
                child: Text(
                  'Nama Lokal',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              SizedBox(
                width: 160.w,
                child: TextFormField(
                  onChanged: initializePancang,
                  controller: _pancangNamaLokalController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Nama Lokal',
                    hintStyle: const TextStyle(color: colorSecondaryGrey1),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                        color: colorSecondaryGrey1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4.h),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100.w,
                child: Text(
                  'Keliling',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              SizedBox(
                width: 160.w,
                child: TextFormField(
                  controller: _pancangKelilingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Keliling (cm)',
                    hintStyle: const TextStyle(color: colorSecondaryGrey1),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                        color: colorSecondaryGrey1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4.h),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100.w,
                child: Text(
                  'Diameter',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              SizedBox(
                width: 160.w,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.isNotEmpty && pancangKerapatan.value != 0.0) {
                      pancangBiomassLand.value = 0.11 *
                          pancangKerapatan.value *
                          (pow(double.parse(_pancangDiameterController.text),
                              2.62));
                    } else {
                      pancangBiomassLand.value = 0.0;
                    }
                  },
                  controller: _pancangDiameterController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Diameter (cm)',
                    hintStyle: const TextStyle(color: colorSecondaryGrey1),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                        color: colorSecondaryGrey1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4.h),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100.w,
                child: Text(
                  'Nama Ilmiah',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              SizedBox(
                width: 160.w,
                child: TextFormField(
                  controller: _pancangNamaIlmiahController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Nama Ilmiah',
                    hintStyle: const TextStyle(color: colorSecondaryGrey1),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                        color: colorSecondaryGrey1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4.h),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100.w,
                child: Text(
                  'Kerapatan Jenis Kayu',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              SizedBox(
                width: 160.w,
                child: TextFormField(
                  enabled: false,
                  controller: _pancangKerapatanJenisController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Kerapan Jenis Kayu',
                    hintStyle: const TextStyle(color: colorSecondaryGrey1),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                        color: colorSecondaryGrey1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4.h),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 140.w,
                child: Text(
                  'Biomassa di Atas Permukaan Tanah',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: 140.w,
                child: Obx(
                  () => pancangBiomassLand.value != 0
                      ? Text(
                          '${(pancangBiomassLand.value).toStringAsFixed(2)} Kg',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : Text(
                          '0 Kg',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 140.w,
                child: Text(
                  'Kandungan Karbon',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: 140.w,
                child: Obx(
                  () => pancangKerapatan.value != 0
                      ? Text(
                          '${(pancangKerapatan.value * 0.47).toStringAsFixed(2)} Kg',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : Text(
                          '0 Kg',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 140.w,
                child: Text(
                  'Serapan CO2',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: 140.w,
                child: Obx(
                  () => pancangKerapatan.value != 0
                      ? Text(
                          '${((pancangKerapatan.value * 0.47) * (44 / 12)).toStringAsFixed(2)} Kg',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : Text(
                          '0 Kg',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
