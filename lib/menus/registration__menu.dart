import 'dart:convert';
import 'dart:io';
import '../models/user.dart';
import '../service/network__service.dart';
import 'menu.dart';

class Registration extends Menu {
  static const id = '/registration_menu';
  @override
  build() async {

    print("Enter user details:");
    String name = prompt("Name: ");
    String nickname = prompt("Nickname: ");
    String phone = prompt("Phone: ");

    User newUser = User('0', name, nickname, phone);

    await NetworkService.postData(newUser);
    print('New User created: ${newUser.name}');
  }

  String prompt(String promptMessage) {
    stdout.write(promptMessage);
    return stdin.readLineSync()!;
  }
}