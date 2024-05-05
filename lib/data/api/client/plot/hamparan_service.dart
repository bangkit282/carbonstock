import 'package:carbonstock/data/api/response/failed.dart';
import 'package:carbonstock/data/api/response/plot/hamparan_response.dart';
import 'package:carbonstock/utils/api_endpoint.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HamparanService {
  final Dio dio;

  HamparanService({required this.dio});

  Future<Either<Failed, Hamparan>> getAllHamparan() async {
    Failed failure;

    try {
      final response = await dio.getUri(
        Uri.http(
          apiBaseUrl,
          apiHamparan,
        ),
      );

      if (response.statusCode == 200) {
        return Right(hamparanFromJson(response.data));
      } else {
        throw '${response.statusCode}: ${response.statusMessage}';
      }
    } on DioException catch (ex) {
      failure = Failed(ex.toString());
      return Left(failure);
    }
  }
}