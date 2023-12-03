import 'dart:io';
import 'package:console_chat_app/menus/auth__menu.dart';
import 'package:console_chat_app/menus/welcome__menu.dart';

import '../models/user.dart';
import '../service/navigator__service.dart';
import '../service/network__service.dart';
import 'menu.dart';


class Registration extends Authentication {
  static User currentUser = User('0', '', '', '', '', true);
  static const id = '/registration_menu';

  @override
  build() async {
    print("Enter user details:");
    String rangUzgartir(String word) {
      String rang = '\x1B[31m$word\x1B[0m';
      return rang;
    }

    stdout.write("Name : ");
    String? name = stdin.readLineSync()!;
    String rang = rangUzgartir(name);
    if(RegExp(r'[0-9!@#%^&*(),.?":{}|<>]').hasMatch(name)|| name.isEmpty){
      bool checkname = false;
      while(!checkname){
        stdout.write("Tyr again : ");
        String? namecheck = stdin.readLineSync();
        if(RegExp(r'[0-9!@#%^&*(),.?":{}|<>]').hasMatch(namecheck!) ||
        namecheck.isEmpty){
          name = namecheck;
          checkname = false;
        }else {
          checkname = true;

        }
      }
    }
    String nickname = prompt("Nickname: ");
    if(nickname.isEmpty){
      bool checknik = false;
      while(!checknik){
        stdout.write("Tyr again : ");
        String? nickcheck = stdin.readLineSync();
        if(nickcheck!.isEmpty){
          name = nickcheck;
          checknik = false;
        }else {
          checknik = true;
        }
      }
    }

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
    Navigator.push(WelcomeMenu());
  }

  bool isUserLoggedIn() {
    return false;
  }

  String prompt(String promptMessage) {
    stdout.write(promptMessage);
    return stdin.readLineSync()!;
  }
}
