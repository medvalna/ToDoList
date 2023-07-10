import 'dart:async';
import 'package:dio/dio.dart';
import 'package:to_do_list/main.dart';
import 'package:to_do_list/models/todo.dart';
import 'package:envied/envied.dart';

part 'package:to_do_list/envied/env.g.dart';

@Envied(path: '.env')
class NetworkManager {
  static const _url = "https://beta.mrdekk.ru/todobackend/list";
  String _revision = "";
  @EnviedField(varName: 'apiKey')
  static const apiKey = _Env.apiKey;

  Future<List<ToDo>> getTodoList() async {
    final response = await Dio().get(
      _url,
      options: Options(
        headers: {
          "Authorization": "Bearer $apiKey",
          "X-Last-Known-Revision": _revision,
        },
      ),
    );
    loggerNoStack.i(response.data);
    if (response.statusCode == 200) {
      final data = response.data;
      if (data is! Map<String, dynamic>) {
        return [];
      }
      final list = data['list'];
      if ((list == null) || (list is! List)) {
        return [];
      }
      return list.map((map) => ToDo.fromMapBackend(map)).toList();
    }

    throw ArgumentError("Unknown status code");
  }
}
