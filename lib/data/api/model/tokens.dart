class ApiTokens {
  final String access;
  final String refresh;

  ApiTokens.fromApi(Map<String, dynamic> map)
      : access = map['access'],
        refresh = map['refresh'];
}
