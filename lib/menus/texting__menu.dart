import 'dart:convert';
import 'dart:io';

import 'package:console_chat_app/menus/welcome__menu.dart';

import '../models/contact.dart';
import '../models/message.dart';

import '../models/user.dart';
import '../service/navigator__service.dart';
import '../service/network__service.dart';
import 'menu.dart';

class TextingMenu extends Menu {
  static const id = "/texting_menu";
  static User user = User(
    '1',
    "John Doe",
    'password123',
    'JohnD',
    '123456789',
    true,
    contacts: [
      Contacts('Friend 1', '987654321')
    ],
  );

  @override
  build() async {
    String apiEndpoint = NetworkService.apiUser;
    String data = await NetworkService.getData(apiEndpoint);

    List<User> users =
        (json.decode(data) as List).map((json) => User.fromJson(json)).toList();

    print("Contacts list:\n");

    for (int i = 0; i < user.contacts!.length; i++) {
      print('${i + 1} ${user.contacts![i].name}: ${user.contacts![i].phone}');
    }

    print("Choose the chat");
    int? chosenContact = int.tryParse(stdin.readLineSync()!);

    print("${user.contacts?[chosenContact! - 1].name}");

    DateTime lastMessage = DateTime(2022, 12, 2);

    while (true) {
      String json = await NetworkService.getData(NetworkService.apiMessage);
      List<Message> messages = List<Message>.from(jsonDecode(json).map((e) => Message.fromJson(e)));
      print("Type a message (type 'exit' to stop):");
      for(int i = 0; i<messages.length; i++){
        if(messages[i].from == users[chosenContact!].id && messages[i].to.toString() == user.id && messages[i].timeSent.isAfter(lastMessage)){
          print("${messages[i].text}  ${messages[i].timeSent.hour}:${messages[i].timeSent.minute}");
          lastMessage = messages[i].timeSent;
        }
      }

      // Simulate typing and sending a message
      String? text = stdin.readLineSync();
      if (text == 'exit') {
        await Navigator.push(WelcomeMenu());
      }

      Message newMessage = Message(user.id, chosenContact! - 1, text!);
      await NetworkService.postMessageData(newMessage);
    }
  }
}
