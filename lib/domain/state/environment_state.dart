import 'package:ldt/domain/model/user.dart';
import 'package:ldt/domain/repository/environment_repo.dart';
import 'package:mobx/mobx.dart';

part 'environment_state.g.dart';

class EnvironmentState = EnvironmentStateBase with _$EnvironmentState;

abstract class EnvironmentStateBase with Store {
  EnvironmentStateBase(this._environmentRepo);

  final EnvironmentRepo _environmentRepo;

  @observable
  User? user;

  @action
  Future<void> getUser() async {
    user = await _environmentRepo.getMe();
  }
}
