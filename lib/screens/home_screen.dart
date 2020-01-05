import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_app/store/todo_controller.dart';
import 'package:todo_app/widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _todoController = BlocProvider.getDependency<TodoController>();

  @override
  void initState() {
    _todoController.loadTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Aplication"),
          actions: <Widget>[
            Observer(
              builder: (_) {
                print("${_todoController.itemsSelecionados}");
                return Container();
              },
            ),
            Observer(
              builder: (_) {
                return _todoController.itemsSelecionados.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.remove_circle),
                        onPressed: () => _todoController.excluir(),
                      )
                    : Container();
              },
            ),
            IconButton(
              tooltip: "Adicionar item",
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
        body: Observer(builder: (_) {
          if (_todoController.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () => _todoController.loadTodos(refresh: true),
            child: ListView.builder(
              itemCount: _todoController.todos.length,
              itemBuilder: (_, index) {
                return TodoItem(item: _todoController.todos[index]);
              },
            ),
          );
        }));
  }
}
