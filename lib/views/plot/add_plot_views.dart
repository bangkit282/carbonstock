part of '../views.dart';

class AddPlotScreenViews extends StatefulWidget {
  const AddPlotScreenViews({super.key});

  @override
  State<AddPlotScreenViews> createState() => _AddPlotScreenViewsState();
}

class _AddPlotScreenViewsState extends State<AddPlotScreenViews> {
  final PlotController _plotController = Get.find();
  final _addPlotFormKey = GlobalKey<FormState>(debugLabel: 'add-plot');

  final TextEditingController _plotLatController = TextEditingController();
  final TextEditingController _plotLngController = TextEditingController();
  final TextEditingController _plotSizeController = TextEditingController();
  final TextEditingController _biomassAvgController = TextEditingController();
  final TextEditingController _biomassStdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimaryBackground,
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Plot Area',
                style: TextStyle(
                  fontSize: 26.sp,
                  color: colorPrimaryBlack,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Masukkan Plot Area yang akan dicatat',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: colorPrimaryBlack,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 16.h),
              buildCardPlotForm(),
              SizedBox(height: 16.h),
              Container(
                margin: EdgeInsets.only(bottom: 24.h),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_addPlotFormKey.currentState!.validate()) {
                      String latitude = _plotLatController.text;
                      String longitude = _plotLngController.text;
                      String size = _plotSizeController.text;
                      String biomassAvg = _biomassAvgController.text;
                      String biomassStd = _biomassStdController.text;

                      PlotModel plotModel = PlotModel(
                        plotLat: double.parse(latitude),
                        plotLng: double.parse(longitude),
                        plotSize: double.parse(size),
                        biomassAvg: double.parse(biomassAvg),
                        biomassStd: double.parse(biomassStd),
                      );

                      await _plotController.insertPlot(plotModel);

                      Get.snackbar(
                        'CarbonStock',
                        'Add Plot Success!',
                        backgroundColor: colorSecondaryGreen,
                        colorText: colorPrimaryWhite,
                      );

                      sleep(const Duration(seconds: 2));
                      Get.off(() => const PageSetup());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorButtonAccentGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    fixedSize: Size(1.sw, 40.h),
                  ),
                  child: Text(
                    'Simpan',
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
      ),
    );
  }

  Card buildCardPlotForm() {
    return Card(
      elevation: 0.5,
      color: colorPrimaryWhite,
      shadowColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(16.r),
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
              SizedBox(height: 4.h),
              TextFormField(
                controller: _plotLatController,
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty
                    ? 'Tidak boleh kosong'
                    : null,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.r),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      color: colorSecondaryGrey1,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(),
                  hintText: 'Masukkan Latitude Plot',
                  hintStyle: const TextStyle(
                    color: colorSecondaryGrey1,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
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
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty
                    ? 'Tidak boleh kosong'
                    : null,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.r),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      color: colorSecondaryGrey1,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(),
                  hintText: 'Masukkan Longitude Plot',
                  hintStyle: const TextStyle(
                    color: colorSecondaryGrey1,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
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
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty
                    ? 'Tidak boleh kosong'
                    : null,
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
              SizedBox(height: 16.h),
              SizedBox(
                width: 1.sw,
                child: Text(
                  'Rataan Biomasa',
                  style: TextStyle(
                    color: colorPrimaryBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              TextFormField(
                controller: _biomassAvgController,
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty
                    ? 'Tidak boleh kosong'
                    : null,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.r),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      color: colorSecondaryGrey1,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(),
                  hintText: 'Masukkan Rataan Biomasa',
                  hintStyle: const TextStyle(
                    color: colorSecondaryGrey1,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: 1.sw,
                child: Text(
                  'Standar Deviasi Biomasa',
                  style: TextStyle(
                    color: colorPrimaryBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              TextFormField(
                controller: _biomassStdController,
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty
                    ? 'Tidak boleh kosong'
                    : null,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.r),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      color: colorSecondaryGrey1,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(),
                  hintText: 'Masukkan STD Biomasa',
                  hintStyle: const TextStyle(
                    color: colorSecondaryGrey1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
