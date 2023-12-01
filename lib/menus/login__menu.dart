import 'dart:io';
import 'package:console_chat_app/menus/auth__menu.dart';
import 'package:console_chat_app/models/user.dart';

class Login extends Authentication {
  static const id = '/login__menu';

  @override
  build() async {
    print('Enter your data:\n');

    stdout.write('Nick name: ');
    String checkNickName = prompt('Enter your Nick name: ');

    stdout.write('Password: ');
    String checkPassword = prompt('Enter your Nick password: ');

    if((checkNickName || checkPassword)  == User(nickName, password)){
      print('equal');
    }
    

  }

  
  String prompt(String promptMessage) {
    stdout.write(promptMessage);
    return stdin.readLineSync()!;
  }
}