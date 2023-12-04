import 'dart:io';

import 'package:console_chat_app/menus/menu.dart';
import 'package:console_chat_app/service/extension_colors.dart';

import '../models/contact.dart';
import '../models/user.dart';

class ContactsListMenu extends Menu {
  static const id = '/contacts_list_menu';

  @override
  build() {
    print("Contacts: \n");

    User currentUser = Menu.user;
    List<Contacts>? contacts = currentUser.contacts;

    for (int i = 0; i < contacts!.length; i++) {
      print("${contacts[i].name}  ${contacts[i].phone}");
    }
    fGreen("╔════════════════════╗");
    fGreen("║ 1. Delete contact  ║");
    fGreen("║ 2. Edit contact    ║");
    fGreen("╚════════════════════╝");
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

  void deleteContact(int? index) {
    User currentUser = Menu.user;
    List<Contacts>? contacts = currentUser.contacts;

    if (index != null && index >= 0 && index < contacts!.length) {
      print("Deleting contact: ${contacts[index].name}");
      contacts.removeAt(index);
      print("Contact deleted successfully.");
    } else {
      print("Invalid index. Contact not found.");
    }
  }

  void editContact(int? index) {
    User currentUser = Menu.user;
    List<Contacts>? contacts = currentUser.contacts;

    if (index != null && index >= 0 && index < contacts!.length) {
      print("Editing contact: ${contacts[index].name}");

      print("Contact edited successfully.");
    } else {
      print("Invalid index. Contact not found.");
    }
  }
}