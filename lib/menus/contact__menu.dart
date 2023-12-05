import 'dart:io';
import 'package:console_chat_app/menus/main__menu.dart';
import 'package:console_chat_app/service/extension_colors.dart';

import 'package:console_chat_app/menus/main__menu.dart';
import 'package:console_chat_app/service/extension_service.dart';

import '../service/navigator__service.dart';
import 'add_contacts__menu.dart';
import 'contacts_list__menu.dart';
import 'menu.dart';

class ContactMenu extends Menu {
  static const id = "/contact_menu";

  @override
  build() async {
    fGreen("╔══════════════════════════╗");
    fGreen("║ ${'contact_menu'.tr}            ║");
    fGreen("║ 1. ${'contacts_list'.tr}         ║");
    fGreen("║ 2. ${'add_contact'.tr}           ║");
    fGreen("║ 0. ${'exit'.tr}                  ║");
    fGreen("╚══════════════════════════╝");

    String? menuSelection = stdin.readLineSync();

    switch (menuSelection) {
      case "1":
        {
          await Navigator.push(ContactsListMenu());
        }
        break;
      case "2":
        {
          await Navigator.push(AddContactMenu());
        }
        break;
      default:
        {
          await Navigator.push(MainMenu());
        }
        break;
    }
  }
}
