import 'dart:math';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/api.dart';

part 'todo_controller.g.dart';

class TodoController = _TodoController with _$TodoController;

abstract class _TodoController with Store {
  @observable
  List<int> itemsSelecionados = [];

  @observable
  List<Todo> todos = [];

  @observable
  bool loading = false;

  final _api = BlocProvider.getDependency<Api>();

  @action
  selecionar(int id) {
    List<int> temp = itemsSelecionados;
    if (temp.contains(id)) {
      temp.remove(id);
      itemsSelecionados = temp;
    } else {
      temp.add(id);
      itemsSelecionados = temp;
    }
  }

  @action
  clear() {
    itemsSelecionados = [];
  }

  @action
  loadTodos({bool refresh: false}) async {
    if (refresh) {
      List<Todo> todosTemp = await _api.getTodos();
      todos = todosTemp;
    } else {
      loading = true;
      List<Todo> todosTemp = await _api.getTodos();
      loading = false;
      todos = todosTemp;
    }
  }

  @action
  adicionar(String content) {
    Todo lastTodo = todos.lastWhere((item) => item.id != null);
    List<Todo> temp = todos;
    Random rand = Random.secure();
    temp.add(Todo(
        title: content,
        id: lastTodo.id + 1,
        userId: rand.nextInt(10),
        completed: false));
    todos = temp;
  }

  @action
  excluir() {
    List<Todo> todosTemp = todos;
    for (int id in itemsSelecionados) {
      todosTemp.removeWhere((item) => item.id == id);
    }
    todos = todosTemp;
    clear();
  }
}
