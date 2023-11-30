class User {
  late String id;
  late String name;
  late String nickName;
  late String phone;

  User(this.id, this.name, this.nickName, this.phone);

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nickName = json['nickName'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    return{
      'id': id,
      'name': name,
      'nickName': nickName,
      'phone': phone,
    };
  }
}
