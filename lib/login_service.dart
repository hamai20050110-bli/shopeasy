import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginService {
  Future<String?> loginApp(String username, String password) async {
    var dio = Dio();
    var url = 'https://dummyjson.com/auth/login';

    try {
      var response = await dio.post(
        url,
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        String token = response.data['accessToken']; 
        debugPrint("Đăng nhập DummyJSON thành công! Token: $token");
        return token;
      }
    } catch (e) {
      debugPrint("Lỗi đăng nhập: $e");
      return null; 
    }
    return null;
  }
  Future<Map<String, dynamic>?> getProfile(String token) async {
    var dio = Dio();
    try {
      var response = await dio.get(
        'https://dummyjson.com/auth/me',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return response.data;
    } catch (e) {
      return null;
    }
  }
}