import 'dart:convert';
import 'package:console_chat_app/menus/userList__menu.dart';
import 'package:console_chat_app/menus/welcome__menu.dart';
import 'package:console_chat_app/my__app.dart';
import 'package:console_chat_app/service/network__service.dart';
import 'package:console_chat_app/models/user.dart';

void main() async {

  MyApp(
      home: WelcomeMenu(),
      routes: {WelcomeMenu.id: WelcomeMenu(), UserListMenu.id: UserListMenu()});
}
