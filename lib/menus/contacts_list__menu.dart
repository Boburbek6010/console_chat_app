import 'dart:io';
import 'package:console_chat_app/menus/menu.dart';
import 'package:console_chat_app/service/extension_colors.dart';
import '../models/contact.dart';
import '../models/user.dart';

class ContactsListMenu extends Menu {
  static const id = '/contacts_list_menu';

  @override
  build() {
    fGreen("╔═══════════╗");
    fGreen("║ Contacts: ║");
    fGreen("╚═══════════╝");

    User currentUser = Menu.user;
    List<Contacts>? contacts = currentUser.contacts;

    for (int i = 0; i < contacts!.length; i++) {
      print("${contacts[i].name}  ${contacts[i].phone}");
    }
    fGreen("╔═══════════════════╗");
    fGreen("║ 1. Delete contact ║");
    fGreen("║ 2. Edit contact   ║");
    fGreen("╚═══════════════════╝");

    String? userInput = stdin.readLineSync();

    switch (userInput) {
      case '1':
        print("Enter the index of the contact to delete:");
        int? deleteIndex = int.tryParse(stdin.readLineSync() ?? '');
        deleteContact(deleteIndex);
        break;
      case '2':
        print("Enter the index of the contact to edit:");
        int? editIndex = int.tryParse(stdin.readLineSync() ?? '');
        editContact(editIndex);
        break;
      default:
        print("Invalid option.");
        break;
    }
  }
}