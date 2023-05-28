import 'package:dio/dio.dart';
import 'package:ldt/data/api/api_constants.dart';
import 'package:ldt/data/api/model/course.dart';
import 'package:ldt/data/api/model/wrapper.dart';

class CourseService {
  final Dio _dio = Dio(ApiConstants.dioBaseOptions);

  Future<Wrapper<List<ApiCourseInList>>> findCourses(String token) async {
    final response = await _dio.post('course/search', options: ApiConstants.getOptionWithAuth(token));
    if (response.statusCode != 200 || response.statusCode == null) return Wrapper(null, response.statusCode ?? 0);
    return Wrapper(List.generate(response.data.length, (index) => ApiCourseInList.fromApi(response.data[index])), response.statusCode!);
  }

  Future<Wrapper<ApiCourse>> getCourse(String token, int id) async {
    final response = await _dio.get('course/$id', options: ApiConstants.getOptionWithAuth(token));
    if (response.statusCode != 200 || response.statusCode == null) return Wrapper(null, response.statusCode ?? 0);
    return Wrapper(ApiCourse.fromApi(response.data), response.statusCode!);
  }

  Future<Wrapper<ApiCourseLessons>> getCourseLessons(String token, int id) async {
    final response = await _dio.get('course/$id', options: ApiConstants.getOptionWithAuth(token));
    if (response.statusCode != 200 || response.statusCode == null) return Wrapper(null, response.statusCode ?? 0);
    return Wrapper(ApiCourseLessons.fromApi(response.data), response.statusCode!);
  }
}
