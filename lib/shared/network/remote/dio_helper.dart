

import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://mighty-bayou-95171.herokuapp.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
    dynamic type,
    dynamic pId,
  }) async {
    dio!.options.headers = {
      'language': lang,
      'Content-Type': 'application/json',
      'x-access-token': token ?? '',
      'type': type ?? '',
      'productid': pId ?? '',
    };

    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'language': lang,
      'Content-Type': 'application/json',
      'x-access-token': token ?? '',
    };

    return await dio!.post(url, queryParameters: query, data: data);
  }
}
