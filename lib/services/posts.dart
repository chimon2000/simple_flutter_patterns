import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchPost() async {
  await Future.delayed(Duration(seconds: 1));
  return http
      .get('https://jsonplaceholder.typicode.com/posts/1')
      .then(parseJSON);
}

Map<String, dynamic> parseJSON(http.Response response) {
  return json.decode(response.body);
}
