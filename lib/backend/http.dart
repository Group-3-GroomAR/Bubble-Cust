import 'dart:convert';
import 'dart:io';
import "package:http/http.dart" as http;

class RequestResult {
  bool ok;
  dynamic data;
  RequestResult(this.ok, this.data);
}

const PROTOCOL = "http";
const DOMAIN = "192.168.8.101:3000";

Future<RequestResult> httpGet(String route, [dynamic data]) async {
  var dataStr = jsonEncode(data);
  print("l");
  var url = "$PROTOCOL://$DOMAIN/$route?data=$dataStr";
  print("l");
  var result = await http.get(url);
  print("l");

  return RequestResult(true, jsonDecode(result.body));
}

Future<RequestResult> httpPost(String route, [dynamic data]) async {
  var url = "$PROTOCOL://$DOMAIN/$route";
  print(data.runtimeType);
  var dataStr = jsonEncode(data);
  print(dataStr.runtimeType);
//  var test = jsonDecode(data);
//  print(test);
  print(dataStr);

  var result = await http
      .post(url, body: dataStr, headers: {"Content-Type": "application/json"});

  return RequestResult(true, jsonDecode(result.body));
}
