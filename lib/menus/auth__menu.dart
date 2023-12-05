import 'dart:io';
import 'package:console_chat_app/menus/login__menu.dart';
import 'package:console_chat_app/menus/menu.dart';
import 'package:console_chat_app/menus/registration__menu.dart';
import 'package:console_chat_app/menus/userList__menu.dart';
import 'package:console_chat_app/menus/main__menu.dart';
import 'package:console_chat_app/service/extension_colors.dart';
import 'package:console_chat_app/service/extension_service.dart';
import 'package:console_chat_app/service/navigator__service.dart';

class Authentication extends MainMenu {
  static const id = "/auth_menu";

  @override
  build() async {
    fGreen("╔══════════════════╗");
    fGreen('║ 1. ${'registration'.tr}  ║');
    fGreen('║ 2. ${'login'.tr}        ║');
    fGreen("╚══════════════════╝");
    String? menuSelection = stdin.readLineSync();

    switch (menuSelection) {
      case "1":
        {
          await Navigator.push(Registration());
        }
        break;
      case "2":
        {
          await Navigator.push(Login());
        }
      default:
        print("Invalid option.");
        await Navigator.push(Authentication());
        break;
    }
  }
}
