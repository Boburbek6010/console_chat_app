import 'package:console_chat_app/menus/contact__menu.dart';
import 'package:console_chat_app/menus/texting__menu.dart';
import 'package:console_chat_app/service/extension_colors.dart';

import '../menus/userList__menu.dart';
import 'dart:io';
import '../service/navigator__service.dart';
import 'auth__menu.dart';
import 'menu.dart';

class AdminMenu extends Menu {
  static const id = "/welcome_menu";

  @override
  build() async {
    fGreen("╔═════════════════════╗");
    fGreen("║ Select menu:        ║");
    fGreen("║ 1. User List Menu   ║");
    fGreen("║ 2. Authentication   ║");
    fGreen("║ 3. Settings         ║");
    fGreen("║ 4. Chats            ║");
    fGreen("║ 5. Contacts         ║");
    fGreen("║ 6. Exit             ║");
    fGreen("╚═════════════════════╝");
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
        break;
      case "5":
        {
          await Navigator.push(ContactMenu());
        }
        break;
      case "6":
        {
          exit(0);
        }
    }
  }
}