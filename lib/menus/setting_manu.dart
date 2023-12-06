import 'dart:io';
import 'package:console_chat_app/menus/main__menu.dart';
import 'package:console_chat_app/menus/menu.dart';
import 'package:console_chat_app/service/extension_colors.dart';
import 'package:console_chat_app/service/extension_service.dart';
import 'package:console_chat_app/service/navigator__service.dart';

class SettingMenu extends Menu {
  static const id = "/setting_manu";


  @override
  build() async {
/*    String data1 = await NetworkService.getData(NetworkService.apiUser);
    print(data1);*/
    fGreen("╔═══════════════════════════╗");
    fGreen("║ Choose menu:              ║");
    fGreen("║ 1. ${'change_name'.tr}            ║");
    fGreen("║ 2. ${'change_nick'.tr}        ║");
    fGreen("║ 3. ${'change_pass'.tr}        ║");
    fGreen("║ 4. ${'change_phone'.tr}           ║");
    fGreen("║ 5. ${'go_back'.tr}                ║");
    fGreen("╚═══════════════════════════╝");
    String? menuSelection = stdin.readLineSync();


    switch (menuSelection) {
      case "1":
        {
          fBlue("${'changed__name'.tr} : ");
          String? changename = stdin.readLineSync();
        }
        break;
      case "2":
        {
          fBlue("${'changed__username'.tr} : ");
          String? changenikname = stdin.readLineSync();
        }
        break;
      case "3":
        {
          fBlue("changed__pass".tr);
          String? changepasword= stdin.readLineSync();
        }
        break;
      case "4":
        {
          fBlue('changed__phone'.tr);
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