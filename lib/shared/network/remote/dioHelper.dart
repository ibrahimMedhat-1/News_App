import 'package:dio/dio.dart';

// https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
// https://newsapi.org
// v2/top-headlines
// country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
class DioHelper {
  static Dio? dio;

  static init() {
    //https://workshop.orangedigitalcenteregypt.com/api/v1/login
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
}
