class Tokens {
  final String access;
  final String refresh;

  bool get valid => access.isNotEmpty && refresh.isNotEmpty;

  Tokens(String? access, String? refresh)
      : access = access ?? '',
        refresh = refresh ?? '';
}

enum TokensStatus {
  success,
  emailNotFound,
  invalidPassword,
}

class TokensWrapper {
  final TokensStatus tokensStatus;
  final Tokens? tokens;

  TokensWrapper(this.tokensStatus, this.tokens);
}
