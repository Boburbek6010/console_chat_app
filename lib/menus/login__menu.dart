import 'dart:convert';
import 'dart:io';
import 'package:console_chat_app/menus/auth__menu.dart';
import 'package:console_chat_app/models/user.dart';
import 'package:console_chat_app/service/network__service.dart';

class Login extends Authentication {
  static const id = '/login__menu';

  @override
  build() async {
    String apiEndpoint = NetworkService.apiUser;
    String data = await NetworkService.getData(apiEndpoint);

    print('Enter your data:\n');

    stdout.write('Nick name: ');
    String checkNickName = prompt('');

    List<User> users = (json.decode(data) as List).map((json) => User.fromJson(json)).toList();
    print('\nList of Users:');

    for (User user in users) {
      if(checkNickName == user.nickName) {
        print('Your logged!');
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

