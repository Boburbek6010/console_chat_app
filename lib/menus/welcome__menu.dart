import 'package:console_chat_app/menus/registration__menu.dart';
import 'package:console_chat_app/menus/userList__menu.dart';
import 'dart:io';
import '../service/navigator__service.dart';
import 'menu.dart';

class WelcomeMenu extends Menu{

  static const id = "/welcome_menu";

  // Future<void> selectMenu(String press)async {
  //   print("Select menu:\n"
  //       "1- User List Menu");
  //   String? menuSelection = stdin.readLineSync();
  //
  //   switch(menuSelection){
  //     case "1":{
  //       await Navigator.push(UserListMenu());
  //     }
  //   }
  // }

  @override
  build() async {
    print(
        
        "Select menu:\n"
        
        "1. User List Menu\n"
        "2. Registration\n"
        "3. Settings\n"
        "4. Exit\n"
        
        );
    String? menuSelection = stdin.readLineSync();

    switch(menuSelection){
      case "1":{
        await Navigator.push(UserListMenu());
      }
      break;
      case "2":{
        await Navigator.push(Registration());
      }
      break;
    }
  }
}