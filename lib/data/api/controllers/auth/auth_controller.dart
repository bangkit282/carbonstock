import 'dart:developer';

import 'package:carbonstock/data/api/client/auth/auth_service.dart';
import 'package:carbonstock/data/api/response/auth/auth_response.dart';
import 'package:carbonstock/data/local/localdb/auth/auth_db.dart';
import 'package:carbonstock/data/local/model/auth/user_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AuthController extends GetxController {
  final versionNum = ''.obs;
  final authService = AuthService(dio: Dio());

  final contactAuthBox = AuthDB.authBox;

  Future<void> initPackage() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    versionNum.value = info.version;

    log(versionNum.value, name: 'version-number');
  }

  Future<Login> postLogin({
    required String email,
    required String password,
  }) async {
    late Login res;

    final response = await authService.postLogin(
      email: email,
      password: password,
    );

    response.fold(
      (l) {
        log(l.message, name: 'authcontroller-login');
      },
      (r) {
        res = r;
      },
    );

    return res;
  }

  Future<void> insertUser(UserModel user) async {
    final userModel = UserModel(
      id: user.id,
      nama: user.nama,
      tempatLahir: user.tempatLahir,
      tanggalLahir: user.tanggalLahir,
      telepon: user.telepon,
      jenisKelamin: user.jenisKelamin,
      email: user.email,
      password: user.password,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
      deletedAt: user.deletedAt,
      isActive: user.isActive,
      role: user.role,
      token: user.token,
      listplot: user.listplot,
    );

    await contactAuthBox.add(userModel);
  }

  UserModel getSingleUser(String id) {
    return AuthDB.getSpecificUser(id);
  }
}
