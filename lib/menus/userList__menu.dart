import 'dart:convert';

import '../models/user.dart';
import '../service/network__service.dart';
import 'menu.dart';

class UserListMenu extends Menu{
  static const id = "/userList_menu";

  @override
  build() async {
    String apiEndpoint = NetworkService.apiUser;
    String data = await NetworkService.getData(apiEndpoint);

    List<User> users = (json.decode(data) as List).map((json) => User.fromJson(json)).toList();

    for (User user in users) {
      print('ID: ${user.id}');
      print('Name: ${user.name}');
      print('Nick Name: ${user.nickName}');
      print('Phone: ${user.phone}');
      print('---------------------------------------');
    }
  }
}