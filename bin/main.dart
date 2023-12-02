import 'package:console_chat_app/menus/auth__menu.dart';
import 'package:console_chat_app/menus/registration__menu.dart';
import 'package:console_chat_app/menus/texting__menu.dart';
import 'package:console_chat_app/menus/userList__menu.dart';
import 'package:console_chat_app/my__app.dart';

void main() async {

  MyApp(
    home: Authentication(),
    routes: {
      TextingMenu.id: TextingMenu(),
      UserListMenu.id: UserListMenu(),
      Registration.id: Registration()
    }
  );
}