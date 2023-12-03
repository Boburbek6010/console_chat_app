import 'dart:convert';

import '../models/contact.dart';
import '../models/user.dart';
import 'network__service.dart';

Future<String> getUserIdByPhone(String phone) async {
  String json = await NetworkService.getData(NetworkService.apiUser);
  List<User> users =
      List<User>.from(jsonDecode(json).map((e) => User.fromJson(e)));

  String userId = "0";

  for (int i = 0; i < users.length; i++) {
    if (users[i].phone == phone) {
      userId = users[i].id;
    }
  }

  return userId;
}

Future<User> getUserById(String id) async {
  String json = await NetworkService.getData(NetworkService.apiUser);
  List<User> users =
      List<User>.from(jsonDecode(json).map((e) => User.fromJson(e)));

  User user1 = User(
    '1',
    "John Doe",
    'password123',
    'JohnD',
    '123456789',
    true,
    contacts: [Contacts('Friend 1', '987654321')],
  );

  for (User user in users) {
    if (user.id == id) {
      user1 = user;
    }
  }
  return user1;
}

Future<bool> isMyContact(List<Contacts>? contacts, String strangerId) async {
  String json = await NetworkService.getData(NetworkService.apiUser);
  List<User> users =
      List<User>.from(jsonDecode(json).map((e) => User.fromJson(e)));

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
