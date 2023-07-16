import 'dart:async';
import 'package:dio/dio.dart';
import 'package:to_do_list/main.dart';
import 'package:to_do_list/models/todo.dart';
import 'package:envied/envied.dart';

part 'package:to_do_list/envied/env.g.dart';

@Envied(path: '.env')
class NetworkManager {
  final Dio dio = Dio();

  static const _url = "https://beta.mrdekk.ru/todobackend";
  static const _urllist = "https://beta.mrdekk.ru/todobackend/list";
  final int _revision = 0;
  @EnviedField(varName: 'apiKey')
  static const apiKey = _Env.apiKey;

  NetworkManager() {
    setDio();
  }

  void setDio() {
    dio.options = BaseOptions(
      baseUrl: _url,
      headers: {
        'Authorization': 'Bearer $apiKey',
        'X-Last-Known-Revision': _revision,
      },
    );
  }

  Future<List<ToDo>> getTodoList() async {
    final response = await dio.get(
      _urllist,
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

  Future<dynamic> patch(List<ToDo> list) async {
    List<Map<String, dynamic>> data = [];
    for (ToDo todo in list) {
      data.add(todo.toMapBackend());
    }
    return await dio
        .patch(
      _urllist,
      data: data,
    )
        .then((value) {
      loggerNoStack.i('data is updated');
    }, onError: (error) {
      loggerNoStack.i('Data is not updated', error);
    });
  }
}
