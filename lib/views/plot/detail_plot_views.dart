part of '../views.dart';

class DetailPlotScreenViews extends StatefulWidget {
  const DetailPlotScreenViews({
    super.key,
    required this.plot,
    required this.plotData,
  });

  final Plot plot;
  final Datum plotData;

  @override
  State<DetailPlotScreenViews> createState() => _DetailPlotScreenViewsState();
}

class _DetailPlotScreenViewsState extends State<DetailPlotScreenViews> {
  // final PlotController _plotController = Get.find();
  final HamparanController _hamparanController = Get.find();

  final _addPlotFormKey = GlobalKey<FormState>(debugLabel: 'add-plot');
  final SharedPreferenceService sharedPreferences = SharedPreferenceService();

  int hamparanId = 0;
  String hamparanName = '';

  late MapboxMapController controller;
  late LatLng currentLatLng;

  RxList<PlotModel> listPlot = <PlotModel>[].obs;

  final TextEditingController _plotLatController = TextEditingController();
  final TextEditingController _plotLngController = TextEditingController();
  final TextEditingController _plotSizeController = TextEditingController();

  // final TextEditingController _biomassAvgController = TextEditingController();
  // final TextEditingController _biomassStdController = TextEditingController();

  _onMapCreated(MapboxMapController controller) {
    this.controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    _hamparanController.getAllHamparan().then((value) {
      var data = value as Hamparan;

      hamparanId = data.data!
          .firstWhere((element) => element.id == widget.plotData.idHamparan)
          .id;
      hamparanName = data.data!
          .firstWhere((element) => element.id == widget.plotData.idHamparan)
          .namaHamparan;

      d.log('${hamparanId.toString()} $hamparanName', name: 'hamparan');
    });

    String sharedLatLng = sharedPreferences.getString('latLng');
    Map<String, dynamic> latLngMapper = jsonDecode(sharedLatLng);

    currentLatLng = LatLng(
      latLngMapper['currentLatLng'][0],
      latLngMapper['currentLatLng'][1],
    );

    _plotLatController.text = currentLatLng.latitude.toString();
    _plotLngController.text = currentLatLng.longitude.toString();

    return Scaffold(
      extendBody: true,
      backgroundColor: colorPrimaryBackground,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Input Plot Area',
          style: TextStyle(
            color: colorPrimaryWhite,
            fontSize: 20.sp,
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
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Stack(
          children: [
            SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: ListView(
                children: [
                  SizedBox(height: 124.h),
                  Text(
                    'Plot Area',
                    style: TextStyle(
                      fontSize: 26.sp,
                      color: colorPrimaryBlack,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Pilih plot area yang akan dicatat',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: colorPrimaryBlack,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  buildCardPlotForm(),
                  SizedBox(height: 8.h),
                  Container(
                    margin: EdgeInsets.only(bottom: 24.h),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(
                          () => SubPlotAreaScreenViews(
                            plotData: widget.plotData,
                            areaName: hamparanName,
                          ),
                        );
                        // if (_addPlotFormKey.currentState!.validate()) {
                        // Uuid uuid = const Uuid();
                        // String size = _plotSizeController.text;
                        // String biomassAvg = _biomassAvgController.text;
                        // String biomassStd = _biomassStdController.text;

                        // d.log(listPlot.toString(), name: 'plot');

                        // if (listPlot.isEmpty) {
                        //   PlotModel plotModel = PlotModel(
                        //     plotId: uuid.v4(),
                        //     plotLat: double.parse(_plotLatController.text),
                        //     plotLng: double.parse(_plotLngController.text),
                        //     plotSize: double.parse(size),
                        //     biomassAvg: double.parse(biomassAvg),
                        //     biomassStd: double.parse(biomassStd),
                        //   );

                        //   await _plotController.insertPlot(plotModel);
                        // } else {
                        //   PlotModel plotModel = PlotModel(
                        //     plotId: widget.plotId,
                        //     plotLat: double.parse(_plotLatController.text),
                        //     plotLng: double.parse(_plotLngController.text),
                        //     plotSize: double.parse(size),
                        //     biomassAvg: double.parse(biomassAvg),
                        //     biomassStd: double.parse(biomassStd),
                        //   );

                        //   await _plotController.updatePlot(plotModel);
                        // }

                        // PlotModel plotModel = PlotModel(
                        //   plotId: uuid.v4(),
                        //   plotLat: double.parse(_plotLatController.text),
                        //   plotLng: double.parse(_plotLngController.text),
                        //   plotSize: double.parse(size),
                        //   biomassAvg: double.parse(biomassAvg),
                        //   biomassStd: double.parse(biomassStd),
                        //   updatedAt: DateTime.now(),
                        // );
                        //
                        // await _plotController.insertPlot(plotModel);

                        // Get.snackbar(
                        //   'CarbonStock',
                        //   'Update Plot Success!',
                        //   backgroundColor: colorSecondaryGrey1,
                        // );

                        // sleep(const Duration(seconds: 2));
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorButtonAccentGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        fixedSize: Size(1.sw, 40.h),
                      ),
                      child: Text(
                        'Konfirmasi',
                        style: TextStyle(
                          color: colorPrimaryWhite,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            buildMapView(),
          ],
        ),
      ),
    );
  }

  Card buildCardPlotForm() {
    _plotLatController.text = widget.plotData.latitude.toString();
    _plotLngController.text = widget.plotData.longitude.toString();
    _plotSizeController.text = widget.plotData.plot.ukuranPlot.toString();

    return Card(
      elevation: 0.5,
      color: colorPrimaryWhite,
      shadowColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(8.r),
        child: Form(
          key: _addPlotFormKey,
          child: Column(
            children: [
              SizedBox(
                width: 1.sw,
                child: Text(
                  'Latitude Plot',
                  style: TextStyle(
                    color: colorPrimaryBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              TextFormField(
                controller: _plotLatController,
                enabled: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: colorSecondaryGrey2,
                  contentPadding: EdgeInsets.all(8.r),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      color: colorSecondaryGrey1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              SizedBox(
                width: 1.sw,
                child: Text(
                  'Longitude Plot',
                  style: TextStyle(
                    color: colorPrimaryBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              TextFormField(
                controller: _plotLngController,
                enabled: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: colorSecondaryGrey2,
                  contentPadding: EdgeInsets.all(8.r),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      color: colorSecondaryGrey1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              SizedBox(
                width: 1.sw,
                child: Text(
                  'Ukuran Plot',
                  style: TextStyle(
                    color: colorPrimaryBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              TextFormField(
                controller: _plotSizeController,
                keyboardType: TextInputType.text,
                enabled: false,
                // validator: (value) => value == null || value.isEmpty
                //     ? 'Tidak boleh kosong'
                //     : null,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.r),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      color: colorSecondaryGrey1,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(),
                  hintText: 'Masukkan Ukuran Plot',
                  hintStyle: const TextStyle(
                    color: colorSecondaryGrey1,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              // SizedBox(
              //   width: 1.sw,
              //   child: Text(
              //     'Rataan Biomasa',
              //     style: TextStyle(
              //       color: colorPrimaryBlack,
              //       fontWeight: FontWeight.w700,
              //       fontSize: 16.sp,
              //     ),
              //   ),
              // ),
              // SizedBox(height: 4.h),
              // TextFormField(
              //   controller: _biomassAvgController,
              //   keyboardType: TextInputType.number,
              //   validator: (value) => value == null || value.isEmpty
              //       ? 'Tidak boleh kosong'
              //       : null,
              //   decoration: InputDecoration(
              //     contentPadding: EdgeInsets.all(8.r),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(8.r),
              //       borderSide: const BorderSide(
              //         color: colorSecondaryGrey1,
              //       ),
              //     ),
              //     focusedBorder: const OutlineInputBorder(),
              //     hintText: 'Masukkan Rataan Biomasa',
              //     hintStyle: const TextStyle(
              //       color: colorSecondaryGrey1,
              //     ),
              //   ),
              // ),
              // SizedBox(height: 4.h),
              // SizedBox(
              //   width: 1.sw,
              //   child: Text(
              //     'Standar Deviasi Biomasa',
              //     style: TextStyle(
              //       color: colorPrimaryBlack,
              //       fontWeight: FontWeight.w700,
              //       fontSize: 16.sp,
              //     ),
              //   ),
              // ),
              // SizedBox(height: 4.h),
              // TextFormField(
              //   controller: _biomassStdController,
              //   keyboardType: TextInputType.number,
              //   validator: (value) => value == null || value.isEmpty
              //       ? 'Tidak boleh kosong'
              //       : null,
              //   decoration: InputDecoration(
              //     contentPadding: EdgeInsets.all(8.r),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(8.r),
              //       borderSide: const BorderSide(
              //         color: colorSecondaryGrey1,
              //       ),
              //     ),
              //     focusedBorder: const OutlineInputBorder(),
              //     hintText: 'Masukkan STD Biomasa',
              //     hintStyle: const TextStyle(
              //       color: colorSecondaryGrey1,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildMapView() {
    return SizedBox(
      width: 1.sw,
      height: 120.h,
      child: MapboxMap(
        accessToken: dotenv.env['MAPBOX_ACCESS_TOKEN'],
        dragEnabled: false,
        tiltGesturesEnabled: false,
        rotateGesturesEnabled: false,
        onMapCreated: _onMapCreated,
        cameraTargetBounds: CameraTargetBounds(
          LatLngBounds(
            southwest: LatLng(currentLatLng.latitude, currentLatLng.longitude),
            northeast: LatLng(currentLatLng.latitude, currentLatLng.longitude),
          ),
        ),
        onMapClick: (point, coordinates) {
          Get.snackbar(
            'CarbonRangers',
            'Map bukan untuk memberi titik custom!',
            backgroundColor: colorSecondaryGrey1,
          );
        },
        initialCameraPosition: CameraPosition(target: currentLatLng, zoom: 15),
      ),
    );
  }
}
