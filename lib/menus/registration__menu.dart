import 'dart:convert';
import 'dart:io';
import 'package:console_chat_app/menus/auth__menu.dart';
import 'package:console_chat_app/menus/main__menu.dart';
import 'package:console_chat_app/service/extension_colors.dart';
import 'package:console_chat_app/service/extension_service.dart';

import '../models/user.dart';
import '../service/navigator__service.dart';
import '../service/network__service.dart';
import 'menu.dart';

class Registration extends Authentication {
  static User currentUser = User('0', '', '', '', '', true);
  static const id = '/registration_menu';

  @override
  build() async {
    String data = await NetworkService.getData(NetworkService.apiUser);
    List<User> users =
        (json.decode(data) as List).map((json) => User.fromJson(json)).toList();

    stdout.write("${'name'.tr}: ");
    String? name = stdin.readLineSync();
    while (!isValidName(name!)) {
      fRed('${'invalid_input'.tr}.');
      stdout.write("${'name'.tr}: ");
      name = stdin.readLineSync()!;
    }

    stdout.write("${'nick_name'.tr}: ");
    String username = "";
    bool isValidUsername = false;

    while (!isValidUsername) {
      username = stdin.readLineSync()!;

      if (username.isEmpty) {
        fRed("empty_username".tr);
      } else {
        isValidUsername = !users.any((user) => user.nickName == username);
        if (!isValidUsername) {
          fBlue(
              "${'nick_name'.tr} '$username' ${'taken'.tr}");
          stdout.write("${'nick_name'.tr}: ");
        }
      }
    }

    stdout.write("${'create_pass_new'.tr}: ");
    String password = "";

    while (password.isEmpty || password.length < 4 ) {
      password = stdin.readLineSync()!;

      if (password.isEmpty || password.length < 4) {
        fRed('empty_pass_try'.tr);
        stdout.write("${'enter_pass'.tr}: ");
      }
    }

    stdout.write("${'phone'.tr}: +998");
    String phone = "";
    bool isValidPhoneNumber = false;

    while (!isValidPhoneNumber) {
      phone = stdin.readLineSync()!;

      if (phone.isEmpty) {
        fRed("hatolik1".tr);
      } else if (!numberValidator(phone)) {
        fBlue("${'ivalidbruh'}: 911234567");
        stdout.write("${'phone'.tr}: +998");
      } else {
        isValidPhoneNumber = !users.any((user) => user.phone == phone);
        if (!isValidPhoneNumber) {
          print(
              "${'phone'.tr} '$phone' ${'taken_number'.tr}.");
          stdout.write("Phone number: +998");
        }
      }
    }

    User newUser = User('0', name, password, username, "+998$phone", true);

    Menu.user = newUser;

    await NetworkService.postData(newUser);
    fRed('${'user_created'.tr}: $name');
    Navigator.push(MainMenu());
  }

  bool isValidName(String name) {
    // Check if the name contains only letters and is not empty
    return RegExp(r'^[a-zA-Z]+$').hasMatch(name) && name.isNotEmpty;
  }

  bool numberValidator(String phoneNumber) {
    return RegExp(r'^\d{9}$').hasMatch(phoneNumber);
  }
}
