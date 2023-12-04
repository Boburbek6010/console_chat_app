import 'dart:convert';
import 'dart:io';

import 'package:console_chat_app/models/contact.dart';

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

    print("Enter the information asked below to add contacts");

    stdout.write("Name: ");
    String? name = stdin.readLineSync();
    while (name!.isEmpty) {
      print('Invalid input. Please try again.');
      stdout.write("Name: ");
      name = stdin.readLineSync()!;
    }

    stdout.write("Phone number: +998");
    String phone = "";
    bool isValidPhoneNumber = false;

    while (!isValidPhoneNumber) {
      phone = stdin.readLineSync()!;
      if (phone.isEmpty) {
        print("Phone number cannot be empty. Please try again.");
        stdout.write("Phone number: +998");
      } else if (!numberValidator(phone)) {
        print("Invalid input. Please try again. Example: 911234567");
        stdout.write("Phone number: +998");
      } else if (!await doesNumberExist("+998${phone}")) {
        print(
            "Your contact has not registered in our app yet (type 'exit' to quit)");
        stdout.write("Phone number: +998");
      }
      else if (await doesNumberExistInContacts("+998${phone}", currentUser.contacts!)) {
        print(
            "You already has this contact (type 'exit' to quit)");
      }
      else if (phone == "exit") {
        break;
      } else {
        currentUser.contacts?.add(Contacts(name, "+998$phone"));

        if (await NetworkService.deleteUser(currentUser.id)) {
          await NetworkService.postData(currentUser);
          print("Contact added successfully");
        } else {
          print("Smth went wrong");
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
