import 'package:ldt/domain/model/tokens.dart';

abstract class AuthRepo {
  Future<TokensWrapper> loginViaEmail(String email, String password);

  Future<TokensWrapper> loginAnonymous();

  Future<String?> loginViaTelegram(String fcm);

  Future<String> getToken();

  Future<String?> updateTokens();

  Future<void> deleteTokens();
}
