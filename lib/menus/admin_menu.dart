import 'package:console_chat_app/menus/contact__menu.dart';
import 'package:console_chat_app/menus/setting_manu.dart';
import 'package:console_chat_app/menus/texting__menu.dart';
import 'package:console_chat_app/service/extension_colors.dart';
import 'package:console_chat_app/service/extension_service.dart';

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
    fGreen("║ 1. ${'list_users'.tr}   ║");
    fGreen("║ 2. ${'authentication'.tr}   ║");
    fGreen("║ 3. ${'settings'.tr}         ║");
    fGreen("║ 4. ${'chats'.tr}            ║");
    fGreen("║ 5. ${'contacts_list'.tr}         ║");
    fGreen("║ 6. ${'exit'.tr}             ║");
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
          await Navigator.push(SettingMenu());
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
