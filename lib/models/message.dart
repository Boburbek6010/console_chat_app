class Message {
  late String from;
  late int to;
  late String text;

  Message(this.from, this.to, this.text);

  Message.fromJson(Map<String, dynamic> json) {
    from = json["from"];
    to = json["to"];
    text = json["text"];
  }

  Map<String, dynamic> toJson() => {"from": from, "to": to, "text": text};
}