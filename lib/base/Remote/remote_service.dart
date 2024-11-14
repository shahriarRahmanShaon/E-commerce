import 'package:dio/dio.dart';

class RemoteService {
  static final RemoteService _instance = RemoteService._internal();
  factory RemoteService() => _instance;

  RemoteService._internal();

  late final Dio dio;

  void init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://fakestoreapi.com',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {'Content-Type': 'application/json'},
    ));
  }
}
