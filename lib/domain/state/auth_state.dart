import 'package:mobx/mobx.dart';
import 'package:ldt/domain/model/tokens.dart';
import 'package:ldt/domain/repository/auth_repo.dart';

part 'auth_state.g.dart';

class AuthState = AuthStateBase with _$AuthState;

abstract class AuthStateBase with Store {
  AuthStateBase(this._authRepo);

  final AuthRepo _authRepo;

  @action
  Future<TokensWrapper> loginViaEmail(String email, String password) {
    return _authRepo.loginViaEmail(email, password);
  }
}
