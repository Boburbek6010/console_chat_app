class Contacts {
  late String name;
  late String phone;

  Contacts(this.name, this.phone);

  Contacts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
    };
  }
}
