
import 'dart:io';
import '../models/user.dart';
import '../service/network__service.dart';
import 'menu.dart';

class Registration extends Menu {
  static const id = '/registration_menu';
  @override
  build() async {
    print("Enter user details:");
    stdout.write("Name : ");
    String? name = stdin.readLineSync()!;
    bool tekshir = true;
    if(RegExp(r'[0-9!@#%^&*(),.?":{}|<>]').hasMatch(name))
      {tekshir = true;
      }else{
      tekshir = false;
    }
    while(tekshir){
      print("Please enter your name correctly");
      stdout.write(" Name : ");
      String? name = stdin.readLineSync()!;
      name = name;
      break;
    }
    String nickname = prompt("Nickname: ");
    String phone = prompt("Phone: ");

    if (isUserLoggedIn()) {
      print("User is already logged in. Cannot register a new user.");
      return;
    }

    User newUser = User('0', name, nickname.hashCode, nickname, phone, true);

    await NetworkService.postData(newUser);
    print('New User created: ${newUser.name}');
  }

  bool isUserLoggedIn() {

    return false; 
  }

  String prompt(String promptMessage) {
    stdout.write(promptMessage);
    return stdin.readLineSync()!;
  }
}
