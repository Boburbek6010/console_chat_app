import 'dart:convert';
import 'dart:io';
import 'package:console_chat_app/menus/auth__menu.dart';
import 'package:console_chat_app/menus/main__menu.dart';
import 'package:console_chat_app/service/extension_colors.dart';

import '../models/user.dart';
import '../service/navigator__service.dart';
import '../service/network__service.dart';
import 'menu.dart';

class Registration extends Menu {
  static const id = '/registration_menu';

  @override
  build() async {
    stdout.write("Name: ");
    String? name = stdin.readLineSync();
    while (!isValidName(name!)) {
      print('Invalid input. Please try again.');
      stdout.write("Name: ");
      name = stdin.readLineSync()!;
    }

    stdout.write("Username: ");
    String username = "";
    bool isValidUsername = false;

    while (!isValidUsername) {
      username = stdin.readLineSync()!;

      if (username.isEmpty) {
        print("Username cannot be empty. Please try again.");
      } else {
        isValidUsername = !Menu.users.any((user) => user.nickName == username);
        if (!isValidUsername) {
          print(
              "Username '$username' is already taken. Please choose another one.");
          stdout.write("Username: ");
        }
      }
    }

    stdout.write("Create new  password: ");
    String password = "";

    while (password.isEmpty) {
      password = stdin.readLineSync()!;

      if (password.isEmpty) {
        print("Password cannot be empty. Please try again.");
        stdout.write("Enter your password: ");
      }
    }

    stdout.write("Phone number: +998");
    String phone = "";
    bool isValidPhoneNumber = false;

    while (!isValidPhoneNumber) {
      phone = stdin.readLineSync()!;

      if (phone.isEmpty) {
        print("Phone number cannot be empty. Please try again.");
      } else if (!numberValidator(phone)) {
        print("Invalid input. Please try again. Example: 911234567");
        stdout.write("Phone number: +998");
      }
      else if (!await doesNumberExist("+998${phone}")) {
        print("Invalid input. Please try again. Example: 911234567");
        stdout.write("Phone number: +998");
      }
      else {
        isValidPhoneNumber = !Menu.users.any((user) => user.phone == phone);
        if (!isValidPhoneNumber) {
          print(
              "Phone number '$phone' is already taken. Please choose another one.");
          stdout.write("Phone number: +998");
        }
      }
    }

    User newUser = User('0', name, password, username, "+998$phone", true);

    Menu.user = newUser;

    await NetworkService.postData(newUser);
    fRed('New User created: $name');
    await Navigator.push(MainMenu());
  }
  //hrtyhtyt

  bool isValidName(String name) {
    // Check if the name contains only letters and is not empty
    return RegExp(r'^[a-zA-Z ]+$').hasMatch(name) && name.isNotEmpty;
  }

  bool numberValidator(String phoneNumber) {
    return RegExp(r'^\d{9}$').hasMatch(phoneNumber);
  }
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