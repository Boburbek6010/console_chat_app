import 'dart:convert';
import 'dart:io';

import '../models/message.dart';

import '../models/user.dart';
import '../service/network__service.dart';
import 'menu.dart';

class TextingMenu extends Menu {
  static const id = "/texting_menu";

  @override
  build() async {
    String apiEndpoint = NetworkService.apiUser;
    String data = await NetworkService.getData(apiEndpoint);

    List<User> users =
        (json.decode(data) as List).map((json) => User.fromJson(json)).toList();
    User user = users[0];

    print("Contacts list:\n");

    for (int i = 0; i < user.contacts!.length; i++) {
      print('${i + 1} ${user.contacts![i].name}: ${user.contacts![i].phone}');
    }

    print("Choose the chat");
    int? chosenContact = int.tryParse(stdin.readLineSync()!);

    print("${user.contacts?[chosenContact! - 1].name}");

    int lastMessageId = 0;

    while (true) {
      String json = await NetworkService.getData(NetworkService.apiMessage);
      List<Message> messages = List<Message>.from(jsonDecode(json).map((e) => Message.fromJson(e)));

      for(int i = 0; i<messages.length; i++){
        if(messages[i].from == users[chosenContact!].id && messages[i].to.toString() == user.id){
          print("${messages[i].text}  ${messages[i].timeSent}");
        }
      }

      // Simulate typing and sending a message
      print("Type a message (type 'exit' to stop):");
      String? text = stdin.readLineSync();

      if (text == 'exit') {
        break;
      }

      Message newMessage = Message(user.id, chosenContact! - 1, text!);
      await NetworkService.postMessageData(newMessage);
    }
  }
}
