import 'package:console_chat_app/menus/contact__menu.dart';
import 'package:console_chat_app/menus/texting__menu.dart';

import '../menus/userList__menu.dart';
import 'dart:io';
import '../service/navigator__service.dart';
import 'auth__menu.dart';
import 'menu.dart';

class MainMenu extends Menu {
  static const id = "/welcome_menu";

  @override
  build() async {
    print("Select menu:\n"
        "1. Authentication\n"
        "2. Settings\n"
        "3. Chats\n"
        "4. Contacts\n"
        "5. Exit\n");
    String? menuSelection = stdin.readLineSync();

    switch (menuSelection) {
      case "1":
        {
          await Navigator.push(Authentication());
        }
        break;
      case "2":
        {
          await Navigator.push(UserListMenu());
        }
        break;
      case "3":
        {
          await Navigator.push(TextingMenu());
        }
        break;
      case "4":
        {
          await Navigator.push(ContactMenu());
        }
        break;
      case "5":
        {
          exit(0);
        }
    }
  }
}