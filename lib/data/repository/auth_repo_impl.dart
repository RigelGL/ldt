import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ldt/data/api/service/auth_service.dart';
import 'package:ldt/data/mapper/auth_mapper.dart';
import 'package:ldt/domain/model/tokens.dart';
import 'package:ldt/domain/repository/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final _storage = const FlutterSecureStorage(iOptions: IOSOptions(), aOptions: AndroidOptions(encryptedSharedPreferences: true));
  static const String _accessTokenName = 'access';
  static const String _refreshTokenName = 'refresh';

  final AuthService _authService;

  AuthRepoImpl(this._authService);

  @override
  Future<TokensWrapper> loginAnonymous() async {
    final tokens = AuthMapper.fromApi(await _authService.loginAnonymous());
    if (tokens.tokensStatus == TokensStatus.success) saveTokens(tokens.tokens!);
    return tokens;
  }

  @override
  Future<TokensWrapper> loginViaEmail(String email, String password) async {
    final tokens = AuthMapper.fromApi(await _authService.loginViaEmail(email, password));
    if (tokens.tokensStatus == TokensStatus.success) saveTokens(tokens.tokens!);
    return tokens;
  }

  @override
  Future<String?> loginViaTelegram(String fcm) async {
    final f = await _authService.loginViaTelegram();
    return f.success ? f.response! : null;
  }

  @override
  Future<void> deleteTokens() async {
    await _storage.delete(key: _accessTokenName);
    await _storage.delete(key: _refreshTokenName);
  }

  @override
  Future<String?> updateTokens() async {
    return '';
  }

  Future<void> saveTokens(Tokens tokens) async {
    if (!tokens.valid) return;
    await _storage.write(key: _accessTokenName, value: tokens.access);
    await _storage.write(key: _refreshTokenName, value: tokens.refresh);
  }

  @override
  Future<String> getToken() async {
    return (await _storage.read(key: _accessTokenName)) ?? '';
  }
}
