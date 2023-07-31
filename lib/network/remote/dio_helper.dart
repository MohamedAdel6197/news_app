import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://newsapi.org/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getNewsData(
      {required String path, required dynamic query}) async {
    return await dio!.get(
      path,
      queryParameters: query,
    );
  }
}
