class Wrapper<T> {
  final T? response;
  final int status;

  bool get success => status >= 200 && status <= 299;
  bool get notAuthorized => status == 401;
  bool get paymentRequired => status == 402;
  bool get forbidden => status == 403;
  bool get notFound => status == 404;
  bool get conflict => status == 409;

  Wrapper(this.response, this.status);
}
