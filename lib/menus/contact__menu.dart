import 'dart:io';
import 'package:console_chat_app/service/extension_colors.dart';

import '../service/navigator__service.dart';
import 'add_contacts__menu.dart';
import 'contacts_list__menu.dart';
import 'menu.dart';

class ContactMenu extends Menu {
  static const id = "/contact_menu";

  @override
  build() async {
    fGreen("╔══════════════════╗");
    fGreen("║ Contacts Menu    ║");
    fGreen("║ 1. Contacts List ║");
    fGreen("║ 2. Add Contact   ║");
    fGreen("╚══════════════════╝");

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
    }
  }
}
