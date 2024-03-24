part of '../../views.dart';

class AddAreaScreenViews extends StatefulWidget {
  const AddAreaScreenViews({super.key});

  @override
  State<AddAreaScreenViews> createState() => _AddAreaScreenViewsState();
}

class _AddAreaScreenViewsState extends State<AddAreaScreenViews> {
  final _addAreaFormKey = GlobalKey<FormState>(debugLabel: 'add-area');

  TextEditingController _areaNameController = TextEditingController();
  TextEditingController _locationNameController = TextEditingController();
  TextEditingController _notationTeam = TextEditingController();
  TextEditingController _imageURLController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
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
            Card(
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: Form(
                  key: _addAreaFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _areaNameController,
                        decoration: InputDecoration(
                          
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
