import 'package:console_chat_app/menus/menu.dart';

import '../models/contact.dart';
import '../models/user.dart';

class ContactsListMenu extends Menu{
  static const id = '/contacts_list_menu';

  @override
  build() {
    print("Contacts:");

    User currentUser = Menu.user;
    List<Contacts>? contacts = currentUser.contacts;

    for(int i = 0; i<contacts!.length; i++){
      print("${contacts[i].name}  ${contacts[i].phone}");
    }
  }
}