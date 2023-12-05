import 'dart:convert';
import 'dart:io';

import 'package:console_chat_app/menus/main__menu.dart';
import 'package:console_chat_app/service/extension_colors.dart';
import 'package:console_chat_app/service/extension_service.dart';

import '../models/message.dart';

import '../models/user.dart';
import '../service/navigator__service.dart';
import '../service/network__service.dart';
import '../service/user_service.dart';
import 'menu.dart';

class TextingMenu extends Menu {
  static const id = "/texting_menu";

  @override
  build() async {
    // String userData = await NetworkService.getData(NetworkService.apiUser);
    // List<User> users = (json.decode(userData) as List)
    //     .map((json) => User.fromJson(json))
    //     .toList();

    String messageData =
        await NetworkService.getData(NetworkService.apiMessage);
    List<Message> messages = (json.decode(messageData) as List)
        .map((json) => Message.fromJson(json))
        .toList();

    User user1 = Menu.user;
    fGreen("╔═══════════════════════════╗");
    fGreen("║ ${'contacts_list'.tr}:    ║");
    fGreen("║ ${'anyexit'.tr}           ║ ");
    fGreen("╚═══════════════════════════╝");
    for (int i = 0; i < user1.contacts!.length; i++) {
      print('${i + 1} ${user1.contacts![i].name}: ${user1.contacts![i].phone}');
    }

    print("${'massagelf'.tr} ...");

    /// strangers list
    for (Message msg in messages) {
      bool yoyo = await isMyContact(user1.contacts, msg.from);
      if (msg.to.toString() == user1.id && !yoyo) {
        print(
            "m".tr);
        User axx = await getUserById(msg.from);
        print("${axx.name} ${axx.phone}");
      }
    }

    stdout.write("${'choose_chat'.tr}: ");

    int? chosenContact = int.tryParse(stdin.readLineSync()!)! - 1;

    if (chosenContact >= 0 && chosenContact <= user1.contacts!.length) {
      print("${user1.contacts?[chosenContact].name}");
      String currentFriendId =
          await getUserIdByPhone(user1.contacts![chosenContact].phone);

      // print("Current friend id: $currentFriendId");

      DateTime lastMessage = DateTime(2022, 12, 2, 12, 12, 12);

      print("${'type_close'.tr}:");
      while (true) {
        String json = await NetworkService.getData(NetworkService.apiMessage);
        List<Message> messages = List<Message>.from(
            jsonDecode(json).map((e) => Message.fromJson(e)));
        for (int i = 0; i < messages.length; i++) {
          if (messages[i].from == currentFriendId &&
                  messages[i].to.toString() == user1.id &&
                  messages[i].timeSent.isAfter(lastMessage) ||
              messages[i].from == user1.id &&
                  messages[i].to.toString() == currentFriendId &&
                  messages[i].timeSent.isAfter(lastMessage)) {
            if (messages[i].from == user1.id) {
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
        if (text == 'exit'.tr) {
          await Navigator.push(TextingMenu());
        }

        Message newMessage =
            Message(user1.id, int.parse(currentFriendId), text!);
        await NetworkService.postMessageData(newMessage);
      }
    }
    else {
      await Navigator.push(MainMenu());
    }
  }
}
