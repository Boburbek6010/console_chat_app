import 'dart:convert';
import 'dart:io';
import 'package:console_chat_app/menus/auth__menu.dart';
import 'package:console_chat_app/menus/menu.dart';
import 'package:console_chat_app/menus/texting__menu.dart';
import 'package:console_chat_app/models/user.dart';
import 'package:console_chat_app/service/admin_service.dart';
import 'package:console_chat_app/service/network__service.dart';
import '../service/navigator__service.dart';
import 'admin_menu.dart';
import 'main__menu.dart';

class Login extends Menu {
  static const id = '/login__menu';

  @override
  build() async {
    print('Enter your data:\n');

    stdout.write('Username: ');
    String checkNickName = prompt('');

    stdout.write('Password: ');
    String checkPassword = prompt('');

    bool userFound = false; // Flag to track if a user is found

    for (User user in Menu.users) {
      if (checkNickName == user.nickName && checkPassword == user.password) {
        userFound = true;
        user.isLogged = true;
        print('You are logged in!');
        Menu.user.id = user.id;
        Menu.user.name = user.name;
        Menu.user.password = user.password;
        Menu.user.nickName = user.nickName;
        Menu.user.phone = user.phone;
        Menu.user.isLogged = true;
        Menu.user.contacts = user.contacts;

        // if (isAdmin(user.nickName)) {
        //   await Navigator.push(AdminMenu());
        // } else {
        //   await Navigator.push(MainMenu());
        // }

        // Break out of the loop once a user is found
        await Navigator.push(MainMenu());
      }
    }

    // Check the flag and print the message if no user is found
    if (!userFound) {
      print('No user found');
      await Navigator.push(Authentication());
    }
  }

  String prompt(String promptMessage) {
    stdout.write(promptMessage);
    return stdin.readLineSync()!;
  }
}
