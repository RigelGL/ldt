import 'package:ldt/data/api/service/auth_service.dart';
import 'package:ldt/data/api/service/course_service.dart';
import 'package:ldt/data/api/service/environment_service.dart';
import 'package:ldt/data/repository/auth_repo_impl.dart';
import 'package:ldt/data/repository/course_repo_impl.dart';
import 'package:ldt/data/repository/environment_repo_impl.dart';
import 'package:ldt/domain/repository/auth_repo.dart';
import 'package:ldt/domain/repository/courses_repo.dart';
import 'package:ldt/domain/repository/environment_repo.dart';
import 'package:ldt/domain/state/auth_state.dart';
import 'package:ldt/domain/state/courses_state.dart';
import 'package:ldt/domain/state/environment_state.dart';

class AppModule {
  static AuthRepo? _authRepo;

  static AuthState? _authState;
  static EnvironmentState? _environmentState;
  static CoursesState? _coursesState;

  static AuthRepo authRepo() {
    _authRepo ??= AuthRepoImpl(AuthService());
    return _authRepo!;
  }

  static AuthState authState() {
    _authState ??= AuthState(authRepo());
    return _authState!;
  }

  static EnvironmentState environmentState() {
    _environmentState ??= EnvironmentState(EnvironmentRepoImpl(EnvironmentService(), authRepo()));
    return _environmentState!;
  }

  static CoursesState coursesState() {
    _coursesState ??= CoursesState(CourseRepoImpl(CourseService(), authRepo()));
    return _coursesState!;
  }
}
