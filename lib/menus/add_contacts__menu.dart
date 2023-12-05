import 'dart:convert';
import 'dart:io';

import 'package:console_chat_app/models/contact.dart';
import 'package:console_chat_app/service/extension_service.dart';

import '../models/user.dart';
import '../service/navigator__service.dart';
import '../service/network__service.dart';
import 'contact__menu.dart';
import 'menu.dart';

class AddContactMenu extends Menu {
  User currentUser = Menu.user;

  @override
  build() async {
    // String data = await NetworkService.getData(NetworkService.apiUser);
    // List<User> users =
    //     (json.decode(data) as List).map((json) => User.fromJson(json)).toList();

    print("jojo".tr);

    stdout.write("${'name'.tr}: ");
    String? name = stdin.readLineSync();
    while (name!.isEmpty) {
      print('invalid_input'.tr);
      stdout.write("${'name'.tr}: ");
      name = stdin.readLineSync()!;
    }

    stdout.write("${"phone".tr}': +998");
    String phone = "";
    bool isValidPhoneNumber = false;

    while (!isValidPhoneNumber) {
      phone = stdin.readLineSync()!;
      if(phone == "exit".tr){
        await Navigator.push(ContactMenu());
      }
      else if (phone.isEmpty) {
        print('correct_phone'.tr);
        stdout.write("${"phone".tr}: +998");
      } else if (!numberValidator(phone)) {
        print("${"correct_phone".tr}. Example: 911234567");
        stdout.write("${'phone'.tr}: +998");
      } else if (!await doesNumberExist("+998${phone}")) {
        print(
            "bruh".tr);
        stdout.write("${"phone".tr}: +998");
      }
      else if (await doesNumberExistInContacts("+998${phone}", currentUser.contacts!)) {
        print(
            "already_contact".tr);
      }
      else if (phone == "exit".tr) {
        break;
      } else {
        currentUser.contacts?.add(Contacts(name, "+998$phone"));

        if (await NetworkService.deleteUser(currentUser.id)) {
          await NetworkService.postData(currentUser);
          print("add_success".tr);
        } else {
          print("wrong".tr);
        }
        await Navigator.push(ContactMenu());
      }
    }
  }

  bool numberValidator(String phoneNumber) {
    return RegExp(r'^\d{9}$').hasMatch(phoneNumber);
  }

  Future<bool> doesNumberExist(String phoneNumber) async {
    String data = await NetworkService.getData(NetworkService.apiUser);
    List<User> users =
        (json.decode(data) as List).map((json) => User.fromJson(json)).toList();

    bool toReturn = false;

    for (User user in users) {
      if (user.phone == phoneNumber) toReturn = true;
    }
    return toReturn;
  }

  Future<bool> doesNumberExistInContacts(String phoneNumber, List<Contacts> contacts) async {
    bool toReturn = false;

    for (Contacts c in contacts) {
      if (c.phone == phoneNumber) toReturn = true;
    }
    return toReturn;
  }
}
