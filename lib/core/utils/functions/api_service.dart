import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://movie-app-5wo8.onrender.com';
  final Dio _dio;

  ApiService(this._dio);

//post request

  Future post(String endPoint, dynamic data) async {
    var response = await _dio.post('$_baseUrl$endPoint', data: data);
    return response.data;
  }

  Future<List<dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
    //return response;
  }
}
