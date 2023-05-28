import 'package:ldt/data/api/model/user.dart';
import 'package:ldt/data/api/model/wrapper.dart';
import 'package:ldt/domain/model/user.dart';

class EnvironmentMapper {
  static User? fromApi(Wrapper<ApiUser> w) {
    final user = w.response;
    if (!w.success || user == null) return null;
    return User(user.id, user.name, user.email, null, null);
  }
}
