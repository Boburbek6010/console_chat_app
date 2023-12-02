import 'dart:io';
import 'package:console_chat_app/menus/auth__menu.dart';
import '../models/user.dart';
import '../service/network__service.dart';


class Registration extends Authentication {

  static const id = '/registration_menu';

  @override
  build() async {
    print("Enter user details:");

    stdout.write("Name: ");
    String? name = stdin.readLineSync()!;

    bool tekshir = true;
    if (RegExp(r'[0-9!@#%^&*(),.?":{}|<>]').hasMatch(name)) {
      tekshir = true;
    } else {
      tekshir = false;
    }

    while (tekshir) {
      print("Please enter your name correctly");
      stdout.write("Name: ");
      String? name1 = stdin.readLineSync()!;
      name = name1;
      break;
    }

    String nickname = prompt("Nickname: ");

    stdout.write("Password: ");
    String? password = stdin.readLineSync()!;

    stdout.write("Phone: +998");
    String? phone = stdin.readLineSync()!;

    if (phone.length != 9 || !phone.startsWith('9')) {
      bool check = false;
      while (!check) {
        stdout.write("Please enter a valid phone number: +998");
        String? qaytaraqam = stdin.readLineSync();
        if (qaytaraqam!.length == 9 && qaytaraqam.startsWith('9')) {
          phone = qaytaraqam;
          check = true;
        } else {
          check = false;
        }
      }
    }

    if (isUserLoggedIn()) {
      print("User is already logged in. Cannot register a new user.");
      return;
    }

    User newUser = User('0', name!, password, nickname, phone!, true);

    await NetworkService.postData(newUser);
    print('New User created: $name');
  }

  bool isUserLoggedIn() {
    return false;
  }

  String prompt(String promptMessage) {
    stdout.write(promptMessage);
    return stdin.readLineSync()!;
  }
}
