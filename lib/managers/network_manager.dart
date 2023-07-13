import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:to_do_list/main.dart';
import 'package:to_do_list/models/todo.dart';
import 'package:envied/envied.dart';

part 'package:to_do_list/envied/env.g.dart';

@Envied(path: '.env')
class NetworkManager {
  //NetworkManager._();

  final Dio dio = Dio();

  //static final NetworkManager bd = NetworkManager();
  static const _url = "https://beta.mrdekk.ru/todobackend";
  static const _urllist = "https://beta.mrdekk.ru/todobackend/list";
  int _revision = 0;
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

  Future<dynamic> patch(List<ToDo> listOfTodos) async {
    //List data = [];
    /*for (ToDo todo in listOfTodos) {
      data.add(jsonEncode(todo.toMapBackend()));
    }*/
    //loggerNoStack.i(data);
    return await dio.patch(
      _urllist,
      data: jsonEncode({"list": listOfTodos.map((task) => task.toMapBackend()).toList()}),
          //data,
    )
        .then((value) {
      loggerNoStack.i('Данные на сервере успешно обновлены');
    }, onError: (error) {
      loggerNoStack.i(
          'Данные на сервере не обновлены (И обработали ошибку)', error);
    });
  }
}
