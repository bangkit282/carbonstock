part of '../../../views.dart';

class DetailNekromasPageScreen extends StatefulWidget {
  const DetailNekromasPageScreen({
    super.key,
    required this.type,
    this.indexD,
    this.indexNekromas,
    required this.areaName,
    required this.plotData,
    this.subPlotDModel,
    this.subPlotDNekromasModel,
  });

  final int type;

  final int? indexD;
  final int? indexNekromas;

  final String areaName;
  final Datum plotData;

  final SubPlotAreaDModel? subPlotDModel;
  final SubPlotAreaDNekromasModel? subPlotDNekromasModel;

  @override
  State<DetailNekromasPageScreen> createState() =>
      _DetailNekromasPageScreenState();
}

class _DetailNekromasPageScreenState extends State<DetailNekromasPageScreen> {
  final SharedPreferenceService _sharedPref = SharedPreferenceService();
  final SubPlotController _controller = Get.find();

  final TextEditingController _nekromasDiameterPangkalController =
      TextEditingController();
  final TextEditingController _nekromasDiameterUjungController =
      TextEditingController();
  final TextEditingController _nekromasPanjangController =
      TextEditingController();

  RxDouble nekromasDiameterPangkal = 0.0.obs;
  RxDouble nekromasDiameterUjung = 0.0.obs;
  RxDouble nekromasPanjang = 0.0.obs;
  RxDouble nekromasVolume = 0.0.obs;
  RxDouble nekromasBiomassLand = 0.0.obs;
  RxDouble nekromasKarbon = 0.0.obs;

  @override
  Widget build(BuildContext context) {
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
        automaticallyImplyLeading: true,
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
              widget.subPlotDNekromasModel != null
                  ? buildNekromasInfo(
                      widget.subPlotDNekromasModel!.diameterPangkal,
                      widget.subPlotDNekromasModel!.diameterUjung,
                      widget.subPlotDNekromasModel!.panjang)
                  : buildNekromasInfo(null, null, null),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () async {
                  Uuid uuid = const Uuid();

                  if (_nekromasDiameterPangkalController.text.isNotEmpty ||
                      _nekromasDiameterUjungController.text.isNotEmpty ||
                      _nekromasPanjangController.text.isNotEmpty) {
                    if (_nekromasDiameterPangkalController.text.isEmpty ||
                        _nekromasDiameterUjungController.text.isEmpty ||
                        _nekromasPanjangController.text.isEmpty) {
                      Get.snackbar(
                        'CarbonRangers',
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

                      if (widget.subPlotDNekromasModel == null) {
                        final subPlotAreaDNekromasModel =
                            SubPlotAreaDNekromasModel(
                          uuid: uuid.v4(),
                          plotId: widget.plotData.id.toString(),
                          plotName: widget.plotData.namaPlot,
                          areaName: widget.areaName,
                          diameterPangkal: dPangkal,
                          diameterUjung: dUjung,
                          panjang: panjang,
                          volume: volume,
                          biomassLand: biomass,
                          carbonValue: carbonValue,
                          carbonAbsorb: carbonAbsorb,
                          updatedAt: DateTime.now(),
                        );

                        if (widget.subPlotDModel == null) {
                          final subPlotAreaDModel = SubPlotAreaDModel(
                            uuid: uuid.v4(),
                            plotId: widget.plotData.id.toString(),
                            plotName: widget.plotData.namaPlot,
                            areaName: widget.areaName,
                            subPlotDModels: widget.subPlotDModel != null
                                ? widget.subPlotDModel!.subPlotDModels
                                : [],
                            updatedAt: DateTime.now(),
                          );

                          await _controller.insertSubPlotDNekromas(
                            subPlotAreaDModel,
                            subPlotAreaDNekromasModel,
                          );

                          _sharedPref.putBool('subplot_d_nekromas_data', true);
                        } else {
                          await _controller.insertSubPlotDNekromas(
                            widget.subPlotDModel,
                            subPlotAreaDNekromasModel,
                          );

                          _sharedPref.putBool('subplot_d_nekromas_data', true);
                        }
                      } else {
                        final subPlotNekromas = SubPlotAreaDNekromasModel(
                          uuid: widget.subPlotDNekromasModel!.uuid,
                          plotId: widget.plotData.id.toString(),
                          plotName: widget.plotData.namaPlot,
                          areaName: widget.areaName,
                          diameterPangkal:
                              widget.subPlotDNekromasModel!.diameterPangkal,
                          diameterUjung:
                              widget.subPlotDNekromasModel!.diameterUjung,
                          panjang: widget.subPlotDNekromasModel!.panjang,
                          volume: widget.subPlotDNekromasModel!.volume,
                          biomassLand:
                              widget.subPlotDNekromasModel!.biomassLand,
                          carbonValue:
                              widget.subPlotDNekromasModel!.carbonValue,
                          carbonAbsorb:
                              widget.subPlotDNekromasModel!.carbonAbsorb,
                          updatedAt: DateTime.now(),
                        );

                        await _controller.updateSubPlotDNekromas(
                          widget.indexD!,
                          widget.indexNekromas!,
                          widget.subPlotDModel!,
                          subPlotNekromas,
                        );

                        _sharedPref.putBool('subplot_d_nekromas_data', true);
                      }
                    }
                  }

                  if (_sharedPref.checkKey('subplot_d_nekromas_data')) {
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

  Card buildNekromasInfo(
    double? diameterPangkal,
    double? diameterUjung,
    double? panjang,
  ) {
    if (diameterPangkal != null && diameterUjung != null && panjang != null) {
      _nekromasDiameterPangkalController.text = diameterPangkal.toString();
      nekromasDiameterPangkal.value = diameterPangkal;

      _nekromasDiameterUjungController.text = diameterUjung.toString();
      nekromasDiameterUjung.value = diameterUjung;

      _nekromasPanjangController.text = panjang.toString();
      nekromasPanjang.value = panjang;

      nekromasVolume.value =
          0.25 * pi * pow((diameterPangkal + diameterUjung) / 2, 2) * panjang;

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
}
