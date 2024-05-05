import 'dart:developer';

import 'package:carbonstock/data/api/client/subplot/summary_service.dart';
import 'package:carbonstock/data/api/response/subplot/subplot_response.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SummarySubplotController extends GetxController {
  final summaryService = SummarySubplotService(dio: Dio());

  Future postSubPlotA({
    required String uuid,
    required String plotId,
    required String areaName,
    required String plotName,
    required DateTime updatedAt,
  }) async {
    var res;

    final response = await summaryService.postSubPlotA(
      uuid: uuid,
      plotId: plotId,
      areaName: areaName,
      plotName: plotName,
      updatedAt: updatedAt,
    );

    response.fold((l) {
      log(l.message, name: 'summary-controller-a');
    }, (r) {
      res = r;
    });

    return res;
  }

  Future postSubPlotAParts({
    required String part,
    required String uuid,
    required String plotAuuid,
    required String plotId,
    required String areaName,
    required String plotName,
    required double basahTotal,
    required double basahSample,
    required double keringTotal,
    required double keringSample,
    required double carbonValue,
    required double carbonAbsorb,
    required DateTime updatedAt,
  }) async {
    var res;

    if (part == 'Semai') {
      final response = await summaryService.postSubPlotASemai(
        uuid: uuid,
        plotAuuid: plotAuuid,
        plotId: plotId,
        areaName: areaName,
        plotName: plotName,
        basahTotal: basahTotal,
        basahSample: basahSample,
        keringTotal: keringTotal,
        keringSample: keringSample,
        carbonValue: carbonValue,
        carbonAbsorb: carbonAbsorb,
        updatedAt: updatedAt,
      );

      response.fold((l) {
        log(l.message, name: 'summary-controller-semai');
      }, (r) {
        res = r;
      });

      // return res;
    }

    if (part == 'Seresah') {
      final response = await summaryService.postSubPlotASeresah(
        uuid: uuid,
        plotAuuid: plotAuuid,
        plotId: plotId,
        areaName: areaName,
        plotName: plotName,
        basahTotal: basahTotal,
        basahSample: basahSample,
        keringTotal: keringTotal,
        keringSample: keringSample,
        carbonValue: carbonValue,
        carbonAbsorb: carbonAbsorb,
        updatedAt: updatedAt,
      );

      response.fold((l) {
        log(l.message, name: 'summary-controller-seresah');
      }, (r) {
        res = r;
      });

      // return res;
    }

    if (part == 'Bawah') {
      final response = await summaryService.postSubPlotATumbuhan(
        uuid: uuid,
        plotAuuid: plotAuuid,
        plotId: plotId,
        areaName: areaName,
        plotName: plotName,
        basahTotal: basahTotal,
        basahSample: basahSample,
        keringTotal: keringTotal,
        keringSample: keringSample,
        carbonValue: carbonValue,
        carbonAbsorb: carbonAbsorb,
        updatedAt: updatedAt,
      );

      response.fold((l) {
        log(l.message, name: 'summary-controller-tumbuhan');
      }, (r) {
        res = r;
      });

      // return res;
    }

    log('postSubPlotAPart: $res', name: 'summary-controller');
    return res;
  }

  Future postSubPlotB({
    required String uuid,
    required String plotId,
    required String areaName,
    required String plotName,
    required String localName,
    required String bioName,
    required double keliling,
    required double diameter,
    required double kerapatankayu,
    required double biomass,
    required double carbonValue,
    required double carbonAbsorb,
    required DateTime updatedAt,
  }) async {
    var res;

    final response = await summaryService.postSubPlotB(
      uuid: uuid,
      plotId: plotId,
      areaName: areaName,
      plotName: plotName,
      localName: localName,
      bioName: bioName,
      keliling: keliling,
      diameter: diameter,
      kerapatankayu: kerapatankayu,
      biomass: biomass,
      carbonValue: carbonValue,
      carbonAbsorb: carbonAbsorb,
      updatedAt: updatedAt,
    );

    response.fold((l) {
      log(l.message, name: 'summary-controller-b');
    }, (r) {
      res = r;
    });

    log('postSubPlotB: $res', name: 'summary-controller');
    return res;
  }

  Future postSubPlotC({
    required String uuid,
    required String plotId,
    required String areaName,
    required String plotName,
    required String localName,
    required String bioName,
    required double keliling,
    required double diameter,
    required double kerapatankayu,
    required double biomass,
    required double carbonValue,
    required double carbonAbsorb,
    required DateTime updatedAt,
  }) async {
    late SubPlot res;

    final response = await summaryService.postSubPlotC(
      uuid: uuid,
      plotId: plotId,
      areaName: areaName,
      plotName: plotName,
      localName: localName,
      bioName: bioName,
      keliling: keliling,
      diameter: diameter,
      kerapatankayu: kerapatankayu,
      biomass: biomass,
      carbonValue: carbonValue,
      carbonAbsorb: carbonAbsorb,
      updatedAt: updatedAt,
    );

    response.fold((l) {
      log(l.message, name: 'summary-controller-c');
    }, (r) {
      res = r;
    });

    log('postSubPlotC: $res', name: 'summary-controller');
    return res;
  }

  Future postSubPlotD({
    required String uuid,
    required String plotId,
    required String areaName,
    required String plotName,
    required DateTime updatedAt,
  }) async {
    var res;

    final response = await summaryService.postSubPlotD(
      uuid: uuid,
      plotId: plotId,
      areaName: areaName,
      plotName: plotName,
      updatedAt: updatedAt,
    );

    response.fold((l) {
      log(l.message, name: 'summary-controller-d');
    }, (r) {
      res = r;
    });

    log('postSubPlotD: $res', name: 'summary-controller');
    return res;
  }

  Future postSubPlotDPohon({
    required String uuid,
    required String plotDuuid,
    required String plotId,
    required String areaName,
    required String plotName,
    required String localName,
    required String bioName,
    required double keliling,
    required double diameter,
    required double kerapatankayu,
    required double biomass,
    required double carbonValue,
    required double carbonAbsorb,
    required DateTime updatedAt,
  }) async {
    var res;

    final response = await summaryService.postSubPlotDPohon(
      uuid: uuid,
      plotDuuid: plotDuuid,
      plotId: plotId,
      areaName: areaName,
      plotName: plotName,
      localName: localName,
      bioName: bioName,
      keliling: keliling,
      diameter: diameter,
      kerapatankayu: kerapatankayu,
      biomass: biomass,
      carbonValue: carbonValue,
      carbonAbsorb: carbonAbsorb,
      updatedAt: updatedAt,
    );

    response.fold((l) {
      log(l.message, name: 'summary-controller-pohon');
    }, (r) {
      res = r;
    });

    log('postSubPlotDPohon: $res', name: 'summary-controller');
    return res;
  }

  Future postSubPlotDNekromas({
    required String uuid,
    required String plotDuuid,
    required String plotId,
    required String areaName,
    required String plotName,
    required double diameterPangkal,
    required double diameterUjung,
    required double panjang,
    required double volume,
    required double biomass,
    required double carbonValue,
    required double carbonAbsorb,
    required DateTime updatedAt,
  }) async {
    var res;

    final response = await summaryService.postSubPlotDNekromas(
      uuid: uuid,
      plotDuuid: plotDuuid,
      plotId: plotId,
      areaName: areaName,
      plotName: plotName,
      diameterPangkal: diameterPangkal,
      diameterUjung: diameterUjung,
      panjang: panjang,
      volume: volume,
      biomass: biomass,
      carbonValue: carbonValue,
      carbonAbsorb: carbonAbsorb,
      updatedAt: updatedAt,
    );

    response.fold((l) {
      log(l.message, name: 'summary-controller-nekromas');
    }, (r) {
      res = r;
    });

    log('postSubPlotDNekromas: $res', name: 'summary-controller');
    return res;
  }

  Future postSubPlotDTanah({
    required String uuid,
    required String plotDuuid,
    required String plotId,
    required String areaName,
    required String plotName,
    required double kedalamanSample,
    required double beratJenis,
    required double organikCTanah,
    required double carbonGrCm,
    required double carbonTonHa,
    required double carbonTon,
    required double carbonAbsorb,
    required DateTime updatedAt,
  }) async {
    var res;

    final response = await summaryService.postSubPlotDTanah(
      uuid: uuid,
      plotDuuid: plotDuuid,
      plotId: plotId,
      areaName: areaName,
      plotName: plotName,
      kedalamanSample: kedalamanSample,
      beratJenis: beratJenis,
      organikCTanah: organikCTanah,
      carbonGrCm: carbonGrCm,
      carbonTonHa: carbonTonHa,
      carbonTon: carbonTon,
      carbonAbsorb: carbonAbsorb,
      updatedAt: updatedAt,
    );

    response.fold((l) {
      log(l.message, name: 'summary-controller-tanah');
    }, (r) {
      res = r;
    });

    log('postSubPlotDTanah: $res', name: 'summary-controller');
    return res;
  }
}
