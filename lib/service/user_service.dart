import 'dart:convert';

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
