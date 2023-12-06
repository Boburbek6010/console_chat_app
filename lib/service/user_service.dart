import 'dart:convert';

import '../menus/menu.dart';
import '../models/contact.dart';
import '../models/user.dart';
import 'network__service.dart';

Future<String> getUserIdByPhone(String phone) async {
  String userId = "0";

  for (int i = 0; i < Menu.users.length; i++) {
    if (Menu.users[i].phone == phone) {
      userId = Menu.users[i].id;
    }
  }

  return userId;
}

Future<User> getUserById(String id) async {
  User user1 = User(
    '1',
    "John Doe",
    'password123',
    'JohnD',
    '123456789',
    true,
    contacts: [Contacts('Friend 1', '987654321')],
  );

  for (User user in Menu.users) {
    if (user.id == id) {
      user1 = user;
    }
  }
  return user1;
}

Future<bool> isMyContact(List<Contacts>? contacts, String strangerId, List<User> users) async {
  bool toReturn = false;

  String phoneNumber = "";

  for (User user in users) {
    if (user.id == strangerId) {
      phoneNumber = user.phone;
    }
  }

  for (Contacts c in contacts!) {
    if (c.phone == phoneNumber) toReturn = true;
  }

  return toReturn;
}
