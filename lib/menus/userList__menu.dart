import 'dart:convert';
import '../models/user.dart';
import '../service/network__service.dart';
import 'menu.dart';
import 'dart:io';

class UserListMenu extends Menu{
  static const id = "/userList_menu";

  @override
  build() async {
    String apiEndpoint = NetworkService.apiUser;
    String data = await NetworkService.getData(apiEndpoint);

    List<User> users = (json.decode(data) as List).map((json) => User.fromJson(json)).toList();
    print('\nList of Users: ');
    for (User user in users) {
      
      print('\n${user.id} Name: ${user.name} Nick: ${user.nickName} Phone: ${user.phone}');
      
    }

  }

}