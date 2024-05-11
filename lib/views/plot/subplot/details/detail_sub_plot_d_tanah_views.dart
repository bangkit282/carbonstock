part of '../../../views.dart';

class DetailTanahPageScreen extends StatefulWidget {
  const DetailTanahPageScreen({
    super.key,
    required this.type,
    this.indexD,
    this.indexTanah,
    required this.areaName,
    required this.plotData,
    this.subPlotDModel,
    this.subPlotDTanahModel,
  });

  final int type;

  final int? indexD;
  final int? indexTanah;

  final String areaName;
  final Datum plotData;

  final SubPlotAreaDModel? subPlotDModel;
  final SubPlotAreaDTanahModel? subPlotDTanahModel;

  @override
  State<DetailTanahPageScreen> createState() => _DetailTanahPageScreenState();
}

class _DetailTanahPageScreenState extends State<DetailTanahPageScreen> {
  final SharedPreferenceService _sharedPref = SharedPreferenceService();
  final SubPlotController _controller = Get.find();

  final TextEditingController _tanahKedalamanController =
      TextEditingController();
  final TextEditingController _tanahOrganikCController =
      TextEditingController();
  final TextEditingController _tanahBeratJenisController =
      TextEditingController();

  RxDouble tanahKedalaman = 0.0.obs;
  RxDouble tanahOrganikC = 0.0.obs;
  RxDouble tanahBeratJenis = 0.0.obs;

  RxDouble tanahKarbonGrCm2 = 0.0.obs;
  RxDouble tanahKarbonTonHa = 0.0.obs;
  RxDouble tanahKarbonTon = 0.0.obs;

  @override
  Widget build(BuildContext context) {
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
              widget.subPlotDTanahModel != null
                  ? buildTanahInfo(
                      widget.subPlotDTanahModel!.kedalamanSample,
                      widget.subPlotDTanahModel!.organicTanah,
                      widget.subPlotDTanahModel!.beratJenisTanah,
                    )
                  : buildTanahInfo(null, null, null),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () async {
                  Uuid uuid = const Uuid();

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

                      if (widget.subPlotDTanahModel == null) {
                        final subPlotDTanah = SubPlotAreaDTanahModel(
                          uuid: uuid.v4(),
                          areaName: widget.areaName,
                          plotName: widget.plotData.namaPlot,
                          plotId: widget.plotData.id.toString(),
                          kedalamanSample: kedalaman,
                          organicTanah: organik,
                          beratJenisTanah: berat,
                          carbonGrCm: karbonGrCm2,
                          carbonTonHa: karbonTonHa,
                          carbonTon: karbonTon,
                          carbonAbsorb: carbonAbsorb,
                          updatedAt: DateTime.now(),
                        );

                        if (widget.subPlotDModel == null) {
                          final subPlotD = SubPlotAreaDModel(
                            uuid: uuid.v4(),
                            areaName: widget.areaName,
                            plotName: widget.plotData.namaPlot,
                            plotId: widget.plotData.id.toString(),
                            subPlotDModels: widget.subPlotDModel != null
                                ? widget.subPlotDModel!.subPlotDModels
                                : [],
                            updatedAt: DateTime.now(),
                          );

                          await _controller.insertSubPlotDTanah(
                            subPlotD,
                            subPlotDTanah,
                          );

                          _sharedPref.putBool('subplot_d_tanah_data', true);
                        } else {
                          await _controller.insertSubPlotDTanah(
                            widget.subPlotDModel,
                            subPlotDTanah,
                          );

                          _sharedPref.putBool('subplot_d_tanah_data', true);
                        }
                      } else {
                        final subPlotDTanah = SubPlotAreaDTanahModel(
                          uuid: widget.subPlotDTanahModel!.uuid,
                          plotId: widget.plotData.id.toString(),
                          plotName: widget.plotData.namaPlot,
                          areaName: widget.areaName,
                          kedalamanSample: kedalaman,
                          organicTanah: organik,
                          beratJenisTanah: berat,
                          carbonGrCm: karbonGrCm2,
                          carbonTonHa: karbonTonHa,
                          carbonTon: karbonTon,
                          carbonAbsorb: carbonAbsorb,
                          updatedAt: DateTime.now(),
                        );

                        await _controller.updateSubPlotDTanah(
                          widget.indexD!,
                          widget.indexTanah!,
                          widget.subPlotDModel!,
                          subPlotDTanah,
                        );

                        _sharedPref.putBool('subplot_d_tanah_data', true);
                      }
                    }
                  }

                  if (_sharedPref.checkKey('subplot_d_tanah_data')) {
                    Get.off(
                      () => SubPlotDListPageViews(
                        areaName: widget.areaName,
                        plotData: widget.plotData,
                      ),
                    );

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

      tanahKarbonGrCm2.value = (kedalaman * organikC * beratJenis) / 100;
      tanahKarbonTonHa.value = (tanahKarbonGrCm2.value / 100) * 10000;
      tanahKarbonTon.value = ((tanahKarbonTonHa.value * 11.5) / 100) * 100;
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
                            '${((tanahKarbonTonHa.value / 10000) * 1000).toStringAsFixed(2)} Ton/Ha',
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
