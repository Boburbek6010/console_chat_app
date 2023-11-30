import 'dart:convert';
import 'package:console_chat_app/models/user.dart';
import 'package:http/http.dart';

class NetworkService {

  static const String baseUrl = '656785c664fcff8d731087d1.mockapi.io';
  static const String apiUser = '/Users';

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
}