import 'package:dio/dio.dart';

class Api {
  final _dio = Dio();

  Api() {
    _dio.options =
        BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/");
  }

  Future getTodos() async {
    print("Entrou");
    var response = await _dio.get("todos");

    // print(response.data);

    return response.data;
  }
}
