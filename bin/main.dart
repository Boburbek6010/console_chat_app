
import 'dart:convert';

import 'package:console_chat_app/menus/auth__menu.dart';
import 'package:console_chat_app/menus/main__menu.dart';
import 'package:console_chat_app/menus/menu.dart';
import 'package:console_chat_app/menus/registration__menu.dart';
import 'package:console_chat_app/menus/texting__menu.dart';
import 'package:console_chat_app/menus/userList__menu.dart';
import 'package:console_chat_app/models/message.dart';
import 'package:console_chat_app/models/user.dart';
import 'package:console_chat_app/my__app.dart';
import 'package:console_chat_app/service/navigator__service.dart';
import 'package:console_chat_app/service/network__service.dart';

void main() async {

  String data = await NetworkService.getData(NetworkService.apiUser);
  List<User> users = (json.decode(data) as List).map((json) => User.fromJson(json)).toList();

  String messageData =
  await NetworkService.getData(NetworkService.apiMessage);
  List<Message> messages = List<Message>.from(
      jsonDecode(messageData).map((e) => Message.fromJson(e)));

  Menu.users = users;
  Menu.messages = messages;

  await Navigator.push(Authentication());
 
  MyApp(
    home: MainMenu(),
    routes: {
      TextingMenu.id: TextingMenu(),
      UserListMenu.id: UserListMenu(),
      Registration.id: Registration()
    }
  );
}