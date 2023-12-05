import 'dart:io';

import 'package:console_chat_app/menus/menu.dart';
import 'package:console_chat_app/service/extension_colors.dart';
import 'package:console_chat_app/service/extension_service.dart';

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
    fGreen("║ 1. ${'delate_contact'.tr}  ║");
    fGreen("║ 2. ${'edit_contact'.tr}    ║");
    fGreen("╚════════════════════╝");
    String? userInput = stdin.readLineSync();

    switch (userInput) {
      case '1':
        print("${'input_delate_index'.tr}:");
        int? deleteIndex = int.tryParse(stdin.readLineSync() ?? '');
        deleteContact(deleteIndex);
        break;
      case '2':
        print("${'input_edit_index'.tr}:");
        int? editIndex = int.tryParse(stdin.readLineSync() ?? '');
        editContact(editIndex);
        break;
      default:
        print("invalid_input".tr);
        break;
    }
  }

  void deleteContact(int? index) {
    User currentUser = Menu.user;
    List<Contacts>? contacts = currentUser.contacts;

    if (index != null && index >= 0 && index < contacts!.length) {
      print("${'deletingc'.tr}: ${contacts[index].name}");
      contacts.removeAt(index);
      print("success_delate".tr);
    } else {
      print("invalid_input".tr);
    }
  }

  void editContact(int? index) {
    User currentUser = Menu.user;
    List<Contacts>? contacts = currentUser.contacts;

    if (index != null && index >= 0 && index < contacts!.length) {
      print("${'editingcon'.tr}: ${contacts[index].name}");

      print("success_edit".tr);
    } else {
      print("invalid_input".tr);
    }
  }
}