import 'package:ldt/data/api/service/course_service.dart';
import 'package:ldt/data/mapper/course_mapper.dart';
import 'package:ldt/domain/model/course.dart';
import 'package:ldt/domain/repository/auth_repo.dart';
import 'package:ldt/domain/repository/courses_repo.dart';

class CourseRepoImpl extends CourseRepo {
  final CourseService _courseService;
  final AuthRepo _authRepo;

  CourseRepoImpl(this._courseService, this._authRepo);

  @override
  Future<Course?> getCourse(int id) async {
    final token = await _authRepo.getToken();
    if (token.isEmpty) return null;
    var w = await _courseService.getCourse(token, id);
    if (w.forbidden) {
      final token = await _authRepo.updateTokens();
      if (token == null) return null;
      w = await _courseService.getCourse(token, id);
    }
    return CourseMapper.fromApiCourse(w);
  }

  @override
  Future<List<CourseModule>> getCourseLessons(int id) async {
    final token = await _authRepo.getToken();
    if (token.isEmpty) return List.empty();
    var w = await _courseService.getCourseLessons(token, id);
    if (w.forbidden) {
      final token = await _authRepo.updateTokens();
      if (token == null) return List.empty();
      w = await _courseService.getCourseLessons(token, id);
    }
    return CourseMapper.fromApiLessons(w);
  }

  @override
  Future<List<CourseInList>> getCourses() async {
    final token = await _authRepo.getToken();
    if (token.isEmpty) return List.empty();
    var w = await _courseService.findCourses(token);
    if (w.forbidden) {
      final token = await _authRepo.updateTokens();
      if (token == null) return List.empty();
      w = await _courseService.findCourses(token);
    }
    return CourseMapper.fromApiCoursesInList(w);
  }
}
