import 'package:dio/dio.dart';
import 'package:ldt/data/api/api_constants.dart';
import 'package:ldt/data/api/model/user.dart';
import 'package:ldt/data/api/model/wrapper.dart';

class EnvironmentService {
  final Dio _dio = Dio(ApiConstants.dioBaseOptions);

  Future<Wrapper<ApiUser>> getMe(String token) async {
    final response = await _dio.get('user/me', options: ApiConstants.getOptionWithAuth(token));
    if (response.statusCode != 200 || response.statusCode == null) return Wrapper(null, response.statusCode ?? 0);
    return Wrapper(ApiUser.fromApi(response.data), response.statusCode!);
  }
}
