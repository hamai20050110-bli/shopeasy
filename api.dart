import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(baseUrl: 'https://dummyjson.com'),
);

// GET: tìm sản phẩm bằng queryParameters
Future<List> timSanPham(String tuKhoa) async {
  final response = await dio.get(
    '/products/search',
    queryParameters: {'q': tuKhoa, 'limit': 10},
  );
  return response.data['products'];
}

// GET: lấy chi tiết 1 sản phẩm theo id
Future<Map<String, dynamic>> layChiTietSanPham(int id) async {
  final response = await dio.get('/products/$id');
  return response.data;
}

// POST: đăng nhập
Future<Map<String, dynamic>> dangNhap(String username, String password) async {
  final response = await dio.post(
    '/auth/login',
    data: {
      'username': username,
      'password': password,
    },
  );
  return response.data;
}

Future<Map<String, dynamic>> getEmilyProfile() async {
    var dio = Dio();
    try {
      var response = await dio.get('https://dummyjson.com/users/1');
      return response.data;
    } catch (e) {
      return {};
    }
  }