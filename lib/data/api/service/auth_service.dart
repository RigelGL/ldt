import 'package:dio/dio.dart';
import 'package:ldt/data/api/api_constants.dart';
import 'package:ldt/data/api/model/tokens.dart';
import 'package:ldt/data/api/model/wrapper.dart';

class AuthService {
  final Dio _dio = Dio(ApiConstants.dioBaseOptions);

  Future<Wrapper<ApiTokens>> loginAnonymous() async {
    final response = await _dio.post('auth/login/anonymous');
    if (response.statusCode != 200 || response.statusCode == null) return Wrapper(null, response.statusCode ?? 0);
    return Wrapper(ApiTokens.fromApi(response.data), response.statusCode!);
  }

  Future<Wrapper<ApiTokens>> loginViaEmail(String email, String password) async {
    final response = await _dio.post('auth/login/email', data: {'email': email, 'password': password});
    if (response.statusCode != 200 || response.statusCode == null) return Wrapper(null, response.statusCode ?? 0);
    return Wrapper(ApiTokens.fromApi(response.data), response.statusCode!);
  }

  Future<Wrapper<String>> loginViaTelegram() async {
    final response = await _dio.post('auth/signup/telegram');
    if (response.statusCode != 200 || response.statusCode == null) return Wrapper(null, response.statusCode ?? 0);
    return Wrapper(response.data['link'], response.statusCode!);
  }
}
