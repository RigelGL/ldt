class ApiUserTelegram {
  final int id;
  final int chatId;
  final String nickname;

  ApiUserTelegram.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        chatId = map['chatId'],
        nickname = map['nickname'];
}

class ApiUserVk {
  final int id;

  ApiUserVk.fromApi(Map<String, dynamic> map) : id = map['id'];
}

class ApiUser {
  final int id;
  final String name;
  final String? email;
  final ApiUserTelegram? telegram;
  final ApiUserVk? vk;

  ApiUser.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        email = map['email'],
        telegram = map.containsKey('telegram') && map['telegram'] != null ? ApiUserTelegram.fromApi(map['telegram']) : null,
        vk = map.containsKey('vk') && map['vk'] != null ? ApiUserVk.fromApi(map['vk']) : null;
}
