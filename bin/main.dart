
import 'package:console_chat_app/menus/auth__menu.dart';
import 'package:console_chat_app/menus/main__menu.dart';
import 'package:console_chat_app/menus/registration__menu.dart';
import 'package:console_chat_app/menus/texting__menu.dart';
import 'package:console_chat_app/menus/userList__menu.dart';
import 'package:console_chat_app/my__app.dart';
import 'package:console_chat_app/service/navigator__service.dart';

void main() async {

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