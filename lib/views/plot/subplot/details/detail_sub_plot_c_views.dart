part of '../../../views.dart';

class DetailSubPlotCPageScreen extends StatefulWidget {
  const DetailSubPlotCPageScreen({
    super.key,
    required this.type,
    required this.indexC,
    required this.plot,
    required this.areaName,
    required this.model,
  });

  final int indexC;
  final int type; // 0 - create, 1 - edit
  final Datum plot;
  final String areaName;
  final SubPlotAreaCModel? model;

  @override
  State<DetailSubPlotCPageScreen> createState() =>
      _DetailSubPlotCPageScreenState();
}

class _DetailSubPlotCPageScreenState extends State<DetailSubPlotCPageScreen> {
  final _tiangKelilingFormKey = GlobalKey<FormState>();

  final SharedPreferenceService _sharedPref = SharedPreferenceService();
  final SubPlotController _controller = Get.find();

  final _tiangKelilingController = TextEditingController();
  final _tiangDiameterController = TextEditingController();
  final _tiangNamaIlmiahController = TextEditingController();
  final _tiangKerapatanJenisController = TextEditingController();

  RxString selectedLocalName = 'Pilih Nama Lokal'.obs;
  RxString selectedBioName = ''.obs;

  RxDouble tiangDiameter = 0.0.obs;
  RxDouble tiangBiomassLand = 0.0.obs;
  RxDouble tiangKerapatan = 0.0.obs;

  // RxDouble tiangKarbon = 0.0.obs;

  List<Map<String, String>> knownTiangListMap = [
    {'name': 'Pilih Nama Lokal', 'bioname': ''},
    {'name': 'Domang', 'bioname': 'Tidak teridentifikasi'},
    {'name': 'Kolek', 'bioname': 'Eugenia sp'},
    {'name': 'Rangeh', 'bioname': 'Gluta renghas L'},
    {'name': 'Sontuo', 'bioname': 'Tidak teridentifikasi'},
  ];

  void initializeTiang(String value) {
    Set<String> knownSet = Set.from(
      knownTiangListMap.map((item) => item['name']),
    );

    if (knownSet.contains(value) && value != 'Pilih Nama Lokal') {
      tiangKerapatan.value = 0.6;
      String selectedBioNameValue = knownTiangListMap
          .firstWhere((element) => element['name'] == value)['bioname']!;

      selectedBioName.value = selectedBioNameValue;
    } else {
      tiangKerapatan.value = 0.0;
      tiangBiomassLand.value = 0.0;

      selectedBioName.value = '';
    }

    _tiangKerapatanJenisController.text = '${tiangKerapatan.value}';
  }

  void checkSingleTiang() {
    if (widget.type == 1) {
      selectedLocalName.value = widget.model!.localName;
      selectedBioName.value = widget.model!.bioName;

      _tiangNamaIlmiahController.text = widget.model!.bioName;

      tiangBiomassLand.value = widget.model!.biomassLand;
      tiangKerapatan.value = widget.model!.kerapatanKayu;

      _tiangKelilingController.text = widget.model!.keliling.toStringAsFixed(2);
      _tiangDiameterController.text = widget.model!.diameter.toStringAsFixed(2);

      _tiangKerapatanJenisController.text = '${tiangKerapatan.value}';
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeTiang(selectedLocalName.value);

    return Scaffold(
      backgroundColor: colorPrimaryBackground,
      extendBody: true,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Detail Sub Plot C',
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
      body: SingleChildScrollView(
        child: Container(
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
            children: [
              buildDetailInfo(),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (_tiangKelilingController.text.isEmpty ||
                      _tiangDiameterController.text.isEmpty ||
                      selectedLocalName.value == 'Pilih Nama Lokal') {
                    Get.snackbar(
                      'CarbonStock',
                      'Lengkapi data terlebih dahulu',
                      backgroundColor: Colors.redAccent,
                      colorText: colorPrimaryWhite,
                    );
                  } else {
                    if (_tiangKelilingFormKey.currentState!.validate()) {
                      double keliling =
                          double.parse(_tiangKelilingController.text);
                      double diameter =
                          double.parse(_tiangDiameterController.text);
                      String name = selectedLocalName.value;
                      String bioName = selectedBioName.value;
                      double kerapatanKayu = tiangKerapatan.value;
                      double biomassLand = tiangBiomassLand.value;
                      double carbonValue = tiangBiomassLand.value * 0.47;
                      double carbonAbsorb =
                          tiangBiomassLand.value * 0.47 * (44 / 12);

                      if (widget.type == 0 || widget.model == null) {
                        Uuid uuid = const Uuid();

                        final subPlotCModel = SubPlotAreaCModel(
                          uuid: uuid.v4(),
                          plotId: widget.plot.id.toString(),
                          areaName: widget.areaName,
                          plotName: widget.plot.namaPlot,
                          localName: name,
                          bioName: bioName,
                          keliling: keliling,
                          diameter: diameter,
                          kerapatanKayu: kerapatanKayu,
                          biomassLand: biomassLand,
                          carbonValue: carbonValue,
                          carbonAbsorb: carbonAbsorb,
                          updatedAt: DateTime.now(),
                        );

                        await _controller.insertSubPlotC(subPlotCModel);
                        _sharedPref.putBool('tiang_data', true);
                      } else {
                        if (widget.type == 1) {
                          final subPlotCModel = SubPlotAreaCModel(
                            uuid: widget.model!.uuid,
                            plotId: widget.plot.id.toString(),
                            areaName: widget.areaName,
                            plotName: widget.plot.namaPlot,
                            localName: name,
                            bioName: bioName,
                            keliling: keliling,
                            diameter: diameter,
                            kerapatanKayu: kerapatanKayu,
                            biomassLand: biomassLand,
                            carbonValue: carbonValue,
                            carbonAbsorb: carbonAbsorb,
                            updatedAt: DateTime.now(),
                          );

                          // d.log('update ${widget.indexC}');
                          await _controller.updateSubPlotC(
                            widget.indexC,
                            subPlotCModel,
                          );
                        }
                        _sharedPref.putBool('tiang_data', true);
                      }

                      if (_sharedPref.checkKey('tiang_data')) {
                        Get.back();
                        Get.snackbar(
                          'CarbonStock',
                          'Edit Sub-Plot B Berhasil!',
                          backgroundColor: colorSecondaryGrey1,
                        );
                      }
                    }
                  }
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
      ),
    );
  }

  Widget buildDetailInfo() {
    checkSingleTiang();

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
        buildTiangInfo(),
      ],
    );
  }

  Card buildTiangInfo() {
    return Card(
      elevation: 0.5,
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Container(
            width: 1.sw,
            margin: EdgeInsets.only(left: 16.w),
            child: const Text(
              'Sub Plot C (10x10) - Tiang',
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
                  child: Form(
                    key: _tiangKelilingFormKey,
                    child: TextFormField(
                      controller: _tiangKelilingController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (double.parse(value!) < 10 ||
                            double.parse(value) > 19.9) {
                          return 'Tidak boleh kurang dari\n10cm atau lebih dari\n19.9cm!';
                        }

                        return null;
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          tiangDiameter.value = double.parse(value) / (22 / 7);
                          _tiangDiameterController.text =
                              tiangDiameter.value.toStringAsFixed(2);

                          if (tiangKerapatan.value != 0.0) {
                            tiangBiomassLand.value = 0.11 *
                                tiangKerapatan.value *
                                (pow(tiangDiameter.value, 2.62));
                          }
                        } else {
                          _tiangDiameterController.text = '';
                          tiangBiomassLand.value = 0.0;
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
                    controller: _tiangDiameterController,
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
                    items: knownTiangListMap
                        .map(
                          (e) => DropdownMenuItem(
                            value: e['name'],
                            child: Text('${e['name']}'),
                          ),
                        )
                        .toList(),
                    value: selectedLocalName.value,
                    onChanged: (value) {
                      selectedLocalName.value = value!;
                      initializeTiang(value.toString());

                      _tiangNamaIlmiahController.text =
                          selectedBioName.value.toString();

                      if (tiangDiameter.value != 0.0 &&
                          tiangKerapatan.value != 0.0) {
                        tiangBiomassLand.value = 0.11 *
                            tiangKerapatan.value *
                            (pow(tiangDiameter.value, 2.62));
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
                    controller: _tiangNamaIlmiahController,
                    keyboardType: TextInputType.text,
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
                    controller: _tiangKerapatanJenisController,
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
                    () => tiangBiomassLand.value != 0
                        ? Text(
                            '${(tiangBiomassLand.value).toStringAsFixed(2)} Kg',
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
                    () => tiangBiomassLand.value != 0
                        ? Text(
                            '${(tiangBiomassLand.value * 0.47).toStringAsFixed(2)} Kg',
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
                    () => tiangBiomassLand.value != 0
                        ? Text(
                            '${((tiangBiomassLand.value * 0.47) * (44 / 12)).toStringAsFixed(2)} Kg',
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

  Card buildtiangInfo() {
    return Card(
      elevation: 0.5,
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Container(
            width: 1.sw,
            margin: EdgeInsets.only(left: 16.w),
            child: const Text(
              'Sub Plot B (5x5) - tiang',
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
                    controller: _tiangKelilingController,
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
                      if (value.isNotEmpty && tiangKerapatan.value != 0.0) {
                        tiangBiomassLand.value = 0.11 *
                            tiangKerapatan.value *
                            (pow(double.parse(_tiangDiameterController.text),
                                2.62));
                      } else {
                        tiangBiomassLand.value = 0.0;
                      }
                    },
                    controller: _tiangDiameterController,
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
                    items: knownTiangListMap
                        .map(
                          (e) => DropdownMenuItem(
                            value: e['name'],
                            child: Text('${e['name']}'),
                          ),
                        )
                        .toList(),
                    value: selectedLocalName.value,
                    onChanged: (value) {
                      selectedLocalName.value = value!;
                      initializeTiang(value.toString());

                      _tiangNamaIlmiahController.text =
                          selectedBioName.value.toString();
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
                    controller: _tiangNamaIlmiahController,
                    keyboardType: TextInputType.number,
                    readOnly: true,
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
                    controller: _tiangKerapatanJenisController,
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
                    () => tiangBiomassLand.value != 0
                        ? Text(
                            '${(tiangBiomassLand.value).toStringAsFixed(2)} Kg',
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
                    () => tiangBiomassLand.value != 0
                        ? Text(
                            '${(tiangBiomassLand.value * 0.47).toStringAsFixed(2)} Kg',
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
                    () => tiangBiomassLand.value != 0
                        ? Text(
                            '${((tiangBiomassLand.value * 0.47) * (44 / 12)).toStringAsFixed(2)} Kg',
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
