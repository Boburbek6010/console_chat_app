import 'dart:convert';
import 'dart:io';

import 'package:console_chat_app/models/message.dart';

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

    for (int i = 0; i <= user.contacts!.length - 1; i++) {
      print('${i + 1} ${user.contacts![i].name}: ${user.contacts![i].phone}');
    }

    print("Choose the chat");
    int? chosen_contact = int.tryParse(stdin.readLineSync()!);

    print("${user.contacts?[chosen_contact! - 1].name}");

    print("test message:");

    String? text = stdin.readLineSync();

    Message message = Message(user.id, chosen_contact! - 1, text!);

    await NetworkService.postMessageData(message);

    String messages = await NetworkService.getData(NetworkService.apiMessage);

    print(messages);
  }
}
