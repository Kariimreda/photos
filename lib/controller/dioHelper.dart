
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
   var baseUrl = "https://jsonplaceholder.typicode.com/";
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com/",
        receiveDataWhenStatusError: true,
      ),
    );

  }

  static Future<Response> getData({
    required String url,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": 'Bearer $token',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    String? token,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": 'Bearer $token',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> postForm({
    required String url,
    required FormData data,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": 'Bearer $token',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> patchData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": 'Bearer $token',
    };
    return await dio.patch(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": 'Bearer $token',
    };
    return await dio.delete(
      url,
      data: data,
      queryParameters: query,
    );
  }
}
