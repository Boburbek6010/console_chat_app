import 'dart:convert';
import 'package:console_chat_app/service/network_service.dart';
import 'package:console_chat_app/modles/user.dart';

void main() async{
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