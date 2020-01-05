import 'package:dio/dio.dart';
import 'package:todo_app/models/todo_model.dart';

class Api {
  final _dio = Dio();

  Api() {
    _dio.options =
        BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/");
  }

  Future<List<Todo>> getTodos() async {
    var response = await _dio.get("todos");

    List<Todo> data = [];

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        data.add(Todo.fromJson(item));
      }
    }

    return data;
  }
}
