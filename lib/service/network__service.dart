import 'package:http/http.dart';
import 'dart:convert';
import '../models/message.dart';
import '../models/user.dart';

class NetworkService {
  static const String baseUrl = '656785c664fcff8d731087d1.mockapi.io';
  static const String apiUser = '/Users';
  static const String apiMessage = '/message';

  static Future<String> getData(String api) async {
    Uri url = Uri.https(baseUrl, api);
    Response response = await get(url);
    return response.body;
  }

  static Future<void> postData(User product) async {
    Uri url = Uri.https(baseUrl, apiUser);
    await post(
      url,
      body: json.encode(product.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
  }

  static Future<void> postMessageData(Message message) async {
    Uri url = Uri.https(baseUrl, apiMessage);
    await post(
      url,
      body: json.encode(message.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
  }

  static Future<bool> deleteUser(String id) async {
    Uri url = Uri.http(baseUrl, "/Users$id");
    Response response =
        await delete(url, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
