import 'package:ldt/data/api/model/tokens.dart';
import 'package:ldt/data/api/model/wrapper.dart';
import 'package:ldt/domain/model/tokens.dart';

class AuthMapper {
  static TokensWrapper fromApi(Wrapper<ApiTokens> w) {
    return TokensWrapper(
      w.success ? TokensStatus.success : (w.notFound ? TokensStatus.emailNotFound : TokensStatus.invalidPassword),
      Tokens(w.response?.access, w.response?.refresh),
    );
  }
}
