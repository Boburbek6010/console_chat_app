import 'package:console_chat_app/menus/contact__menu.dart';
import 'package:console_chat_app/menus/setting_manu.dart';
import 'package:console_chat_app/menus/texting__menu.dart';
import 'package:console_chat_app/service/extension_colors.dart';

import '../menus/userList__menu.dart';
import 'dart:io';
import '../service/navigator__service.dart';
import 'auth__menu.dart';
import 'menu.dart';

class MainMenu extends Menu {
  static const id = "/welcome_menu";

  @override
  build() async {
    fGreen("╔════════════════════╗");
    fGreen("║ Select menu:       ║");
    fGreen("║ 1. Authentication  ║");
    fGreen("║ 2. Settings        ║");
    fGreen("║ 3. Chats           ║");
    fGreen("║ 4. Contacts        ║");
    fGreen("║ 5. Exit            ║");
    fGreen("╚════════════════════╝");
    String? menuSelection = stdin.readLineSync();

    switch (menuSelection) {
      case "1":
        {
          await Navigator.push(Authentication());
        }
        break;
      case "2":
        {
          await Navigator.push(SettingMenu());
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