import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiService extends GetxService {
  late final Dio dio;

  Future<ApiService> init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://teraservices.vercel.app/',
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );

    return this;
  }
}