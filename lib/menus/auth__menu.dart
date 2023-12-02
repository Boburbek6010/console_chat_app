import 'dart:io';
import 'package:console_chat_app/menus/login__menu.dart';
import 'package:console_chat_app/menus/registration__menu.dart';
import 'package:console_chat_app/menus/welcome__menu.dart';
import 'package:console_chat_app/service/navigator__service.dart';

class Authentication extends WelcomeMenu{
  static const id = "/auth_menu";

  @override
  build() async{
    print(
      '1. Registration\n'
      '2. Log in\n'
      '3. Go back\n'
    );
    String? menuSelection = stdin.readLineSync();
    
    switch(menuSelection){
      case "1":{
        await Navigator.push(Registration());
      }
      break;
      case "2":{
        await Navigator.push(Login());
      }
      break;
      case "3":{
        await Navigator.push(WelcomeMenu());
      }
    }
  }
}