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
    fGreen("╔═════════════════════╗");
    fGreen("║ Select menu:        ║");
    fGreen("║ 1. Settings         ║");
    fGreen("║ 2. Chats            ║");
    fGreen("║ 3. Contacts         ║");
    fGreen("║ 4. Log out          ║");
    fGreen("║ 0. Exit the app     ║");
    fGreen("╚═════════════════════╝");
    String? menuSelection = stdin.readLineSync();

    switch (menuSelection) {
      case "1":
        {
          await Navigator.push(SettingMenu());
        }
        break;
      case "2":
        {
          await Navigator.push(TextingMenu());
        }
        break;
      case "3":
        {
          await Navigator.push(ContactMenu());
        }
        break;
      case "4":
        {
          fRed("Are you sure u want to log out? (type 'yes' to log out or anything else to go back)");
          String? userChoice = stdin.readLineSync();
          if(userChoice == "yes"){
            await Navigator.push(Authentication());
          } else{
            await Navigator.push(MainMenu());
          }
        }
        break;
      case "0":
        {
          exit(0);
        }
    }
  }
}