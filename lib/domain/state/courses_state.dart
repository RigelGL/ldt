import 'package:ldt/domain/model/course.dart';
import 'package:ldt/domain/repository/courses_repo.dart';
import 'package:mobx/mobx.dart';

part 'courses_state.g.dart';

class CoursesState = CoursesStateBase with _$CoursesState;

abstract class CoursesStateBase with Store {
  CoursesStateBase(this._coursesRepo);

  final CourseRepo _coursesRepo;

  @observable
  List<CourseInList> courses = ObservableList();

  @observable
  bool courseLoading = false;
  @observable
  Course? course;

  @observable
  List<CourseModule> courseModules = ObservableList();

  @action
  Future<void> getCourses() async {
    courses.clear();
    courses.addAll(await _coursesRepo.getCourses());
  }

  @action
  Future<void> getCourse(int id) async {
    courseLoading = true;
    course = await _coursesRepo.getCourse(id);
    courseLoading = false;
  }

  @action
  Future<void> getCourseLessons(int id) async {
    courseModules.clear();
    courseModules.addAll(await _coursesRepo.getCourseLessons(id));
  }
}
