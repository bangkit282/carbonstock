import 'dart:developer';

import 'package:carbonstock/data/api/client/plot/hamparan_service.dart';
import 'package:carbonstock/data/api/response/plot/hamparan_response.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HamparanController extends GetxController {
  final _hamparanService = HamparanService(dio: Dio());
  Hamparan hamparan = Hamparan();

  Future getAllHamparan() async {
    final response = await _hamparanService.getAllHamparan();

    response.fold(
      (l) {
        log(l.message, name: 'hamparan-controller');
      },
      (r) {
        hamparan = r;
      }
    );

    return hamparan;
  }
}
