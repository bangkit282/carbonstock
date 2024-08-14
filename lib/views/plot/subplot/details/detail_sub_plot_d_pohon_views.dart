part of '../../../views.dart';

class DetailDPohonPageScreen extends StatefulWidget {
  const DetailDPohonPageScreen({
    super.key,
    required this.type,
    required this.indexD,
    required this.indexPohon,
    required this.plotData,
    required this.areaName,
    required this.subPlotDModel,
    required this.subPlotDPohonModel,
  });

  final int type;

  final int? indexD;
  final int? indexPohon;

  final String areaName;
  final Datum plotData;

  final SubPlotAreaDModel? subPlotDModel;
  final SubPlotAreaDPohonModel? subPlotDPohonModel;

  @override
  State<DetailDPohonPageScreen> createState() => _DetailDPohonPageScreenState();
}

class _DetailDPohonPageScreenState extends State<DetailDPohonPageScreen> {
  final _pohonKelilingFormKey = GlobalKey<FormState>();

  final SharedPreferenceService _sharedPref = SharedPreferenceService();
  final SubPlotController _controller = Get.find();

  final TextEditingController _pohonKelilingController =
      TextEditingController();
  final TextEditingController _pohonDiameterController =
      TextEditingController();
  final TextEditingController _pohonNamaIlmiahController =
      TextEditingController();
  final TextEditingController _pohonKerapatanJenisController =
      TextEditingController();

  RxString selectedLocalNamePohon = 'Pilih Nama Lokal'.obs;
  RxString selectedBioNamePohon = ''.obs;

  RxDouble pohonDiameter = 0.0.obs;
  RxDouble pohonBiomassLand = 0.0.obs;
  RxDouble pohonKerapatan = 0.0.obs;
  RxDouble pohonKarbon = 0.0.obs;

  List<Map<String, String>> knownPohonListMap = [
    {'name': 'Pilih Nama Lokal', 'bioname': ''},
    {'name': 'Kalek', 'bioname': 'Eugenia sp'},
    {'name': 'Gamai-Gamai', 'bioname': 'Tidak teridentifikasi'},
    {'name': 'Sontuo', 'bioname': 'Tidak teridentifikasi'},
    {'name': 'Mahoni', 'bioname': 'Swietenia mahagoni'},
    {'name': 'Pohon Pelawan', 'bioname': 'Tristaniopsis merguensis'},
    {'name': 'Pohon Lokal', 'bioname': 'Tidak teridentifikasi'},
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

  void checkSinglePohon() {
    if (widget.subPlotDPohonModel != null) {
      selectedLocalNamePohon.value = widget.subPlotDPohonModel!.localName;
      selectedBioNamePohon.value = widget.subPlotDPohonModel!.bioName;

      _pohonNamaIlmiahController.text = widget.subPlotDPohonModel!.bioName;

      pohonBiomassLand.value = widget.subPlotDPohonModel!.biomassLand;
      pohonKerapatan.value = widget.subPlotDPohonModel!.kerapatanKayu;

      _pohonKelilingController.text =
          widget.subPlotDPohonModel!.keliling.toStringAsFixed(2);
      _pohonDiameterController.text =
          widget.subPlotDPohonModel!.diameter.toStringAsFixed(2);
      _pohonKerapatanJenisController.text = '${pohonKerapatan.value}';
    }
  }

  @override
  Widget build(BuildContext context) {
    initializePohon(selectedLocalNamePohon.value);

    return Scaffold(
      extendBody: true,
      backgroundColor: colorPrimaryBackground,
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
        automaticallyImplyLeading: false,
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
          child: Column(
            children: [
              SizedBox(height: 8.h),
              widget.subPlotDPohonModel != null
                  ? buildPohonInfo(
                      widget.subPlotDPohonModel!.keliling,
                      widget.subPlotDPohonModel!.localName,
                    )
                  : buildPohonInfo(null, null),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () async {
                  Uuid uuid = const Uuid();

                  if (_pohonKelilingController.text.isNotEmpty ||
                      _pohonDiameterController.text.isNotEmpty ||
                      selectedLocalNamePohon.value != 'Pilih Nama Lokal') {
                    if (_pohonKelilingController.text.isEmpty ||
                        _pohonDiameterController.text.isEmpty ||
                        selectedLocalNamePohon.value == 'Pilih Nama Lokal') {
                      Get.snackbar(
                        'CarbonRangers',
                        'Lengkapi data Pohon terlebih dahulu atau biarkan kosong sebelum menyimpan!',
                        backgroundColor: Colors.redAccent,
                        colorText: colorPrimaryWhite,
                      );
                    } else {
                      if (_pohonKelilingFormKey.currentState!.validate()) {
                        double keliling =
                            double.parse(_pohonKelilingController.text);
                        double diameter =
                            double.parse(_pohonDiameterController.text);
                        String name = selectedLocalNamePohon.value;
                        String bioName = selectedBioNamePohon.value;
                        double kerapatanKayu = pohonKerapatan.value;
                        double biomassLand = pohonBiomassLand.value;
                        double carbonValue = pohonBiomassLand.value * 0.47;
                        double carbonAbsorb =
                            pohonBiomassLand.value * 0.47 * (44 / 12);

                        if (widget.subPlotDPohonModel == null) {
                          final subPlotAreaDPohonModel = SubPlotAreaDPohonModel(
                            uuid: uuid.v4(),
                            areaName: widget.areaName,
                            plotName: widget.plotData.namaPlot,
                            plotId: widget.plotData.id.toString(),
                            keliling: keliling,
                            diameter: diameter,
                            kerapatanKayu: kerapatanKayu,
                            bioName: bioName,
                            biomassLand: biomassLand,
                            localName: name,
                            carbonValue: carbonValue,
                            carbonAbsorb: carbonAbsorb,
                            updatedAt: DateTime.now(),
                          );

                          if (widget.subPlotDModel == null) {
                            final subPlotAreaDModel = SubPlotAreaDModel(
                              uuid: uuid.v4(),
                              areaName: widget.areaName,
                              plotName: widget.plotData.namaPlot,
                              plotId: widget.plotData.id.toString(),
                              subPlotDModels: widget.subPlotDModel != null
                                  ? widget.subPlotDModel!.subPlotDModels
                                  : [],
                              updatedAt: DateTime.now(),
                            );

                            await _controller.insertSubPlotDPohon(
                              subPlotAreaDModel,
                              subPlotAreaDPohonModel,
                            );

                            _sharedPref.putBool('subplot_d_pohon_data', true);
                          } else {
                            await _controller.insertSubPlotDPohon(
                              widget.subPlotDModel,
                              subPlotAreaDPohonModel,
                            );

                            _sharedPref.putBool('subplot_d_pohon_data', true);
                          }
                        } else {
                          final subPlotAreaDPohonModel = SubPlotAreaDPohonModel(
                            uuid: widget.subPlotDPohonModel!.uuid,
                            plotId: widget.plotData.id.toString(),
                            plotName: widget.plotData.namaPlot,
                            areaName: widget.areaName,
                            keliling: keliling,
                            diameter: diameter,
                            kerapatanKayu: kerapatanKayu,
                            bioName: bioName,
                            biomassLand: biomassLand,
                            localName: name,
                            carbonValue: carbonValue,
                            carbonAbsorb: carbonAbsorb,
                            updatedAt: DateTime.now(),
                          );

                          await _controller.updateSubPlotDPohon(
                            widget.indexD!,
                            widget.indexPohon!,
                            widget.subPlotDModel!,
                            subPlotAreaDPohonModel,
                          );

                          _sharedPref.putBool('subplot_d_pohon_data', true);
                        }
                      }
                    }
                  }

                  if (_sharedPref.checkKey('subplot_d_pohon_data')) {
                    Get.off(
                      () => SubPlotDListPageViews(
                        areaName: widget.areaName,
                        plotData: widget.plotData,
                      ),
                    );

                    Get.snackbar(
                      'CarbonRangers',
                      'Simpan Sub-Plot D Berhasil!',
                      backgroundColor: colorSecondaryGrey1,
                    );
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

  Card buildPohonInfo(
    double? keliling,
    String? localName,
  ) {
    if (widget.subPlotDPohonModel != null) {
      selectedLocalNamePohon.value = widget.subPlotDPohonModel!.localName;
      selectedBioNamePohon.value = widget.subPlotDPohonModel!.bioName;

      _pohonNamaIlmiahController.text = widget.subPlotDPohonModel!.bioName;

      pohonBiomassLand.value = widget.subPlotDPohonModel!.biomassLand;
      pohonKerapatan.value = widget.subPlotDPohonModel!.kerapatanKayu;

      _pohonKelilingController.text =
          widget.subPlotDPohonModel!.keliling.toStringAsFixed(2);
      _pohonDiameterController.text =
          widget.subPlotDPohonModel!.diameter.toStringAsFixed(2);
      _pohonKerapatanJenisController.text = '${pohonKerapatan.value}';
    }

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
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
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
                    'Keliling (cm)',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: Form(
                    key: _pohonKelilingFormKey,
                    child: TextFormField(
                      controller: _pohonKelilingController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (double.parse(value!) > 20) {
                          return 'Tidak boleh lebih dari\n20cm!';
                        }

                        return null;
                      },
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
