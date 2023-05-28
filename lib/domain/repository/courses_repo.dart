import 'package:ldt/domain/model/course.dart';

abstract class CourseRepo {
  Future<List<CourseInList>> getCourses();

  Future<Course?> getCourse(int id);

  Future<List<CourseModule>> getCourseLessons(int id);
}
