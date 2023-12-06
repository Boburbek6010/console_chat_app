import 'dart:convert';
import 'package:console_chat_app/service/extension_colors.dart';

import '../models/user.dart';
import '../service/network__service.dart';
import 'menu.dart';

class UserListMenu extends Menu{
  static const id = "/userList_menu";

  @override
  build() async {
    fGreen("╔═══════════════════╗");
    fGreen('║   List of Users:  ║');
    fGreen("╚═══════════════════╝");
    for (User user in Menu.users) {
      print('\nID: ${user.id} Name: ${user.name} Nick: ${user.nickName} Phone: ${user.phone}');
    }

  }
}