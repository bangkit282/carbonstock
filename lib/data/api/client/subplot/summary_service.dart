import 'dart:developer';

import 'package:carbonstock/utils/api_endpoint.dart';
import 'package:carbonstock/data/api/response/failed.dart';
import 'package:carbonstock/data/api/response/subplot/subplot_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SummarySubplotService {
  final Dio dio;

  SummarySubplotService({required this.dio});

  Future<Either<Failed, SubPlot>> postSubPlotA({
    required String uuid,
    required String plotId,
    required String areaName,
    required String plotName,
    required DateTime updatedAt,
  }) async {
    Failed failure;

    FormData formData = FormData.fromMap({
      'uuid': uuid,
      'plot_id': plotId,
      'area_name': areaName,
      'plot_name': plotName,
      'subplot_a_photo_url': '',
      'updated_at': updatedAt,
    });

    try {
      final response = await dio.postUri(
        Uri.http(
          apiBaseUrl,
          apiSubplotA,
        ),
        data: formData,
        options: Options(
          validateStatus: (int? status) {
            return status != null;
            // return status != null && status >= 200 && status < 300;
          },
        ),
      );

      // log(response.statusMessage.toString(), name: 'summary-subplot-a');

      if (response.statusCode == 200) {
        return Right(subPlotFromJson(response.data));
      } else {
        throw '${response.statusCode}: ${response.statusMessage}';
      }
    } on DioException catch (ex) {
      failure = Failed(ex.toString());
      return Left(failure);
    }
  }

  Future<Either<Failed, SubPlot>> postSubPlotASemai({
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
    Failed failure;

    FormData formData = FormData.fromMap({
      'uuid': uuid,
      'uuid_subplot_a': plotAuuid,
      'plot_id': plotId,
      'area_name': areaName,
      'plot_name': plotName,
      'basah_total': basahTotal,
      'basah_sample': basahSample,
      'kering_total': keringTotal,
      'kering_sample': keringSample,
      'carbon_value': carbonValue,
      'carbon_absorb': carbonAbsorb,
      'updated_at': updatedAt,
    });

    try {
      final response = await dio.postUri(
        Uri.http(apiBaseUrl, apiSubplotASemai),
        data: formData,
      );

      if (response.statusCode == 200) {
        // log(response.data, name: 'authservice-login');
        return Right(subPlotFromJson(response.data));
      } else {
        throw '${response.statusCode}: ${response.statusMessage}';
      }
    } on DioException catch (ex) {
      failure = Failed(ex.toString());
      return Left(failure);
    }
  }

  Future<Either<Failed, SubPlot>> postSubPlotASeresah({
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
    Failed failure;

    FormData formData = FormData.fromMap({
      'uuid': uuid,
      'uuid_subplot_a': plotAuuid,
      'plot_id': plotId,
      'area_name': areaName,
      'plot_name': plotName,
      'basah_total': basahTotal,
      'basah_sample': basahSample,
      'kering_total': keringTotal,
      'kering_sample': keringSample,
      'carbon_value': carbonValue,
      'carbon_absorb': carbonAbsorb,
      'updated_at': updatedAt,
    });

    try {
      final response = await dio.postUri(
        Uri.http(apiBaseUrl, apiSubplotASeresah),
        data: formData,
      );

      if (response.statusCode == 200) {
        // log(response.data, name: 'authservice-login');
        return Right(subPlotFromJson(response.data));
      } else {
        throw '${response.statusCode}: ${response.statusMessage}';
      }
    } on DioException catch (ex) {
      failure = Failed(ex.toString());
      return Left(failure);
    }
  }

  Future<Either<Failed, SubPlot>> postSubPlotATumbuhan({
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
    Failed failure;

    FormData formData = FormData.fromMap({
      'uuid': uuid,
      'uuid_subplot_a': plotAuuid,
      'plot_id': plotId,
      'area_name': areaName,
      'plot_name': plotName,
      'basah_total': basahTotal,
      'basah_sample': basahSample,
      'kering_total': keringTotal,
      'kering_sample': keringSample,
      'carbon_value': carbonValue,
      'carbon_absorb': carbonAbsorb,
      'updated_at': updatedAt,
    });

    try {
      final response = await dio.postUri(
        Uri.http(apiBaseUrl, apiSubplotATumbuhan),
        data: formData,
      );

      if (response.statusCode == 200) {
        // log(response.data, name: 'authservice-login');
        return Right(subPlotFromJson(response.data));
      } else {
        throw '${response.statusCode}: ${response.statusMessage}';
      }
    } on DioException catch (ex) {
      failure = Failed(ex.toString());
      return Left(failure);
    }
  }

  Future<Either<Failed, SubPlot>> postSubPlotB({
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
    Failed failure;

    FormData formData = FormData.fromMap({
      'uuid': uuid,
      'plot_id': plotId,
      'area_name': areaName,
      'plot_name': plotName,
      'local_name': localName,
      'bio_name': bioName,
      'keliling': keliling,
      'diameter': diameter,
      'kerapatan_kayu': kerapatankayu,
      'biomass': biomass,
      'carbon_value': carbonValue,
      'carbon_absorb': carbonAbsorb,
      'subplot_b_photo_url': '',
      'updated_at': updatedAt,
    });

    try {
      final response = await dio.postUri(
        Uri.http(apiBaseUrl, apiSubplotB),
        data: formData,
      );

      if (response.statusCode == 200) {
        // log(response.data, name: 'authservice-login');
        return Right(subPlotFromJson(response.data));
      } else {
        throw '${response.statusCode}: ${response.statusMessage}';
      }
    } on DioException catch (ex) {
      failure = Failed(ex.toString());
      return Left(failure);
    }
  }

  Future<Either<Failed, SubPlot>> postSubPlotC({
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
    Failed failure;

    FormData formData = FormData.fromMap({
      'uuid': uuid,
      'plot_id': plotId,
      'area_name': areaName,
      'plot_name': plotName,
      'local_name': localName,
      'bio_name': bioName,
      'keliling': keliling,
      'diameter': diameter,
      'kerapatan_kayu': kerapatankayu,
      'biomass': biomass,
      'carbon_value': carbonValue,
      'carbon_absorb': carbonAbsorb,
      'subplot_c_photo_url': '',
      'updated_at': updatedAt,
    });

    try {
      final response = await dio.postUri(
        Uri.http(apiBaseUrl, apiSubplotC),
        data: formData,
      );

      if (response.statusCode == 200) {
        // log(response.data, name: 'authservice-login');
        return Right(subPlotFromJson(response.data));
      } else {
        throw '${response.statusCode}: ${response.statusMessage}';
      }
    } on DioException catch (ex) {
      failure = Failed(ex.toString());
      return Left(failure);
    }
  }

  Future<Either<Failed, SubPlot>> postSubPlotD({
    required String uuid,
    required String plotId,
    required String areaName,
    required String plotName,
    required DateTime updatedAt,
  }) async {
    Failed failure;

    FormData formData = FormData.fromMap({
      'uuid': uuid,
      'plot_id': plotId,
      'area_name': areaName,
      'plot_name': plotName,
      'subplot_d_photo_url': '',
      'updated_at': updatedAt,
    });

    try {
      final response = await dio.postUri(
        Uri.http(
          apiBaseUrl,
          apiSubplotD,
        ),
        data: formData,
        options: Options(
          validateStatus: (int? status) {
            return status != null;
            // return status != null && status >= 200 && status < 300;
          },
        ),
      );

      log(response.statusMessage.toString(), name: 'summary-subplot-d');

      if (response.statusCode == 200) {
        return Right(subPlotFromJson(response.data));
      } else {
        throw '${response.statusCode}: ${response.statusMessage}';
      }
    } on DioException catch (ex) {
      failure = Failed(ex.toString());
      return Left(failure);
    }
  }

  Future<Either<Failed, SubPlot>> postSubPlotDPohon({
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
    Failed failure;

    FormData formData = FormData.fromMap({
      'uuid': uuid,
      'uuid_subplot_d': plotDuuid,
      'plot_id': plotId,
      'area_name': areaName,
      'plot_name': plotName,
      'local_name': localName,
      'bio_name': bioName,
      'keliling': keliling,
      'diameter': diameter,
      'kerapatan_kayu': kerapatankayu,
      'biomass': biomass,
      'carbon_value': carbonValue,
      'carbon_absorb': carbonAbsorb,
      'updated_at': updatedAt,
    });

    try {
      final response = await dio.postUri(
        Uri.http(apiBaseUrl, apiSubplotDPohon),
        data: formData,
      );

      if (response.statusCode == 200) {
        // log(response.data, name: 'authservice-login');
        return Right(subPlotFromJson(response.data));
      } else {
        throw '${response.statusCode}: ${response.statusMessage}';
      }
    } on DioException catch (ex) {
      failure = Failed(ex.toString());
      return Left(failure);
    }
  }

  Future<Either<Failed, SubPlot>> postSubPlotDNekromas({
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
    Failed failure;

    FormData formData = FormData.fromMap({
      'uuid': uuid,
      'uuid_subplot_d': plotDuuid,
      'plot_id': plotId,
      'area_name': areaName,
      'plot_name': plotName,
      'diameter_pangkal': diameterPangkal,
      'diameter_ujung': diameterUjung,
      'panjang': panjang,
      'volume': volume,
      'biomass': biomass,
      'carbon_value': carbonValue,
      'carbon_absorb': carbonAbsorb,
      'updated_at': updatedAt,
    });

    try {
      final response = await dio.postUri(
        Uri.http(apiBaseUrl, apiSubplotDNekromas),
        data: formData,
      );

      if (response.statusCode == 200) {
        // log(response.data, name: 'authservice-login');
        return Right(subPlotFromJson(response.data));
      } else {
        throw '${response.statusCode}: ${response.statusMessage}';
      }
    } on DioException catch (ex) {
      failure = Failed(ex.toString());
      return Left(failure);
    }
  }

  Future<Either<Failed, SubPlot>> postSubPlotDTanah({
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
    Failed failure;

    FormData formData = FormData.fromMap({
      'uuid': uuid,
      'uuid_subplot_d': plotDuuid,
      'plot_id': plotId,
      'area_name': areaName,
      'plot_name': plotName,
      'kedalaman_sample': kedalamanSample,
      'berat_jenis': beratJenis,
      'organik_c_tanah': organikCTanah,
      'carbon_gr_cm': carbonGrCm,
      'carbon_ton_ha': carbonTonHa,
      'carbon_ton': carbonTon,
      'carbon_absorb': carbonAbsorb,
      'updated_at': updatedAt,
    });

    try {
      final response = await dio.postUri(
        Uri.http(apiBaseUrl, apiSubplotDTanah),
        data: formData,
      );

      if (response.statusCode == 200) {
        // log(response.data, name: 'authservice-login');
        return Right(subPlotFromJson(response.data));
      } else {
        throw '${response.statusCode}: ${response.statusMessage}';
      }
    } on DioException catch (ex) {
      failure = Failed(ex.toString());
      return Left(failure);
    }
  }
}
