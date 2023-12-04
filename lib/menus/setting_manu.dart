import 'dart:io';
import 'package:console_chat_app/menus/main__menu.dart';
import 'package:console_chat_app/menus/menu.dart';
import 'package:console_chat_app/service/extension_colors.dart';
import 'package:console_chat_app/service/navigator__service.dart';
import 'package:console_chat_app/service/network__service.dart';

class SettingMenu extends Menu {
  static const id = "/setting_manu";


  @override
  build() async {
/*    String data1 = await NetworkService.getData(NetworkService.apiUser);
    print(data1);*/
    fGreen("╔══════════════════════╗");
    fGreen("║ Choose menu:         ║");
    fGreen("║ 1. Change Name       ║");
    fGreen("║ 2. Change Nikname    ║");
    fGreen("║ 3. Change Password   ║");
    fGreen("║ 4. Change Phone      ║");
    fGreen("║ 5. Go back           ║");
    fGreen("╚══════════════════════╝");
    String? menuSelection = stdin.readLineSync();


    switch (menuSelection) {
      case "1":
        {
          fBlue("Enter the Name you want to change : ");
          String? changename = stdin.readLineSync();
        }
        break;
      case "2":
        {
          fBlue("Enter the Nikname you want to change : ");
          String? changenikname = stdin.readLineSync();
        }
        break;
      case "3":
        {
          fBlue("Enter the Password you want to change");
          String? changepasword= stdin.readLineSync();
        }
        break;
      case "4":
        {
          fBlue("Enter the Phone  you want to change");
          String? changephone = stdin.readLineSync();
        }
        break;
      case "5":
        {
          await Navigator.push((MainMenu()));
        }
        break;
    }
  }
}