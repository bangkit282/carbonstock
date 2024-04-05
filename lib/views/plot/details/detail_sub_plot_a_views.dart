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
  RxBool isTumbuhanKTotalExpand = false.obs;

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

  final TextEditingController _tumbuhanBTotalController =
      TextEditingController();
  final TextEditingController _tumbuhanBSampleController =
      TextEditingController();
  final TextEditingController _tumbuhanKSampleController =
      TextEditingController();
  final TextEditingController _tumbuhanKTotalController =
      TextEditingController();

  RxDouble semaiTotal = 0.0.obs;
  RxDouble semaiSample = 0.0.obs;
  RxDouble semaiKSample = 0.0.obs;
  RxDouble semaiKTotal = 0.0.obs;

  RxDouble seresahTotal = 0.0.obs;
  RxDouble seresahSample = 0.0.obs;
  RxDouble seresahKSample = 0.0.obs;
  RxDouble seresahKTotal = 0.0.obs;

  RxDouble tumbuhanTotal = 0.0.obs;
  RxDouble tumbuhanSample = 0.0.obs;
  RxDouble tumbuhanKSample = 0.0.obs;
  RxDouble tumbuhanKTotal = 0.0.obs;

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
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
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
        buildSemaiInfo(),
        SizedBox(height: 16.h),
        buildSeresahInfo(),
        SizedBox(height: 16.h),
        buildTumbuhanKTotalInfo(),
        SizedBox(height: 16.h),
      ],
    );
  }

  Card buildSemaiInfo() {
    return Card(
      elevation: 0.5,
      child: Column(
        children: [
          SizedBox(height: 16.h),
          const Text(
            'Sub Plot A (1x1) - Semai',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
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
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        semaiTotal.value = double.parse(value);

                        if (semaiSample.value != 0.0 &&
                            semaiKSample.value != 0.0) {
                          semaiKTotal.value =
                              (semaiKSample.value / double.parse(value)) *
                                  semaiSample.value;

                          _semaiKTotalController.text =
                              semaiKTotal.value.toStringAsFixed(2);
                        }
                      } else {
                        semaiTotal.value = 0.0;
                        semaiKTotal.value = 0.0;
                        _semaiKTotalController.text = '${semaiKTotal.value}';
                      }
                    },
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
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        semaiSample.value = double.parse(value);

                        if (semaiTotal.value != 0.0 &&
                            semaiKSample.value != 0.0) {
                          semaiKTotal.value =
                              (semaiKSample.value / semaiTotal.value) *
                                  double.parse(value);

                          _semaiKTotalController.text =
                              semaiKTotal.value.toStringAsFixed(2);
                        }
                      } else {
                        semaiSample.value = 0.0;
                        semaiKTotal.value = 0.0;
                        _semaiKTotalController.text = '${semaiKTotal.value}';
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
                      if (value.isNotEmpty) {
                        semaiKSample.value = double.parse(value);

                        if (semaiTotal.value != 0.0 &&
                            semaiSample.value != 0.0) {
                          semaiKTotal.value =
                              (double.parse(value) / semaiTotal.value) *
                                  semaiSample.value;

                          _semaiKTotalController.text =
                              semaiKTotal.value.toStringAsFixed(2);
                        }
                      } else {
                        semaiKSample.value = 0.0;
                        semaiKTotal.value = 0.0;
                        _semaiKTotalController.text = '${semaiKTotal.value}';
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
                    () => semaiKTotal.value != 0
                        ? Text(
                            '${(semaiKTotal.value * 0.47).toStringAsFixed(2)} Kg',
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
                    () => semaiKTotal.value != 0
                        ? Text(
                            '${((semaiKTotal.value * 0.47) * (44 / 12)).toStringAsFixed(2)} Kg',
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

  Card buildSeresahInfo() {
    return Card(
      elevation: 0.5,
      child: Column(
        children: [
          SizedBox(height: 16.h),
          const Text(
            'Sub Plot A (1x1) - Seresah',
            style: TextStyle(fontWeight: FontWeight.w700),
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
                    'Berat Basah Total',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: TextFormField(
                    controller: _seresahBTotalController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        seresahTotal.value = double.parse(value);

                        if (seresahSample.value != 0.0 &&
                            seresahKSample.value != 0.0) {
                          seresahKTotal.value =
                              (seresahKSample.value / double.parse(value)) *
                                  seresahSample.value;

                          _seresahKTotalController.text =
                              seresahKTotal.value.toStringAsFixed(2);
                        }
                      } else {
                        seresahTotal.value = 0.0;
                        seresahKTotal.value = 0.0;
                        _seresahKTotalController.text =
                            '${seresahKTotal.value}';
                      }
                    },
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
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        seresahSample.value = double.parse(value);

                        if (seresahTotal.value != 0.0 &&
                            seresahKSample.value != 0.0) {
                          seresahKTotal.value =
                              (seresahKSample.value / seresahTotal.value) *
                                  double.parse(value);

                          _seresahKTotalController.text =
                              seresahKTotal.value.toStringAsFixed(2);
                        }
                      } else {
                        seresahSample.value = 0.0;
                        seresahKTotal.value = 0.0;
                        _seresahKTotalController.text =
                            '${seresahKTotal.value}';
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
                      if (value.isNotEmpty) {
                        seresahKSample.value = double.parse(value);

                        if (seresahTotal.value != 0.0 &&
                            seresahSample.value != 0.0) {
                          seresahKTotal.value =
                              (double.parse(value) / seresahTotal.value) *
                                  seresahSample.value;

                          _seresahKTotalController.text =
                              seresahKTotal.value.toStringAsFixed(2);
                        }
                      } else {
                        seresahKSample.value = 0.0;
                        seresahKTotal.value = 0.0;
                        _seresahKTotalController.text =
                            '${seresahKTotal.value}';
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
                    () => seresahKTotal.value != 0
                        ? Text(
                            '${(seresahKTotal.value * 0.47).toStringAsFixed(2)} Kg',
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
                    () => seresahKTotal.value != 0
                        ? Text(
                            '${((seresahKTotal.value * 0.47) * (44 / 12)).toStringAsFixed(2)} Kg',
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

  Card buildTumbuhanKTotalInfo() {
    return Card(
      elevation: 0.5,
      child: Column(
        children: [
          SizedBox(height: 16.h),
          const Text(
            'Sub Plot A (1x1) - Tumbuhan Bawah',
            style: TextStyle(fontWeight: FontWeight.w700),
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
                    'Berat Basah Total',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: TextFormField(
                    controller: _tumbuhanBTotalController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        tumbuhanTotal.value = double.parse(value);

                        if (tumbuhanSample.value != 0.0 &&
                            tumbuhanKSample.value != 0.0) {
                          tumbuhanKTotal.value =
                              (tumbuhanKSample.value / double.parse(value)) *
                                  tumbuhanSample.value;

                          _tumbuhanKTotalController.text =
                              tumbuhanKTotal.value.toStringAsFixed(2);
                        }
                      } else {
                        tumbuhanTotal.value = 0.0;
                        tumbuhanKTotal.value = 0.0;
                        _tumbuhanKTotalController.text =
                            '${tumbuhanKTotal.value}';
                      }
                    },
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
                    controller: _tumbuhanBSampleController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        tumbuhanSample.value = double.parse(value);

                        if (tumbuhanTotal.value != 0.0 &&
                            tumbuhanKSample.value != 0.0) {
                          tumbuhanKTotal.value =
                              (tumbuhanKSample.value / tumbuhanTotal.value) *
                                  double.parse(value);

                          _tumbuhanKTotalController.text =
                              tumbuhanKTotal.value.toStringAsFixed(2);
                        }
                      } else {
                        tumbuhanSample.value = 0.0;
                        tumbuhanKTotal.value = 0.0;
                        _tumbuhanKTotalController.text =
                            '${tumbuhanKTotal.value}';
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
                    'Berat Kering Sample',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: TextFormField(
                    controller: _tumbuhanKSampleController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        tumbuhanKSample.value = double.parse(value);

                        if (tumbuhanTotal.value != 0.0 &&
                            tumbuhanSample.value != 0.0) {
                          tumbuhanKTotal.value =
                              (double.parse(value) / tumbuhanTotal.value) *
                                  tumbuhanSample.value;

                          _tumbuhanKTotalController.text =
                              tumbuhanKTotal.value.toStringAsFixed(2);
                        }
                      } else {
                        tumbuhanKSample.value = 0.0;
                        tumbuhanKTotal.value = 0.0;
                        _tumbuhanKTotalController.text =
                            '${tumbuhanKTotal.value}';
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
                    controller: _tumbuhanKTotalController,
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
                    () => tumbuhanKTotal.value != 0
                        ? Text(
                            '${(tumbuhanKTotal.value * 0.47).toStringAsFixed(2)} Kg',
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
                    () => tumbuhanKTotal.value != 0
                        ? Text(
                            '${((tumbuhanKTotal.value * 0.47) * (44 / 12)).toStringAsFixed(2)} Kg',
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
