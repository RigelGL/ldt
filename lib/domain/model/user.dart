class UserTelegram {
  final int id;
  final int chatId;
  final String nickname;

  UserTelegram(this.id, this.chatId, this.nickname);
}

class UserVk {
  final int id;

  UserVk(this.id);
}

class User {
  final int id;
  final String name;
  final String? email;
  final UserTelegram? telegram;
  final UserVk? vk;

  User(this.id, this.name, this.email, this.telegram, this.vk);
}
