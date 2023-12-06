import 'dart:convert';

import 'package:console_chat_app/models/message.dart';

import '../models/contact.dart';
import '../models/user.dart';
import '../service/network__service.dart';

abstract class Menu{

  static late List<User> users;
  static late List<Message> messages;

  build();
  static User user = User(
    '1',
    "John Doe",
    'password123',
    'JohnD',
    '123456789',
    true,
    contacts: [Contacts('Friend 1', '987654321')],
  );
}