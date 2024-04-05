part of '../../views.dart';

class DetailSubPlotDPageScreen extends StatefulWidget {
  const DetailSubPlotDPageScreen({
    super.key,
    this.name,
    this.keliling,
  });

  final String? name;
  final double? keliling;

  @override
  State<DetailSubPlotDPageScreen> createState() =>
      _DetailSubPlotDPageScreenState();
}

class _DetailSubPlotDPageScreenState extends State<DetailSubPlotDPageScreen> {
  final SharedPreferenceService _sharedPref = SharedPreferenceService();

  final TextEditingController _pohonKelilingController =
      TextEditingController();
  final TextEditingController _pohonDiameterController =
      TextEditingController();
  final TextEditingController _pohonNamaIlmiahController =
      TextEditingController();
  final TextEditingController _pohonKerapatanJenisController =
      TextEditingController();

  // final TextEditingController _nekromasKelilingController =
  //     TextEditingController();
  // final TextEditingController _nekromasDiameterController =
  //     TextEditingController();
  // final TextEditingController _nekromasNamaIlmiahController =
  //     TextEditingController();
  // final TextEditingController _nekromasKerapatanJenisController =
  //     TextEditingController();

  // final TextEditingController _tanahDiameterController =
  //     TextEditingController();
  // final TextEditingController _tanahTinggiTotalController =
  //     TextEditingController();

  RxString selectedLocalNamePohon = 'Pilih Nama Lokal'.obs;
  RxString selectedBioNamePohon = ''.obs;

  // RxString selectedLocalNameNekromas = 'Pilih Nama Lokal'.obs;
  // RxString selectedBioNameNekromas = ''.obs;

  RxDouble pohonDiameter = 0.0.obs;
  RxDouble pohonBiomassLand = 0.0.obs;
  RxDouble pohonKerapatan = 0.0.obs;
  RxDouble pohonKarbon = 0.0.obs;

  // RxDouble nekromasBiomassLand = 0.0.obs;
  // RxDouble nekromasKerapatan = 0.0.obs;
  // RxDouble nekromasKarbon = 0.0.obs;

  RxDouble tanahDiameter = 0.0.obs;
  RxDouble tanahTinggiTotal = 0.0.obs;

  List<Map<String, String>> knownPohonListMap = [
    {'name': 'Pilih Nama Lokal', 'bioname': ''},
    {'name': 'Kalek', 'bioname': 'Eugenia sp'},
    {'name': 'Gamai-Gamai', 'bioname': 'Tidak teridentifikasi'},
    {'name': 'Sontuo', 'bioname': 'Tidak teridentifikasi'},
  ];

  void initializePohon(String value) {
    Set<String> knownSet = Set.from(
      knownPohonListMap.map((item) => item['name']),
    );

    if (knownSet.contains(value) && value != 'Pilih Nama Lokal') {
      pohonKerapatan.value = 0.6;
      String selectedBioNameValue = knownPohonListMap
          .firstWhere((element) => element['name'] == value)['bioname']!;

      selectedBioNamePohon.value = selectedBioNameValue;
    } else {
      pohonKerapatan.value = 0.0;
      pohonBiomassLand.value = 0.0;

      selectedBioNamePohon.value = '';
    }

    _pohonKerapatanJenisController.text = '${pohonKerapatan.value}';
  }

  @override
  Widget build(BuildContext context) {
    if (widget.name != null && widget.name != '') {
      selectedLocalNamePohon.value = widget.name!;
    }

    if (widget.keliling != null && widget.keliling != 0) {
      _pohonKelilingController.text = widget.keliling!.toString();
    }

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Detail Sub Plot D',
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
              onPressed: () {
                _sharedPref.putDouble(
                  'pohon_keliling',
                  double.parse(_pohonKelilingController.text),
                );

                _sharedPref.putDouble(
                  'pohon_diameter',
                  pohonDiameter.value,
                );

                _sharedPref.putString(
                  'pohon_local',
                  selectedLocalNamePohon.value,
                );

                _sharedPref.putDouble(
                  'pohon_biomass',
                  pohonBiomassLand.value,
                );

                _sharedPref.putDouble(
                  'pohon_karbon',
                  pohonBiomassLand.value * 0.47,
                );

                _sharedPref.putDouble(
                  'pohon_serapanco2',
                  (pohonBiomassLand.value * 0.47) * (44 / 12),
                );

                sleep(const Duration(seconds: 3));
                const Center(child: CircularProgressIndicator.adaptive());

                Get.back();
                Get.snackbar(
                  'CarbonStock',
                  'Simpan Sub-Plot D Berhasil!',
                  backgroundColor: colorSecondaryGreen,
                );
              },
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
    return Column(
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
        buildPohonInfo(),
      ],
    );
  }

  Card buildPohonInfo() {
    return Card(
      elevation: 0.5,
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Container(
            width: 1.sw,
            margin: EdgeInsets.only(left: 16.w),
            child: const Text(
              'Sub Plot D (20x20) - Pohon',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w700),
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
                    controller: _pohonKelilingController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        pohonDiameter.value = double.parse(value) / (22 / 7);
                        _pohonDiameterController.text =
                            pohonDiameter.value.toStringAsFixed(2);

                        if (pohonKerapatan.value != 0.0) {
                          pohonBiomassLand.value = 0.11 *
                              pohonKerapatan.value *
                              (pow(pohonDiameter.value, 2.62));
                        }
                      } else {
                        _pohonDiameterController.text = '';
                        pohonBiomassLand.value = 0.0;
                      }
                    },
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
                    readOnly: true,
                    controller: _pohonDiameterController,
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
              children: [
                Container(
                  margin: EdgeInsets.only(left: 12.w),
                  width: 120.w,
                  child: Text(
                    'Nama Lokal',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: DropdownButtonFormField(
                    items: knownPohonListMap
                        .map(
                          (e) => DropdownMenuItem(
                            value: e['name'],
                            child: Text('${e['name']}'),
                          ),
                        )
                        .toList(),
                    value: selectedLocalNamePohon.value,
                    onChanged: (value) {
                      selectedLocalNamePohon.value = value!;
                      initializePohon(value.toString());

                      _pohonNamaIlmiahController.text =
                          selectedBioNamePohon.value.toString();

                      if (pohonDiameter.value != 0.0 &&
                          pohonKerapatan.value != 0.0) {
                        pohonBiomassLand.value = 0.11 *
                            pohonKerapatan.value *
                            (pow(pohonDiameter.value, 2.62));
                      }
                    },
                    decoration: InputDecoration(
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
                    maxLines: 1,
                    maxLength: 21,
                    readOnly: true,
                    controller: _pohonNamaIlmiahController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Nama Ilmiah',
                      hintStyle: const TextStyle(color: colorSecondaryGrey1),
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
                    readOnly: true,
                    controller: _pohonKerapatanJenisController,
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
                    () => pohonBiomassLand.value != 0
                        ? Text(
                            '${(pohonBiomassLand.value).toStringAsFixed(2)} Kg',
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
                    () => pohonBiomassLand.value != 0
                        ? Text(
                            '${(pohonBiomassLand.value * 0.47).toStringAsFixed(2)} Kg',
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
                    () => pohonBiomassLand.value != 0
                        ? Text(
                            '${((pohonBiomassLand.value * 0.47) * (44 / 12)).toStringAsFixed(2)} Kg',
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
      ),
    );
  }
}
