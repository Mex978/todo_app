import 'package:mobx/mobx.dart';
import 'package:todo_app/services/api.dart';

part 'todo_controller.g.dart';

class TodoController = _TodoController with _$TodoController;

abstract class _TodoController with Store {
  @observable
  List<int> itemsSelecionados = [];

  @observable
  List<dynamic> todos = [];

  @observable
  bool loading = false;

  Api _api = Api();

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
  loadTodos() async {
    loading = true;
    var todosTemp = await _api.getTodos();
    loading = false;
    todos = todosTemp;
  }
}
