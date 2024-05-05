import 'package:carbonstock/utils/api_endpoint.dart';
import 'package:carbonstock/data/api/response/auth/auth_response.dart';
import 'package:carbonstock/data/api/response/failed.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthService {
  final Dio dio;

  AuthService({required this.dio});

  Future<Either<Failed, Login>> postLogin({
    required String email,
    required String password,
  }) async {
    Failed failure;
    FormData formData = FormData.fromMap({
      'email': email,
      'password': password,
    });

    try {
      final response = await dio.postUri(
        Uri.http(
          apiBaseUrl,
          apiLoginUrl,
        ),
        data: formData,
      );

      if (response.statusCode == 200) {
        // log(response.data, name: 'authservice-login');
        return Right(loginFromJson(response.data));
      } else {
        throw '${response.statusCode}: ${response.statusMessage}';
      }
    } on DioException catch (ex) {
      failure = Failed(ex.toString());
      return Left(failure);
    }
  }
}
