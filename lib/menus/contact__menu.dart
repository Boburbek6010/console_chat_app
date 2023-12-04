import 'dart:io';
import 'package:console_chat_app/menus/main__menu.dart';

import '../service/navigator__service.dart';
import 'add_contacts__menu.dart';
import 'contacts_list__menu.dart';
import 'menu.dart';

class ContactMenu extends Menu {
  static const id = "/contact_menu";

  @override
  build() async {
    print("Contacts Menu");
    print("1. Contacts List\n"
        "2. Add Contact\n"
        "0. Exit");

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
