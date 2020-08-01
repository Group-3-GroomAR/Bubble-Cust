import 'dart:convert';
import "package:http/http.dart" as http;

class RequestResult {
  bool ok;
  dynamic data;
  RequestResult(this.ok, this.data);
}

const PROTOCOL = "http";
const DOMAIN = "192.168.43.70:3000";

Future<RequestResult> httpGet(String route, [dynamic data]) async {
  var dataStr = jsonEncode(data);
  print("l");
  print(dataStr);
  var url = "$PROTOCOL://$DOMAIN/$route?data=$dataStr";
  //var url = "$PROTOCOL://$DOMAIN/$route";
  print("l");

  try {
    var result = await http.get(url);
    print("data has been recived from server");
    //print(result.body);
    return RequestResult(true, jsonDecode(result.body));
  } catch (e) {
    print(e.toString());
    return RequestResult(false, "Connection error");
  }
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
