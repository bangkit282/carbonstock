part of '../views.dart';

class LoginScreenViews extends StatefulWidget {
  const LoginScreenViews({super.key});

  @override
  State<LoginScreenViews> createState() => _LoginScreenViewsState();
}

class _LoginScreenViewsState extends State<LoginScreenViews> {
  final _loginKey = GlobalKey<FormState>();

  final AuthController _controller = Get.find();
  final SharedPreferenceService _sharedPrefs = SharedPreferenceService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // ============= For register =============
  // final Uri _url = Uri.parse('http://carbonstock.live/register');

  // Future<void> _launchUrl() async {
  //   if (!await launchUrl(_url)) {
  //     Get.snackbar('CarbonRangers', 'Gagal meluncurkan url: $_url');
  //   }
  // }
  // ============= For Register =============

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimaryBackground,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Selamat Datang',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: colorPrimaryWhite,
            fontSize: 28.sp,
          ),
        ),
        backgroundColor: colorSecondaryGreen,
        toolbarHeight: 112.h,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 32.h),
                buildLoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginForm() {
    return SizedBox(
      height: 1.sh,
      child: Form(
        key: _loginKey,
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Text(
              'Login with your account',
              style: TextStyle(fontSize: 22.sp),
            ),
            SizedBox(height: 16.h),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email tidak boleh kosong!';
                }

                return null;
              },
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: const TextStyle(color: colorSecondaryGrey2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(
                    color: colorSecondaryGrey1,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password tidak boleh kosong!';
                }

                return null;
              },
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(color: colorSecondaryGrey2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(
                    color: colorSecondaryGrey1,
                  ),
                ),
              ),
            ),
            SizedBox(height: 220.h),
            ElevatedButton(
              onPressed: () {
                if (_loginKey.currentState!.validate()) {
                  String email = emailController.text;
                  String password = passwordController.text;

                  _controller.postLogin(email: email, password: password).then(
                    (value) {
                      if (value.status == true) {
                        d.log(value.data.toString(), name: 'login');

                        UserModel user = UserModel(
                          id: value.data['id'],
                          nama: value.data['nama'],
                          tempatLahir: value.data['tempatLahir'],
                          tanggalLahir: value.data['tanggalLahir'],
                          telepon: value.data['telepon'],
                          jenisKelamin: value.data['jenisKelamin'],
                          email: value.data['email'],
                          password: value.data['password'],
                          createdAt: value.data['createdAt'],
                          updatedAt: value.data['updatedAt'],
                          deletedAt: value.data['deletedAt'],
                          isActive: value.data['isActive'],
                          role: value.data['role'],
                        );

                        _controller.insertUser(user);

                        Get.snackbar(
                          'CarbonRangers',
                          'Welcome back, ${user.nama}!',
                          backgroundColor: colorSecondaryGrey1,
                        );

                        _sharedPrefs.putInt('isLogin', 1);
                        Get.offAll(() => const PlotAreaScreenViews());
                      } else {
                        Get.snackbar(
                          'CarbonRangers',
                          value.message,
                          backgroundColor: Colors.redAccent,
                          colorText: colorPrimaryWhite,
                        );
                      }
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorButtonAccentGreen,
                fixedSize: Size(1.sw, 45.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                elevation: 0.5,
              ),
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: colorPrimaryWhite,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
              ),
            ),
            // SizedBox(height: 16.h),
            // GestureDetector(
            //   onTap: _launchUrl,
            //   child: RichText(
            //     text: TextSpan(
            //       children: [
            //         TextSpan(
            //           text: 'Belum memiliki akun?',
            //           style: TextStyle(
            //             color: colorSecondaryGrey3,
            //             fontSize: 14.sp,
            //           ),
            //         ),
            //         TextSpan(
            //           text: ' SIGN UP',
            //           style: TextStyle(
            //             color: colorSecondaryGreen,
            //             fontSize: 14.sp,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
