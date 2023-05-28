import 'package:ldt/domain/model/user.dart';

abstract class EnvironmentRepo {
  Future<User?> getMe();
}
