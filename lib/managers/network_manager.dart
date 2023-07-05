import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:to_do_list/models/todo.dart';

class NetworkManager {
  static const _url = "https://beta.mrdekk.ru/todobackend/";
  const NetworkManager();
  Future<ToDo> getData() async {
    final uri = Uri.parse(_url);
    final response = await get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body) as Map<String, dynamic>;
      final todo = ToDo.fromJson(json);
      return todo;
    } /*TODO: обработать ошибки*/
    throw ArgumentError("Unknown status code");
  }
}
