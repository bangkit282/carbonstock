part of '../../../views.dart';

class DetailSubPlotBPageScreen extends StatefulWidget {
  const DetailSubPlotBPageScreen({
    super.key,
    required this.plotId,
    required this.areaName,
    required this.plotName,
  });
  final String plotId;
  final String areaName;
  final String plotName;

  @override
  State<DetailSubPlotBPageScreen> createState() =>
      _DetailSubPlotBPageScreenState();
}

class _DetailSubPlotBPageScreenState extends State<DetailSubPlotBPageScreen> {
  final _kelilingFormKey = GlobalKey<FormState>();

  final SharedPreferenceService _sharedPref = SharedPreferenceService();
  final SubPlotController _controller = Get.find();

  final TextEditingController _pancangKelilingController =
      TextEditingController();
  final TextEditingController _pancangDiameterController =
      TextEditingController();
  final TextEditingController _pancangNamaIlmiahController =
      TextEditingController();
  final TextEditingController _pancangKerapatanJenisController =
      TextEditingController();

  RxList<SubPlotAreaBModel> listB = <SubPlotAreaBModel>[].obs;

  RxString selectedLocalName = 'Pilih Nama Lokal'.obs;
  RxString selectedBioName = ''.obs;

  RxDouble pancangDiameter = 0.0.obs;
  RxDouble pancangBiomassLand = 0.0.obs;
  RxDouble pancangKerapatan = 0.0.obs;

  List<Map<String, String>> knownPancangListMap = [
    {
      'name': 'Pilih Nama Lokal',
      'bioname': '',
    },
    {
      'name': 'Jarum',
      'bioname': 'Tidak teridentifikasi',
    },
    {
      'name': 'Kolek',
      'bioname': 'Eugenia sp',
    },
    {
      'name': 'Kubin',
      'bioname': 'Macaranga gigantea',
    },
    {
      'name': 'Mandarahan',
      'bioname': 'Knema sumatrana',
    },
    {
      'name': 'Mang',
      'bioname': 'Garcinia sp.2',
    },
    {
      'name': 'Medang',
      'bioname': 'Artocarpus sp.6',
    },
    {
      'name': 'Nyatuah',
      'bioname': 'Madhuca sp',
    },
    {
      'name': 'Rangeh',
      'bioname': 'Gluta renghas L',
    },
    {
      'name': 'Rasak',
      'bioname': 'Vatica rassak',
    },
    {
      'name': 'Sarang tuotuo',
      'bioname': 'Tidak teridentifikasi',
    },
  ];

  void initializePancang(String value) {
    Set<String> knownSet = Set.from(
      knownPancangListMap.map((item) => item['name']),
    );

    if (knownSet.contains(value) && value != 'Pilih Nama Lokal') {
      pancangKerapatan.value = 0.6;
      String selectedBioNameValue = knownPancangListMap
          .firstWhere((element) => element['name'] == value)['bioname']!;

      selectedBioName.value = selectedBioNameValue;
    } else {
      pancangKerapatan.value = 0.0;
      pancangBiomassLand.value = 0.0;

      selectedBioName.value = '';
    }

    _pancangKerapatanJenisController.text = '${pancangKerapatan.value}';
  }

  void checkSinglePancang(List<SubPlotAreaBModel> list) {
    if (list.isNotEmpty) {
      selectedLocalName.value = list.last.localName;
      selectedBioName.value = list.last.bioName;

      _pancangNamaIlmiahController.text = list.last.bioName;

      pancangBiomassLand.value = list.last.biomassLand;
      pancangKerapatan.value = list.last.kerapatanKayu;

      _pancangKelilingController.text = list.last.keliling.toStringAsFixed(2);
      _pancangDiameterController.text = list.last.diameter.toStringAsFixed(2);
      _pancangKerapatanJenisController.text = '${pancangKerapatan.value}';
    }
  }

  @override
  Widget build(BuildContext context) {
    initializePancang(selectedLocalName.value);

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
                  if (_pancangKelilingController.text.isEmpty ||
                      _pancangDiameterController.text.isEmpty ||
                      selectedLocalName.value == 'Pilih Nama Lokal') {
                    Get.snackbar(
                      'CarbonStock',
                      'Lengkapi data terlebih dahulu',
                      backgroundColor: colorSecondaryGrey1,
                    );
                  } else {
                    if (_kelilingFormKey.currentState!.validate()) {
                      double keliling =
                          double.parse(_pancangKelilingController.text);
                      double diameter =
                          double.parse(_pancangDiameterController.text);
                      String name = selectedLocalName.value;
                      String bioName = selectedBioName.value;
                      double kerapatanKayu = pancangKerapatan.value;
                      double biomassLand = pancangBiomassLand.value;
                      double carbonValue = pancangBiomassLand.value * 0.47;
                      double carbonAbsorb =
                          pancangBiomassLand.value * 0.47 * (44 / 12);

                      if (listB.isEmpty) {
                        Uuid uuid = const Uuid();

                        final subPlotBModel = SubPlotAreaBModel(
                          uuid: uuid.v4(),
                          plotId: widget.plotId,
                          areaName: widget.areaName,
                          plotName: widget.plotName,
                          localName: name,
                          bioName: bioName,
                          keliling: keliling,
                          diameter: diameter,
                          kerapatanKayu: kerapatanKayu,
                          biomassLand: biomassLand,
                          carbonValue: carbonValue,
                          carbonAbsorb: carbonAbsorb,
                          subPlotBPhotoUrl: '',
                        );

                        await _controller.insertSubPlotB(subPlotBModel);

                        _sharedPref.putBool('pancang_data', true);
                        _sharedPref.putDouble(
                          'karbon_b',
                          carbonValue,
                        );
                        _sharedPref.putDouble(
                          'absorb_b',
                          carbonAbsorb,
                        );
                      } else {
                        SubPlotAreaBModel subPlotBModel = SubPlotAreaBModel(
                          uuid: listB.last.uuid,
                          plotId: widget.plotId,
                          areaName: widget.areaName,
                          plotName: widget.plotName,
                          localName: name,
                          bioName: bioName,
                          keliling: keliling,
                          diameter: diameter,
                          kerapatanKayu: kerapatanKayu,
                          biomassLand: biomassLand,
                          carbonValue: carbonValue,
                          carbonAbsorb: carbonAbsorb,
                          subPlotBPhotoUrl: '',
                        );

                        await _controller.updateSubPlotB(subPlotBModel);
                        _sharedPref.putBool('pancang_data', true);
                      }

                      if (_sharedPref.checkKey('pancang_data')) {
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
        ValueListenableBuilder(
          valueListenable: _controller.contactBBox.listenable(),
          builder: (context, box, _) {
            listB.value = box.values.toList();
            List<SubPlotAreaBModel> list = box.values
                .where((element) => element.plotId == widget.plotId)
                .toList();

            checkSinglePancang(list);
            return buildPancangInfo();
          },
        ),
      ],
    );
  }

  Card buildPancangInfo() {
    return Card(
      elevation: 0.5,
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Container(
            width: 1.sw,
            margin: EdgeInsets.only(left: 16.w),
            child: const Text(
              'Sub Plot B (5x5) - Pancang',
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
                    key: _kelilingFormKey,
                    child: TextFormField(
                      controller: _pancangKelilingController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (double.parse(value!) < 2.5 ||
                            double.parse(value) > 9.9) {
                          return 'Tidak boleh kurang dari\n2.5cm atau lebih dari\n9.9cm!';
                        }

                        return null;
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          pancangDiameter.value =
                              double.parse(value) / (22 / 7);
                          _pancangDiameterController.text =
                              pancangDiameter.value.toStringAsFixed(2);

                          if (pancangKerapatan.value != 0.0) {
                            pancangBiomassLand.value = 0.11 *
                                pancangKerapatan.value *
                                (pow(pancangDiameter.value, 2.62));
                          }
                        } else {
                          _pancangDiameterController.text = '';
                          pancangBiomassLand.value = 0.0;
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
                    keyboardType: TextInputType.number,
                    controller: _pancangDiameterController,
                    readOnly: true,
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
                    items: knownPancangListMap
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
                      initializePancang(value.toString());

                      _pancangNamaIlmiahController.text =
                          selectedBioName.value.toString();

                      if (pancangDiameter.value != 0.0 &&
                          pancangKerapatan.value != 0.0) {
                        pancangBiomassLand.value = 0.11 *
                            pancangKerapatan.value *
                            (pow(pancangDiameter.value, 2.62));
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
                    maxLength: 21,
                    readOnly: true,
                    controller: _pancangNamaIlmiahController,
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
                    () => pancangBiomassLand.value != 0
                        ? Text(
                            '${(pancangBiomassLand.value * 0.47).toStringAsFixed(2)} Kg',
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
                    () => pancangBiomassLand.value != 0
                        ? Text(
                            '${((pancangBiomassLand.value * 0.47) * (44 / 12)).toStringAsFixed(2)} Kg',
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
