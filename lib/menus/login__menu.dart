import 'dart:convert';
import 'dart:io';
import 'package:console_chat_app/menus/auth__menu.dart';
import 'package:console_chat_app/menus/texting__menu.dart';
import 'package:console_chat_app/models/user.dart';
import 'package:console_chat_app/service/network__service.dart';
import '../service/navigator__service.dart';
import 'welcome__menu.dart';

class Login extends Authentication {
  static const id = '/login__menu';

  @override
  build() async {
    String apiEndpoint = NetworkService.apiUser;
    String data = await NetworkService.getData(apiEndpoint);

    print('Enter your data:\n');

    stdout.write('Nick name: ');
    String checkNickName = prompt('');

    stdout.write('Password: ');
    String checkPassword = prompt('');

    List<User> users = (json.decode(data) as List).map((json) => User.fromJson(json)).toList();
    print('\nList of Users:');

    for (User user in users) {
      if(checkNickName == user.nickName && checkPassword == user.password) {
        user.isLogged = true;
        print('Your logged!');
        TextingMenu.user.id = user.id;
        TextingMenu.user.name = user.name;
        TextingMenu.user.password = user.password;
        TextingMenu.user.nickName = user.nickName;
        TextingMenu.user.phone = user.phone;
        TextingMenu.user.isLogged = true;
        TextingMenu.user.contacts = user.contacts;
        await Navigator.push(WelcomeMenu());
      } else {
        print('no user founded');
      }
    }
  }

  String prompt(String promptMessage) {
    stdout.write(promptMessage);
    return stdin.readLineSync()!;
  }
}

