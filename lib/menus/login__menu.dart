import 'dart:convert';
import 'dart:io';
import 'package:console_chat_app/menus/auth__menu.dart';
import 'package:console_chat_app/menus/menu.dart';
import 'package:console_chat_app/menus/texting__menu.dart';
import 'package:console_chat_app/models/user.dart';
import 'package:console_chat_app/service/admin_service.dart';
import 'package:console_chat_app/service/extension_service.dart';
import 'package:console_chat_app/service/network__service.dart';
import '../service/navigator__service.dart';
import 'admin_menu.dart';
import 'main__menu.dart';

class Login extends Authentication {
  static const id = '/login__menu';

  @override
  build() async {
    String apiEndpoint = NetworkService.apiUser;
    String data = await NetworkService.getData(apiEndpoint);

    print('${'data'.tr}:\n');

    stdout.write('${'nick_name'.tr}: ');
    String checkNickName = prompt('');

    stdout.write('${'password'.tr}: ');
    String checkPassword = prompt('');

    List<User> users = (json.decode(data) as List).map((json) => User.fromJson(json)).toList();

    for (User user in users) {
      if(checkNickName == user.nickName && checkPassword == user.password) {
        user.isLogged = true;
        print('${'logged'.tr}!');
        Menu.user.id = user.id;
        Menu.user.name = user.name;
        Menu.user.password = user.password;
        Menu.user.nickName = user.nickName;
        Menu.user.phone = user.phone;
        Menu.user.isLogged = true;
        Menu.user.contacts = user.contacts;

        if(isAdmin(user.nickName)){
          await Navigator.push(AdminMenu());
        } else{
          await Navigator.push(MainMenu());
        }
      } else {
        print('not_found'.tr);
      }
    }
  }

  String prompt(String promptMessage) {
    stdout.write(promptMessage);
    return stdin.readLineSync()!;
  }
}

