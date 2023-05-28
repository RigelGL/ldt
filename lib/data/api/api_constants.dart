import 'dart:io';

import 'package:dio/dio.dart';

class ApiConstants {
  static const String apiUrl = 'https://api-ldt23.rigellab.ru/';

  static BaseOptions dioBaseOptions = BaseOptions(
    baseUrl: apiUrl,
    validateStatus: (status) {
      return status! < 500;
    },
  );

  static Options dioPostOptions = Options(
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
    followRedirects: false,
    validateStatus: (status) {
      return status! < 500;
    },
  );

  static Options getOptionWithAuth(String token) {
    return dioPostOptions.copyWith(headers: {HttpHeaders.authorizationHeader: token});
  }
}
