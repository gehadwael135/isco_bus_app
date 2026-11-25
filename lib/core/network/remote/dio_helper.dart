
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  // Initialize Dio
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: '', // https://your-base-url.com/
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
  }


  // GET
  static Future<Response> getData({
    required String path,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await dio.get(
      path,
      queryParameters: query,
      options: Options(
        headers: token != null
            ? {
                'Authorization': 'Bearer $token',
              }
            : null,
      ),
    );
  }

  
  // POST
  static Future<Response> postData({
    required String path,
    dynamic data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await dio.post(
      path,
      data: data,
      queryParameters: query,
      options: Options(
        headers: token != null
            ? {
                'Authorization': 'Bearer $token',
              }
            : null,
      ),
    );
  }

  
  // PUT
  static Future<Response> putData({
    required String path,
    dynamic data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await dio.put(
      path,
      data: data,
      queryParameters: query,
      options: Options(
        headers: token != null
            ? {
                'Authorization': 'Bearer $token',
              }
            : null,
      ),
    );
  }

 
  // DELETE
  static Future<Response> deleteData({
    required String path,
    dynamic data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await dio.delete(
      path,
      data: data,
      queryParameters: query,
      options: Options(
        headers: token != null
            ? {
                'Authorization': 'Bearer $token',
              }
            : null,
      ),
    );
  }
}
