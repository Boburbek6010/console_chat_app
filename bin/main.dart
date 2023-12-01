import 'package:console_chat_app/menus/registration__menu.dart';
import 'package:console_chat_app/menus/texting__menu.dart';
import 'package:console_chat_app/menus/userList__menu.dart';
import 'package:console_chat_app/menus/welcome__menu.dart';
import 'package:console_chat_app/my__app.dart';


void main() async {

  MyApp(
    home: WelcomeMenu(),
    routes: {
      WelcomeMenu.id: WelcomeMenu(),
      UserListMenu.id: UserListMenu(),
      Registration.id: Registration(),
      TextingMenu.id: TextingMenu(),
    }
  );
}