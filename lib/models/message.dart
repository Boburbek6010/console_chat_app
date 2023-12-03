int a = 0;

class Message {
  late int messageId;
  late String from;
  late int to;
  late String text;
  late DateTime timeSent;

  Message(this.from, this.to, this.text) {
    this.timeSent = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour, DateTime.now().minute, DateTime.now().second);
    a++;
    this.messageId = a;
  }

  Message.fromJson(Map<String, dynamic> json) {
    from = json["from"];
    to = json["to"];
    text = json["text"];
    timeSent = DateTime.parse(json["timeSent"]);
  }

  Map<String, dynamic> toJson() => {"from": from, "to": to, "text": text, "timeSent": timeSent.toIso8601String()};
}
