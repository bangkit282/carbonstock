part of '../../views.dart';

class DetailSubPlotAPageScreen extends StatefulWidget {
  const DetailSubPlotAPageScreen({super.key});

  @override
  State<DetailSubPlotAPageScreen> createState() =>
      _DetailSubPlotAPageScreenState();
}

class _DetailSubPlotAPageScreenState extends State<DetailSubPlotAPageScreen> {
  RxBool isSemaiExpand = false.obs;
  RxBool isSeresahExpand = false.obs;
  RxBool isTumbuhanKeringExpand = false.obs;

  final TextEditingController _semaiBTotalController = TextEditingController();
  final TextEditingController _semaiBSampleController = TextEditingController();
  final TextEditingController _semaiKTotalController = TextEditingController();
  final TextEditingController _semaiKSampleController = TextEditingController();

  final TextEditingController _seresahBTotalController =
      TextEditingController();
  final TextEditingController _seresahBSampleController =
      TextEditingController();
  final TextEditingController _seresahKTotalController =
      TextEditingController();
  final TextEditingController _seresahKSampleController =
      TextEditingController();

  final TextEditingController _tumbuhanKeringBTotalController =
      TextEditingController();
  final TextEditingController _tumbuhanKeringBSampleController =
      TextEditingController();
  final TextEditingController _tumbuhanKeringKSampleController =
      TextEditingController();
  final TextEditingController _tumbuhanKeringKTotalController =
      TextEditingController();

  RxDouble semai = 0.0.obs;
  RxDouble seresah = 0.0.obs;
  RxDouble tumbuhanKering = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Detail Sub Plot A',
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
        buildSemaiInfo(),
        buildSeresahInfo(),
        buildTumbuhanKeringInfo(),
      ],
    );
  }

  ExpansionTileCard buildSemaiInfo() {
    return ExpansionTileCard(
        title: const Text(
          'Sub Plot A (1x1) - Semai',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        onExpansionChanged: (value) {
          if (isSeresahExpand.value || isTumbuhanKeringExpand.value) {
            value = false;
          } else if (!isSeresahExpand.value && !isTumbuhanKeringExpand.value) {
            isSemaiExpand(!value);
          }
        },
        initiallyExpanded: isSemaiExpand.value,
        children: [
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100.w,
                  child: Text(
                    'Berat Basah Total',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: TextFormField(
                    controller: _semaiBTotalController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Total (gr)',
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
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100.w,
                  child: Text(
                    'Berat Basah Sample',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: TextFormField(
                    controller: _semaiBSampleController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Sample (gr)',
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
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100.w,
                  child: Text(
                    'Berat Kering Sample',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: TextFormField(
                    controller: _semaiKSampleController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (_semaiBSampleController.text.isNotEmpty &&
                          _semaiBTotalController.text.isNotEmpty) {
                        semai.value = double.parse(value) /
                            double.parse(_semaiBSampleController.text) *
                            double.parse(_semaiBTotalController.text);

                        _semaiKTotalController.text =
                            semai.toStringAsFixed(2).toString();
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Sample (gr)',
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
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100.w,
                  child: Text(
                    'Berat Kering Total',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: TextFormField(
                    enabled: false,
                    controller: _semaiKTotalController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Total (gr)',
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
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100.w,
                  child: Text(
                    'Kandungan Karbon',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: Obx(
                    () => seresah.value != 0
                        ? Text(
                            '${(semai.value * 0.47).toStringAsFixed(2)} Kg',
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
                  width: 100.w,
                  child: Text(
                    'Serapan CO2',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: Obx(
                    () => semai.value != 0
                        ? Text(
                            '${((semai.value * 0.47) * (44 / 12)).toStringAsFixed(2)} Kg',
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
        ]);
  }

  ExpansionTileCard buildSeresahInfo() {
    return ExpansionTileCard(
      title: const Text(
        'Sub Plot A (1x1) - Seresah',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      onExpansionChanged: (value) {
        if (isSemaiExpand.value || isTumbuhanKeringExpand.value) {
          value = false;
        } else if (!isSemaiExpand.value && !isTumbuhanKeringExpand.value) {
          isSeresahExpand(!value);
        }
      },
      initiallyExpanded: isSeresahExpand.value,
      children: [
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100.w,
                child: Text(
                  'Berat Basah Total',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              SizedBox(
                width: 160.w,
                child: TextFormField(
                  controller: _seresahBTotalController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Total (gr)',
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
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100.w,
                child: Text(
                  'Berat Basah Sample',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              SizedBox(
                width: 160.w,
                child: TextFormField(
                  controller: _seresahBSampleController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Sample (gr)',
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
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100.w,
                child: Text(
                  'Berat Kering Sample',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              SizedBox(
                width: 160.w,
                child: TextFormField(
                  controller: _seresahKSampleController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (_seresahBSampleController.text.isNotEmpty &&
                        _seresahBTotalController.text.isNotEmpty) {
                      seresah.value = double.parse(value) /
                          double.parse(_seresahBSampleController.text) *
                          double.parse(_seresahBTotalController.text);

                      _seresahKTotalController.text =
                          seresah.toStringAsFixed(2).toString();
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Sample (gr)',
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
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100.w,
                child: Text(
                  'Berat Kering Total',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              SizedBox(
                width: 160.w,
                child: TextFormField(
                  enabled: false,
                  controller: _seresahKTotalController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Total (gr)',
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
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100.w,
                child: Text(
                  'Kandungan Karbon',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: 160.w,
                child: Obx(
                  () => seresah.value != 0
                      ? Text(
                          '${(seresah.value * 0.47).toStringAsFixed(2)} Kg',
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
                width: 100.w,
                child: Text(
                  'Serapan CO2',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: 160.w,
                child: Obx(
                  () => seresah.value != 0
                      ? Text(
                          '${((seresah.value * 0.47) * (44 / 12)).toStringAsFixed(2)} Kg',
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

  ExpansionTileCard buildTumbuhanKeringInfo() {
    return ExpansionTileCard(
      title: const Text(
        'Sub Plot A (1x1) - Tumbuhan Kering',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      onExpansionChanged: (value) {
        if (isSemaiExpand.value || isSeresahExpand.value) {
          value = false;
        } else if (!isSemaiExpand.value && !isSeresahExpand.value) {
          isTumbuhanKeringExpand(!value);
        }
      },
      initiallyExpanded: isTumbuhanKeringExpand.value,
      children: [
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100.w,
                child: Text(
                  'Berat Basah Total',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              SizedBox(
                width: 160.w,
                child: TextFormField(
                  controller: _tumbuhanKeringBTotalController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Total (gr)',
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
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100.w,
                child: Text(
                  'Berat Basah Sample',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              SizedBox(
                width: 160.w,
                child: TextFormField(
                  controller: _tumbuhanKeringBSampleController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Sample (gr)',
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
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100.w,
                child: Text(
                  'Berat Kering Sample',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              SizedBox(
                width: 160.w,
                child: TextFormField(
                  controller: _tumbuhanKeringKSampleController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (_tumbuhanKeringBSampleController.text.isNotEmpty &&
                        _tumbuhanKeringBTotalController.text.isNotEmpty) {
                      tumbuhanKering.value = double.parse(value) /
                          double.parse(_tumbuhanKeringBSampleController.text) *
                          double.parse(_tumbuhanKeringBTotalController.text);

                      _tumbuhanKeringKTotalController.text =
                          tumbuhanKering.toStringAsFixed(2).toString();
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Sample (gr)',
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
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100.w,
                child: Text(
                  'Berat Kering Total',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              SizedBox(
                width: 160.w,
                child: TextFormField(
                  enabled: false,
                  controller: _tumbuhanKeringKTotalController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Total (gr)',
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
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100.w,
                child: Text(
                  'Kandungan Karbon',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: 160.w,
                child: Obx(
                  () => tumbuhanKering.value != 0
                      ? Text(
                          '${(tumbuhanKering.value * 0.47).toStringAsFixed(2)} Kg',
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
                width: 100.w,
                child: Text(
                  'Serapan CO2',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: 160.w,
                child: Obx(
                  () => tumbuhanKering.value != 0
                      ? Text(
                          '${((tumbuhanKering.value * 0.47) * (44 / 12)).toStringAsFixed(2)} Kg',
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
