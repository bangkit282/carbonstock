import 'package:carbonstock/data/api/response/failed.dart';
import 'package:carbonstock/data/api/response/plot/plot_response.dart';
import 'package:carbonstock/utils/api_endpoint.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PlotService {
  final Dio dio;

  PlotService({required this.dio});

  Future<Either<Failed, Plot>> getAllPlot() async {
    Failed failure;

    try {
      final response = await dio.getUri(
        Uri.http(
          apiBaseUrl,
          apiPlot,
        ),
      );

      if (response.statusCode == 200) {
        return Right(plotFromJson(response.data));
      } else {
        throw '${response.statusCode}: ${response.statusMessage}';
      }
    } on DioException catch (ex) {
      failure = Failed(ex.toString());
      return Left(failure);
    }
  }
}
