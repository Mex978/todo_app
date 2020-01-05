import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_app/store/todo_controller.dart';
import 'package:todo_app/widgets/todo_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _todoController = BlocProvider.getDependency<TodoController>();
    TextEditingController _textEditController;
    _todoController.loadTodos();

    return Scaffold(
        appBar: AppBar(
          title: Text("Aplication"),
          actions: <Widget>[
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
              onPressed: () {
                _textEditController = TextEditingController();
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Container(
                          height: MediaQuery.of(context).size.height * (1 / 2),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: TextField(
                                    maxLines: null,
                                    keyboardType: TextInputType.multiline,
                                    controller: _textEditController,
                                    decoration: InputDecoration(
                                        hintText: "Digite aqui",
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    FlatButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        "Cancelar",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        print(_textEditController.text);
                                        if (_textEditController
                                            .text.isNotEmpty) {
                                          _todoController.adicionar(
                                              _textEditController.text);
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Text(
                                        "Adicionar",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
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
