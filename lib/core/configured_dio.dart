import 'package:dio/dio.dart';

class ConfiguredDio {
  static const String _host = 'https://wookie.codesubmit.io/';
  late final Dio dio;

  ConfiguredDio() {
    dio = Dio(BaseOptions(baseUrl: _host, headers: {
      'Authorization': 'Bearer Wookie2021',
    }));
  }
}
