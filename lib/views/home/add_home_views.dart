part of '../views.dart';

class AddHomeScreenViews extends StatefulWidget {
  const AddHomeScreenViews({super.key});

  @override
  State<AddHomeScreenViews> createState() => _AddHomeScreenViewsState();
}

class _AddHomeScreenViewsState extends State<AddHomeScreenViews> {
  final AreaController _areaController = Get.find();
  final _addAreaFormKey = GlobalKey<FormState>(debugLabel: 'add-area');

  final TextEditingController _areaNameController = TextEditingController();
  final TextEditingController _locationNameController = TextEditingController();
  final TextEditingController _notationTeam = TextEditingController();

  List<DropdownMenuItem<String>> forestList = [
    const DropdownMenuItem(
      value: 'Hutan Homogen',
      child: Text('Hutan Homogen'),
    ),
    const DropdownMenuItem(
      value: 'Hutan Heterogen',
      child: Text('Hutan Heterogen'),
    ),
    const DropdownMenuItem(
      value: 'Hutan Konversi',
      child: Text('Hutan Konversi'),
    ),
  ];

  List<DropdownMenuItem<String>> landList = [
    const DropdownMenuItem(
      value: 'Tanah Air',
      child: Text('Tanah Air'),
    ),
    const DropdownMenuItem(
      value: 'Tanah Gempur',
      child: Text('Tanah Gempur'),
    ),
    const DropdownMenuItem(
      value: 'Tanah Liat',
      child: Text('Tanah Liat'),
    ),
    const DropdownMenuItem(
      value: 'Tanah Suci',
      child: Text('Tanah Suci'),
    ),
  ];

  String? _selectedForest = 'Hutan Homogen';
  String? _selectedLand = 'Tanah Air';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimaryBackground,
      appBar: AppBar(
        title: Text(
          'Area',
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
                'Info Area',
                style: TextStyle(
                  fontSize: 26.sp,
                  color: colorPrimaryBlack,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Masukkan Info Area yang akan dituju',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: colorPrimaryBlack,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 16.h),
              buildCardAreaForm(),
              SizedBox(height: 16.h),
              buildCardImagePicker(),
              SizedBox(height: 16.h),
              Container(
                margin: EdgeInsets.only(bottom: 24.h),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_addAreaFormKey.currentState!.validate()) {
                      String areaName = _areaNameController.text;
                      String locationName = _locationNameController.text;
                      String imageUrl = _areaController.pickedImage.value;
                      String forestType = _selectedForest!;
                      String landType = _selectedLand!;
                      DateTime createdAt = DateTime.now();
                      String notationTeam = _notationTeam.text;

                      AreaModel areaModel = AreaModel(
                        areaName: areaName,
                        areaLocation: locationName,
                        areaImage: imageUrl,
                        forestType: forestType,
                        landType: landType,
                        createdAt: createdAt,
                        notationTeam: notationTeam,
                      );

                      await _areaController.insertArea(areaModel);

                      Get.snackbar(
                        'CarbonStock',
                        'Add Area Success!',
                        backgroundColor: colorSecondaryGreen,
                        colorText: colorPrimaryWhite,
                      );

                      sleep(const Duration(seconds: 2));
                      Get.off(() => const HomeScreenViews());
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

  Card buildCardAreaForm() {
    return Card(
      elevation: 0.5,
      color: colorPrimaryWhite,
      shadowColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(16.r),
        padding: EdgeInsets.all(8.r),
        child: Form(
          key: _addAreaFormKey,
          child: Column(
            children: [
              SizedBox(
                width: 1.sw,
                child: Text(
                  'Area',
                  style: TextStyle(
                    color: colorPrimaryBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              TextFormField(
                controller: _areaNameController,
                keyboardType: TextInputType.text,
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
                  hintText: 'Masukkan Nama Area',
                  hintStyle: const TextStyle(
                    color: colorSecondaryGrey1,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: 1.sw,
                child: Text(
                  'Lokasi',
                  style: TextStyle(
                    color: colorPrimaryBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              TextFormField(
                controller: _locationNameController,
                keyboardType: TextInputType.text,
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
                  hintText: 'Masukkan Nama Lokasi',
                  hintStyle: const TextStyle(
                    color: colorSecondaryGrey1,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: 1.sw,
                child: Text(
                  'Jenis Hutan',
                  style: TextStyle(
                    color: colorPrimaryBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              DropdownButtonFormField(
                items: forestList,
                value: _selectedForest,
                onChanged: (value) {
                  setState(() {
                    _selectedForest = value;
                  });
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      color: colorSecondaryGrey1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      color: colorSecondaryGrey1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: 1.sw,
                child: Text(
                  'Jenis Tanah',
                  style: TextStyle(
                    color: colorPrimaryBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              DropdownButtonFormField(
                items: landList,
                value: _selectedLand,
                onChanged: (value) {
                  setState(() {
                    _selectedLand = value;
                  });
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      color: colorSecondaryGrey1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      color: colorSecondaryGrey1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: 1.sw,
                child: Text(
                  'Tim Pencatatan',
                  style: TextStyle(
                    color: colorPrimaryBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              TextFormField(
                controller: _notationTeam,
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
                  hintText: 'Masukkan Nama Tim Pencatatan',
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

  Card buildCardImagePicker() {
    return Card(
      elevation: 0.5,
      color: colorPrimaryWhite,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: GestureDetector(
        onTap: () {
          _areaController.pickImageFromGallery();
        },
        child: Container(
          width: 1.sw,
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 8.h,
          ),
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(8.r),
            child: Obx(
              () {
                return _areaController.pickedImage.value == ''
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 16.h),
                          Icon(
                            CupertinoIcons.folder_fill_badge_plus,
                            color: colorSecondaryGreen,
                            size: 120.sp,
                          ),
                          SizedBox(height: 8.h),
                          SizedBox(
                            width: 1.sw,
                            child: Text(
                              'Foto Wilayah maksimal 2MB',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: colorSecondaryGreen,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                        ],
                      )
                    : Center(
                        child: Container(
                          height: 120.h,
                          width: 200.w,
                          margin: EdgeInsets.all(16.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            image: DecorationImage(
                              image: FileImage(
                                File(
                                  _areaController.pickedImage.value,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
