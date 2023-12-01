import '../models/contact.dart';

class User {
  late String id;
  late String name;
  late String nickName;
  late String phone;
  late int password;
  late bool isLogged;
  List<Contacts>? contacts;

  User(this.id, this.name, this.password, this.nickName, this.phone, this.isLogged, {List<Contacts>? contacts})
      : contacts = contacts ?? <Contacts>[];

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        password = int.parse(json['password'].toString()),
        nickName = json['nickName'],
        phone = json['phone'].toString(),
        isLogged = json['isLogged'],
        contacts = (json['contacts'] as List<dynamic>?)
            ?.map((contactJson) => Contacts.fromJson(contactJson))
            .toList() ?? <Contacts>[];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'nickName': nickName,
      'phone': phone,
      'isLogged': isLogged,
      'contacts': contacts?.map((contact) => contact.toJson()).toList(),
    };
  }
}