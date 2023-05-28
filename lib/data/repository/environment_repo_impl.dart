import 'package:ldt/data/api/service/environment_service.dart';
import 'package:ldt/data/mapper/environment_mapper.dart';
import 'package:ldt/domain/model/user.dart';
import 'package:ldt/domain/repository/auth_repo.dart';
import 'package:ldt/domain/repository/environment_repo.dart';

class EnvironmentRepoImpl extends EnvironmentRepo {
  final EnvironmentService _environmentService;
  final AuthRepo _authRepo;

  EnvironmentRepoImpl(this._environmentService, this._authRepo);

  @override
  Future<User?> getMe() async {
    final token = await _authRepo.getToken();
    if (token.isEmpty) return null;
    var w = await _environmentService.getMe(token);
    if (w.forbidden) {
      final token = await _authRepo.updateTokens();
      if (token == null) return null;
      w = await _environmentService.getMe(token);
    }
    return EnvironmentMapper.fromApi(w);
  }
}
