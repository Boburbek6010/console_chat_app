import 'dart:io';
import 'package:console_chat_app/menus/menu.dart';
import 'package:console_chat_app/service/navigator__service.dart';
import 'package:console_chat_app/service/network__service.dart';



import 'welcome__menu.dart';

class SettingMenu extends Menu {
  static const id = "/setting_manu";

/*  Map<String, Object> mockData =
  {"name": "Sardorbek","nickName": "sardoriyyy","phone": "+998916033830","isLogged": false,"password": "password 1","contacts": [{"name": "Daniyor", "phone": "+998916033832"}],"id": "1"};*/
  @override
  build() async {
    String data1 = await NetworkService.getData(NetworkService.apiUser);
    print(data1);
    print("Choose menu:\n"
        /*"0. Choose the index user \n"*/
        "1. Change Name \n"
        "2. Change Nikname\n"
        "3. Change Password \n"
        "4  Change Phone \n "
        "5. Go back \n");
    String? menuSelection = stdin.readLineSync();


    switch (menuSelection) {
      /*case "0":
        {
          stdout.write("choose : ");
          String? choose = stdin.readLineSync();
          if(choose == 0){

          }

        }
        break;*/
      case "1":
        {
          stdout.write("Enter the Name you want to change : ");
          String? changename = stdin.readLineSync();
        }
        break;
      case "2":
        {
          stdout.write("Enter the Nikname you want to change : ");
          String? changenikname = stdin.readLineSync();
        }
        break;
      case "3":
        {
          stdout.write("Enter the Password you want to change");
          String? changepasword= stdin.readLineSync();
        }
        break;
      case "4":
        {
          stdout.write("Enter the Phone  you want to change");
          String? changephone = stdin.readLineSync();
        }
        break;
      case "5":
        {
          await Navigator.push((WelcomeMenu()));
        }
        break;
    }
  }
}