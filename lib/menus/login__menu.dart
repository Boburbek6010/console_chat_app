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

class Login extends Authentication {
  static const id = '/login__menu';

  @override
  build() async {
    bool loginSuccessful = false;

    do {
      String apiEndpoint = NetworkService.apiUser;
      String data = await NetworkService.getData(apiEndpoint);

      print('Enter your data:\n');

      stdout.write('Nick name: ');
      String checkNickName = prompt('');

      stdout.write('Password: ');
      String checkPassword = prompt('');

      List<User> users = (json.decode(data) as List)
          .map((json) => User.fromJson(json))
          .toList();

      bool userFound = false;

      for (User user in users) {
        if (checkNickName == user.nickName && checkPassword == user.password) {
          user.isLogged = true;
          print('You\'re logged!');
          Menu.user.id = user.id;
          Menu.user.name = user.name;
          Menu.user.password = user.password;
          Menu.user.nickName = user.nickName;
          Menu.user.phone = user.phone;
          Menu.user.isLogged = true;
          Menu.user.contacts = user.contacts;

          if (isAdmin(user.nickName)) {
            await Navigator.push(AdminMenu());
          } else {
            await Navigator.push(MainMenu());
          }

          userFound = true;
          loginSuccessful = true;
          break;
        }
      }

      if (!userFound) {
        print('No user found. Please try again.');
      }
    } while (!loginSuccessful);
  }

  String prompt(String promptMessage) {
    stdout.write(promptMessage);
    return stdin.readLineSync()!;
  }
}
