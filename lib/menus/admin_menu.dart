import 'package:console_chat_app/menus/texting__menu.dart';

import '../menus/userList__menu.dart';
import 'dart:io';
import '../service/navigator__service.dart';
import 'auth__menu.dart';
import 'menu.dart';

class AdminMenu extends Menu {
  static const id = "/welcome_menu";

  @override
  build() async {
    print("Select menu:\n"
        "1. User List Menu\n"
        "2. Authentication\n"
        "3. Settings\n"
        "4. Chats\n"
        "5. Exit\n");
    String? menuSelection = stdin.readLineSync();

    switch (menuSelection) {
      case "1":
        {
          await Navigator.push(UserListMenu());
        }
        break;
      case "2":
        {
          await Navigator.push(Authentication());
        }
        break;
      case "3":
        {
          await Navigator.push(UserListMenu());
        }
        break;
      case "4":
        {
          await Navigator.push(TextingMenu());
        }
      case "5":
        {
          exit(0);
        }
    }
  }
}