import 'dart:convert';
import 'package:console_chat_app/service/extension_colors.dart';
import 'package:console_chat_app/service/extension_service.dart';

import '../models/user.dart';
import '../service/network__service.dart';
import 'menu.dart';

class UserListMenu extends Menu{
  static const id = "/userList_menu";

  @override
  build() async {
    String apiEndpoint = NetworkService.apiUser;
    String data = await NetworkService.getData(apiEndpoint);

    List<User> users = (json.decode(data) as List).map((json) => User.fromJson(json)).toList();
    fGreen("╔═══════════════════════╗");
    fGreen('║  ${'list_users'.tr}:  ║');
    fGreen("╚═══════════════════════╝");
    for (User user in users) {
      print('\nID: ${user.id} ${'name'.tr}: ${user.name} ${'nick_name'.tr}: ${user.nickName} ${'phone'.tr}: ${user.phone}');
    }

  }

}