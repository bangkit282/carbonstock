part of '../../../views.dart';

class DetailSubPlotDPageScreen extends StatefulWidget {
  const DetailSubPlotDPageScreen({
    super.key,
    required this.indexD,
    required this.indexPohon,
    required this.indexNekromas,
    required this.indexTanah,
    required this.plotId,
    required this.areaName,
    required this.plotName,
    required this.subPlotDList,
    required this.subPlotDNekromasList,
    required this.subPlotDTanahList,
  });

  final int indexD;
  final int indexPohon;
  final int indexNekromas;
  final int indexTanah;

  final String plotId;
  final String areaName;
  final String plotName;

  final List<SubPlotAreaDModel> subPlotDList;
  final List<SubPlotAreaDNekromasModel> subPlotDNekromasList;
  final List<SubPlotAreaDTanahModel> subPlotDTanahList;

  @override
  State<DetailSubPlotDPageScreen> createState() =>
      _DetailSubPlotDPageScreenState();
}

class _DetailSubPlotDPageScreenState extends State<DetailSubPlotDPageScreen> {
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

  final TextEditingController _nekromasDiameterPangkalController =
      TextEditingController();
  final TextEditingController _nekromasDiameterUjungController =
      TextEditingController();
  final TextEditingController _nekromasPanjangController =
      TextEditingController();

  final TextEditingController _tanahKedalamanController =
      TextEditingController();
  final TextEditingController _tanahOrganikCController =
      TextEditingController();
  final TextEditingController _tanahBeratJenisController =
      TextEditingController();

  RxString selectedLocalNamePohon = 'Pilih Nama Lokal'.obs;
  RxString selectedBioNamePohon = ''.obs;

  RxDouble pohonDiameter = 0.0.obs;
  RxDouble pohonBiomassLand = 0.0.obs;
  RxDouble pohonKerapatan = 0.0.obs;
  RxDouble pohonKarbon = 0.0.obs;

  RxDouble nekromasDiameterPangkal = 0.0.obs;
  RxDouble nekromasDiameterUjung = 0.0.obs;
  RxDouble nekromasPanjang = 0.0.obs;
  RxDouble nekromasVolume = 0.0.obs;
  RxDouble nekromasBiomassLand = 0.0.obs;
  RxDouble nekromasKarbon = 0.0.obs;

  RxDouble tanahKedalaman = 0.0.obs;
  RxDouble tanahOrganikC = 0.0.obs;
  RxDouble tanahBeratJenis = 0.0.obs;

  RxDouble tanahKarbonGrCm2 = 0.0.obs;
  RxDouble tanahKarbonTonHa = 0.0.obs;
  RxDouble tanahKarbonTon = 0.0.obs;

  RxList<SubPlotAreaDPohonModel> listPohon = <SubPlotAreaDPohonModel>[].obs;
  List<Map<String, String>> knownPohonListMap = [
    {'name': 'Pilih Nama Lokal', 'bioname': ''},
    {'name': 'Kalek', 'bioname': 'Eugenia sp'},
    {'name': 'Gamai-Gamai', 'bioname': 'Tidak teridentifikasi'},
    {'name': 'Sontuo', 'bioname': 'Tidak teridentifikasi'},
    {'name': 'Mahoni', 'bioname': 'Swietenia mahagoni'},
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

  void checkSinglePohon(List<SubPlotAreaDPohonModel> list) {
    if (list.isNotEmpty) {
      selectedLocalNamePohon.value = list.last.localName;
      selectedBioNamePohon.value = list.last.bioName;

      _pohonNamaIlmiahController.text = list.last.bioName;

      pohonBiomassLand.value = list.last.biomassLand;
      pohonKerapatan.value = list.last.kerapatanKayu;

      _pohonKelilingController.text = list.last.keliling.toStringAsFixed(2);
      _pohonDiameterController.text = list.last.diameter.toStringAsFixed(2);
      _pohonKerapatanJenisController.text = '${pohonKerapatan.value}';
    }
  }

  @override
  Widget build(BuildContext context) {
    initializePohon(selectedLocalNamePohon.value);

    return Scaffold(
      backgroundColor: colorPrimaryBackground,
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDetailInfo(),
              ElevatedButton(
                onPressed: () async {
                  Uuid uuid = const Uuid();

                  final subPlotAreaDModel = SubPlotAreaDModel(
                    uuid: uuid.v4(),
                    plotId: widget.plotId,
                    areaName: widget.areaName,
                    plotName: widget.plotName,
                    subPlotDModels: widget.subPlotDList.isNotEmpty
                        ? widget.subPlotDList.last.subPlotDModels
                        : [],
                    updatedAt: DateTime.now(),
                  );

                  if (_pohonKelilingController.text.isNotEmpty ||
                      _pohonDiameterController.text.isNotEmpty ||
                      selectedLocalNamePohon.value != 'Pilih Nama Lokal') {
                    if (_pohonKelilingController.text.isEmpty ||
                        _pohonDiameterController.text.isEmpty ||
                        selectedLocalNamePohon.value == 'Pilih Nama Lokal') {
                      Get.snackbar(
                        'CarbonStock',
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

                        if (listPohon.isEmpty) {
                          final subPlotAreaDPohonModel = SubPlotAreaDPohonModel(
                            uuid: uuid.v4(),
                            plotId: widget.plotId,
                            areaName: widget.areaName,
                            plotName: widget.plotName,
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

                          _sharedPref.putDouble('karbon_d_pohon', carbonValue);
                          _sharedPref.putDouble('absorb_d_pohon', carbonAbsorb);

                          await _controller.insertSubPlotD(
                            subPlotAreaDModel,
                            subPlotAreaDPohonModel,
                            null,
                            null,
                          );

                          _sharedPref.putBool('subplot_d_data', true);
                        } else {
                          // d.log('isNotEmpty - update', name: 'semai');

                          final subPlotAreaDPohonModel = SubPlotAreaDPohonModel(
                            uuid: listPohon.last.uuid,
                            plotId: widget.plotId,
                            areaName: widget.areaName,
                            plotName: widget.plotName,
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

                          await _controller.updateSubPlotD(
                            widget.indexD,
                            widget.indexPohon,
                            widget.indexNekromas,
                            widget.indexTanah,
                            subPlotAreaDModel,
                            subPlotAreaDPohonModel,
                            null,
                            null,
                          );

                          _sharedPref.putBool('subplot_d_data', true);
                        }
                      }
                    }
                  }

                  if (_nekromasDiameterPangkalController.text.isNotEmpty ||
                      _nekromasDiameterUjungController.text.isNotEmpty ||
                      _nekromasPanjangController.text.isNotEmpty) {
                    if (_nekromasDiameterPangkalController.text.isEmpty ||
                        _nekromasDiameterUjungController.text.isEmpty ||
                        _nekromasPanjangController.text.isEmpty) {
                      Get.snackbar(
                        'CarbonStock',
                        'Lengkapi data Nekromas terlebih dahulu atau biarkan kosong sebelum menyimpan!',
                        backgroundColor: Colors.redAccent,
                        colorText: colorPrimaryWhite,
                      );
                    } else {
                      double dPangkal =
                          double.parse(_nekromasDiameterPangkalController.text);
                      double dUjung =
                          double.parse(_nekromasDiameterUjungController.text);
                      double panjang =
                          double.parse(_nekromasPanjangController.text);
                      double volume = nekromasVolume.value;
                      double biomass = nekromasBiomassLand.value;
                      double carbonValue = nekromasKarbon.value;
                      double carbonAbsorb = nekromasKarbon.value * 3.67;

                      if (widget.subPlotDNekromasList.isEmpty) {
                        final subPlotAreaDNekromasModel =
                            SubPlotAreaDNekromasModel(
                          uuid: uuid.v4(),
                          plotId: widget.plotId,
                          areaName: widget.areaName,
                          plotName: widget.plotName,
                          diameterPangkal: dPangkal,
                          diameterUjung: dUjung,
                          panjang: panjang,
                          volume: volume,
                          biomassLand: biomass,
                          carbonValue: carbonValue,
                          carbonAbsorb: carbonAbsorb,
                          updatedAt: DateTime.now(),
                        );

                        _sharedPref.putDouble(
                          'karbon_d_nekromas',
                          carbonValue,
                        );
                        _sharedPref.putDouble(
                          'absorb_d_nekromas',
                          carbonAbsorb,
                        );
                        await _controller.insertSubPlotD(
                          subPlotAreaDModel,
                          null,
                          subPlotAreaDNekromasModel,
                          null,
                        );

                        _sharedPref.putBool('subplot_d_data', true);
                      } else {
                        final subPlotAreaDNekromasModel =
                            SubPlotAreaDNekromasModel(
                          uuid: widget.subPlotDNekromasList.last.uuid,
                          plotId: widget.plotId,
                          areaName: widget.areaName,
                          plotName: widget.plotName,
                          diameterPangkal: dPangkal,
                          diameterUjung: dUjung,
                          panjang: panjang,
                          volume: volume,
                          biomassLand: biomass,
                          carbonValue: carbonValue,
                          carbonAbsorb: carbonAbsorb,
                          updatedAt: DateTime.now(),
                        );

                        _sharedPref.putDouble(
                          'karbon_d_nekromas',
                          carbonValue,
                        );
                        _sharedPref.putDouble(
                          'absorb_d_nekromas',
                          carbonAbsorb,
                        );
                        await _controller.updateSubPlotD(
                          widget.indexD,
                          widget.indexPohon,
                          widget.indexNekromas,
                          widget.indexTanah,
                          subPlotAreaDModel,
                          null,
                          subPlotAreaDNekromasModel,
                          null,
                        );

                        _sharedPref.putBool('subplot_d_data', true);
                      }
                    }
                  }

                  if (_tanahKedalamanController.text.isNotEmpty ||
                      _tanahOrganikCController.text.isNotEmpty ||
                      _tanahBeratJenisController.text.isNotEmpty) {
                    if (_tanahKedalamanController.text.isEmpty ||
                        _tanahOrganikCController.text.isEmpty ||
                        _tanahBeratJenisController.text.isEmpty) {
                      Get.snackbar(
                        'CarbonStock',
                        'Lengkapi data Tanah terlebih dahulu atau biarkan kosong sebelum menyimpan!',
                        backgroundColor: Colors.redAccent,
                        colorText: colorPrimaryWhite,
                      );
                    } else {
                      double kedalaman =
                          double.parse(_tanahKedalamanController.text);
                      double organik =
                          double.parse(_tanahOrganikCController.text);
                      double berat =
                          double.parse(_tanahBeratJenisController.text);
                      double karbonGrCm2 = tanahKarbonGrCm2.value;
                      double karbonTonHa = tanahKarbonTonHa.value;
                      double karbonTon = tanahKarbonTon.value;

                      double carbonAbsorb = tanahKarbonTon.value * 3.67;

                      if (widget.subPlotDTanahList.isEmpty) {
                        final subPlotAreaDTanah = SubPlotAreaDTanahModel(
                          uuid: uuid.v4(),
                          plotId: widget.plotId,
                          areaName: widget.areaName,
                          plotName: widget.plotName,
                          kedalamanSample: kedalaman,
                          organicTanah: organik,
                          beratJenisTanah: berat,
                          carbonGrCm: karbonGrCm2,
                          carbonTonHa: karbonTonHa,
                          carbonTon: karbonTon,
                          carbonAbsorb: carbonAbsorb,
                          updatedAt: DateTime.now(),
                        );

                        _sharedPref.putDouble(
                          'karbon_d_tanah',
                          tanahKarbonTon.value,
                        );
                        _sharedPref.putDouble(
                          'absorb_d_tanah',
                          tanahKarbonTon.value * 3.67,
                        );
                        await _controller.insertSubPlotD(
                          subPlotAreaDModel,
                          null,
                          null,
                          subPlotAreaDTanah,
                        );

                        _sharedPref.putBool('subplot_d_data', true);
                      } else {
                        final subPlotAreaDTanah = SubPlotAreaDTanahModel(
                          uuid: widget.subPlotDTanahList.last.uuid,
                          plotId: widget.plotId,
                          areaName: widget.areaName,
                          plotName: widget.plotName,
                          kedalamanSample: kedalaman,
                          organicTanah: organik,
                          beratJenisTanah: berat,
                          carbonGrCm: karbonGrCm2,
                          carbonTonHa: karbonTonHa,
                          carbonTon: karbonTon,
                          carbonAbsorb: carbonAbsorb,
                          updatedAt: DateTime.now(),
                        );

                        await _controller.updateSubPlotD(
                          widget.indexD,
                          widget.indexPohon,
                          widget.indexNekromas,
                          widget.indexTanah,
                          subPlotAreaDModel,
                          null,
                          null,
                          subPlotAreaDTanah,
                        );

                        _sharedPref.putBool('subplot_d_data', true);
                        _sharedPref.putDouble(
                          'karbon_d_tanah',
                          karbonTon,
                        );
                        _sharedPref.putDouble(
                          'absorb_d_tanah',
                          carbonAbsorb,
                        );
                      }
                    }
                  }

                  d.log('${_sharedPref.checkKey('absorb_d_tanah')}');

                  if (_sharedPref.checkKey('subplot_d_data')) {
                    Get.back();
                    Get.snackbar(
                      'CarbonStock',
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
          valueListenable: _controller.contactDPohonBox.listenable(),
          builder: (context, box, _) {
            List<SubPlotAreaDPohonModel> list = box.values
                .where((element) => element.plotId == widget.plotId)
                .toList();

            checkSinglePohon(list);
            return buildPohonInfo();
          },
        ),
        SizedBox(height: 16.h),
        ValueListenableBuilder(
          valueListenable: _controller.contactDNekromasBox.listenable(),
          builder: (context, box, _) {
            if (box.isEmpty) {
              return buildNekromasInfo(null, null, null);
            } else {
              List data = box.values
                  .where((element) => element.plotId == widget.plotId)
                  .toList();

              d.log('nekromas: $data', name: 'Data D');

              if (data.isNotEmpty) {
                return buildNekromasInfo(
                  data.last?.diameterPangkal,
                  data.last?.diameterUjung,
                  data.last?.panjang,
                );
              } else {
                return const SizedBox();
              }
            }
          },
        ),
        SizedBox(height: 16.h),
        ValueListenableBuilder(
          valueListenable: _controller.contactDTanahBox.listenable(),
          builder: (context, box, _) {
            if (box.isEmpty) {
              return buildTanahInfo(null, null, null);
            } else {
              List data = box.values
                  .where((element) => element.plotId == widget.plotId)
                  .toList();

              d.log('tanah: $data', name: 'Data D');

              if (data.isNotEmpty) {
                return buildTanahInfo(
                  data.last?.kedalamanSample,
                  data.last?.organicTanah,
                  data.last?.beratJenisTanah,
                );
              } else {
                return const SizedBox();
              }
            }
          },
        ),
        SizedBox(height: 16.h),
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

  Card buildNekromasInfo(
    double? dPangkal,
    double? dUjung,
    double? panjang,
  ) {
    if (dPangkal != null && dUjung != null && panjang != null) {
      _nekromasDiameterPangkalController.text = dPangkal.toString();
      nekromasDiameterPangkal.value = dPangkal;

      _nekromasDiameterUjungController.text = dUjung.toString();
      nekromasDiameterUjung.value = dUjung;

      _nekromasPanjangController.text = panjang.toString();
      nekromasPanjang.value = panjang;

      nekromasVolume.value =
          0.25 * pi * pow((dPangkal + dUjung) / 2, 2) * panjang;

      nekromasBiomassLand.value = nekromasVolume.value * 0.0006;
      nekromasKarbon.value = nekromasBiomassLand.value * 0.47;
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
              'Sub Plot D (20x20) - Nekromas',
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
                    'Diameter Pangkal (cm)',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: TextFormField(
                    controller: _nekromasDiameterPangkalController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        nekromasDiameterPangkal.value = double.parse(value);

                        if (nekromasDiameterUjung.value != 0.0 &&
                            nekromasPanjang.value != 0.0) {
                          nekromasVolume.value = 0.25 *
                              pi *
                              pow(
                                  (double.parse(value) +
                                          nekromasDiameterUjung.value) /
                                      2,
                                  2) *
                              nekromasPanjang.value;

                          nekromasBiomassLand.value =
                              nekromasVolume.value * 0.0006;
                          nekromasKarbon.value =
                              nekromasBiomassLand.value * 0.47;
                        }
                      } else {
                        _nekromasDiameterPangkalController.text = '';
                        nekromasBiomassLand.value = 0.0;
                        nekromasVolume.value = 0.0;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Diameter Pangkal',
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
                    'Diameter Ujung (cm)',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: TextFormField(
                    controller: _nekromasDiameterUjungController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        nekromasDiameterUjung.value = double.parse(value);

                        if (nekromasDiameterPangkal.value != 0.0 &&
                            nekromasPanjang.value != 0.0) {
                          nekromasVolume.value = 0.25 *
                              pi *
                              pow(
                                  (nekromasDiameterPangkal.value +
                                          double.parse(value)) /
                                      2,
                                  2) *
                              nekromasPanjang.value;

                          nekromasBiomassLand.value =
                              nekromasVolume.value * 0.0006;
                          nekromasKarbon.value =
                              nekromasBiomassLand.value * 0.47;
                        }
                      } else {
                        _nekromasDiameterUjungController.text = '';
                        nekromasBiomassLand.value = 0.0;
                        nekromasVolume.value = 0.0;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Diameter Ujung',
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
                    'Panjang (cm)',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: TextFormField(
                    controller: _nekromasPanjangController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        nekromasPanjang.value = double.parse(value);

                        if (nekromasDiameterPangkal.value != 0.0 &&
                            nekromasDiameterUjung.value != 0.0) {
                          nekromasVolume.value = 0.25 *
                              pi *
                              pow(
                                  (nekromasDiameterPangkal.value +
                                          nekromasDiameterUjung.value) /
                                      2,
                                  2) *
                              double.parse(value);

                          nekromasBiomassLand.value =
                              nekromasVolume.value * 0.0006;
                          nekromasKarbon.value =
                              nekromasBiomassLand.value * 0.47;
                        }
                      } else {
                        _nekromasPanjangController.text = '';
                        nekromasBiomassLand.value = 0.0;
                        nekromasVolume.value = 0.0;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Panjang',
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
                    'Volume',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: Obx(
                    () => nekromasVolume.value != 0
                        ? Text(
                            '${nekromasVolume.value.toStringAsFixed(2)} cm³',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        : Text(
                            '0 cm³',
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
                    'Biomass',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: Obx(
                    () => nekromasBiomassLand.value != 0
                        ? Text(
                            '${nekromasBiomassLand.value.toStringAsFixed(2)} Kg',
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
                    () => nekromasKarbon.value != 0
                        ? Text(
                            '${nekromasKarbon.value.toStringAsFixed(2)} Kg',
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
                    () => nekromasKarbon.value != 0
                        ? Text(
                            '${(nekromasKarbon.value * 3.67).toStringAsFixed(2)} Kg',
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
        ],
      ),
    );
  }

  Card buildTanahInfo(
    double? kedalaman,
    double? organikC,
    double? beratJenis,
  ) {
    if (kedalaman != null && organikC != null && beratJenis != null) {
      _tanahKedalamanController.text = kedalaman.toString();
      tanahKedalaman.value = kedalaman;

      _tanahOrganikCController.text = organikC.toString();
      tanahOrganikC.value = organikC;

      _tanahBeratJenisController.text = beratJenis.toString();
      tanahBeratJenis.value = beratJenis;

      tanahKarbonGrCm2.value = kedalaman * organikC * beratJenis;
      tanahKarbonTonHa.value = tanahKarbonGrCm2 * 100;
      tanahKarbonTon.value = tanahKarbonTonHa.value * 11.5;
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
              'Sub Plot D (20x20) - Tanah',
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
                    'Kedalaman Sample (cm)',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: TextFormField(
                    controller: _tanahKedalamanController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        tanahKedalaman.value = double.parse(value);

                        if (tanahOrganikC.value != 0.0 &&
                            tanahBeratJenis.value != 0.0) {
                          tanahKarbonGrCm2.value = double.parse(value) *
                              (tanahOrganikC.value / 100) *
                              tanahBeratJenis.value;

                          tanahKarbonTonHa.value = tanahKarbonGrCm2 * 100;
                          tanahKarbonTon.value = tanahKarbonTonHa.value * 11.5;
                        }
                      } else {
                        _tanahKedalamanController.text = '';
                        tanahKarbonGrCm2.value = 0.0;
                        tanahKarbonTonHa.value = 0.0;
                        tanahKarbonTon.value = 0.0;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Kedalaman Sample',
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
                    'C Organik Tanah (%)',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: TextFormField(
                    controller: _tanahOrganikCController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        tanahOrganikC.value = double.parse(value);

                        if (tanahKedalaman.value != 0.0 &&
                            tanahBeratJenis.value != 0.0) {
                          tanahKarbonGrCm2.value = tanahKedalaman.value *
                              (double.parse(value) / 100) *
                              tanahBeratJenis.value;

                          tanahKarbonTonHa.value = tanahKarbonGrCm2 * 100;
                          tanahKarbonTon.value = tanahKarbonTonHa.value * 11.5;
                        }
                      } else {
                        _tanahOrganikCController.text = '';
                        tanahKarbonGrCm2.value = 0.0;
                        tanahKarbonTonHa.value = 0.0;
                        tanahKarbonTon.value = 0.0;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'C Organik Tanah',
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
                    'Berat Jenis Tanah (gr/cm³)',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: TextFormField(
                    controller: _tanahBeratJenisController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        tanahBeratJenis.value = double.parse(value);

                        if (tanahKedalaman.value != 0.0 &&
                            tanahOrganikC.value != 0.0) {
                          tanahKarbonGrCm2.value = tanahKedalaman.value *
                              (tanahOrganikC.value / 100) *
                              double.parse(value);

                          tanahKarbonTonHa.value = tanahKarbonGrCm2 * 100;
                          tanahKarbonTon.value = tanahKarbonTonHa.value * 11.5;
                        }
                      } else {
                        _tanahBeratJenisController.text = '';
                        tanahKarbonGrCm2.value = 0.0;
                        tanahKarbonTonHa.value = 0.0;
                        tanahKarbonTon.value = 0.0;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Berat Jenis',
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
                    'Carbon\n(gr/cm³)',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: Obx(
                    () => tanahKarbonGrCm2.value != 0
                        ? Text(
                            '${tanahKarbonGrCm2.value.toStringAsFixed(2)} gr/cm³',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        : Text(
                            '0 gr/cm³',
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
                    'Carbon\n(Ton/Ha)',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: Obx(
                    () => tanahKarbonTonHa.value != 0
                        ? Text(
                            '${tanahKarbonTonHa.value.toStringAsFixed(2)} Ton/Ha',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        : Text(
                            '0 Ton/Ha',
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
                    'Carbon\n(Ton)',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: Obx(
                    () => tanahKarbonTon.value != 0
                        ? Text(
                            '${tanahKarbonTon.value.toStringAsFixed(2)} Ton',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        : Text(
                            '0 Ton',
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
                    'Serapan Karbon',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: Obx(
                    () => tanahKarbonTon.value != 0
                        ? Text(
                            '${(tanahKarbonTon.value * 3.67).toStringAsFixed(2)} Kg',
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
        ],
      ),
    );
  }
}
