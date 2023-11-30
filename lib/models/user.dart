import 'package:console_chat_app/models/contact.dart';

class User {
  late String id;
  late String name;
  late String nickName;
  late String phone;
  late int password;
  late bool isLogged;
  List<Contacts>? contacts;

  User(this.id, this.name, this.password, this.nickName, this.phone, this.isLogged);

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    password = json['password'];
    nickName = json['nickName'];
    phone = json['phone'];
    isLogged = json['isLogged'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'nickName': nickName,
      'phone': phone,
      'isLogged': isLogged,
    };
  }
}
