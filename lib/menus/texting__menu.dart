import 'dart:convert';
import 'dart:io';

import 'package:console_chat_app/menus/welcome__menu.dart';
import 'package:console_chat_app/service/extension_colors.dart';

import '../models/contact.dart';
import '../models/message.dart';

import '../models/user.dart';
import '../service/navigator__service.dart';
import '../service/network__service.dart';
import '../service/user_service.dart';
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
    contacts: [Contacts('Friend 1', '987654321')],
  );

  @override
  build() async {
    String apiEndpoint = NetworkService.apiUser;
    String data = await NetworkService.getData(apiEndpoint);

    List<User> users =
        (json.decode(data) as List).map((json) => User.fromJson(json)).toList();

    print("Contacts list:\n");

    for (int i = 0; i < user.contacts!.length; i++) {
      print('${i} ${user.contacts![i].name}: ${user.contacts![i].phone}');
    }

    print("Choose the chat");
    int? chosenContact = int.tryParse(stdin.readLineSync()!);

    print("${user.contacts?[chosenContact!].name}");

    String currentFriendId =
        await getUserIdByPhone(user.contacts![chosenContact!].phone);

    print("Current friend id: $currentFriendId");

    DateTime lastMessage = DateTime(2022, 12, 2, 12, 12, 12);

    print("Type a message (type 'exit' to stop):");
    while (true) {
      String json = await NetworkService.getData(NetworkService.apiMessage);
      List<Message> messages =
          List<Message>.from(jsonDecode(json).map((e) => Message.fromJson(e)));
      for (int i = 0; i < messages.length; i++) {
        if (messages[i].from == currentFriendId &&
                messages[i].to.toString() == user.id &&
                messages[i].timeSent.isAfter(lastMessage) ||
            messages[i].from == user.id &&
                messages[i].to.toString() == currentFriendId &&
                messages[i].timeSent.isAfter(lastMessage)) {
          // |
          if (messages[i].from == user.id) {
            String myText =
                "${messages[i].text}  ${messages[i].timeSent.hour}:${messages[i].timeSent.minute}";
            fGreen(myText);
          } else if (messages[i].from == currentFriendId) {
            String theirText =
                "${messages[i].text}  ${messages[i].timeSent.hour}:${messages[i].timeSent.minute}";
            int consoleWidth = 80;
            int spaces = consoleWidth - theirText.length;
            String rightAlignedText =
                theirText.padLeft(spaces + theirText.length);
            fRed(rightAlignedText);
          }
          lastMessage = messages[i].timeSent;
        }
      }

      // Simulate typing and sending a message
      String? text = stdin.readLineSync();
      if (text == 'exit') {
        await Navigator.push(WelcomeMenu());
      }

      Message newMessage = Message(user.id, int.parse(currentFriendId), text!);
      await NetworkService.postMessageData(newMessage);
    }
  }
}
