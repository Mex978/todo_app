import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/store/todo_controller.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final _todoController = BlocProvider.getDependency<TodoController>();
  final Todo item;

  TodoItem({this.item});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        bool _existemItemsSelecionados =
            _todoController.itemsSelecionados.isNotEmpty;
        bool _itemIsChecked =
            _todoController.itemsSelecionados.contains(item.id);
        return ListTile(
            trailing: _itemIsChecked
                ? Icon(
                    Icons.check_box,
                    color: Theme.of(context).primaryColor,
                  )
                : _existemItemsSelecionados
                    ? Icon(
                        Icons.check_box_outline_blank,
                        color: Theme.of(context).primaryColor,
                      )
                    : Container(width: 0),
            onTap: _existemItemsSelecionados
                ? () => _todoController.selecionar(item.id)
                : () => _itemInformation(context),
            onLongPress: () => _todoController.selecionar(item.id),
            title: Text(item.title));
      },
    );
  }

  _itemInformation(context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: MediaQuery.of(context).size.height * (1 / 2),
              child: Column(
                children: item.toJson().keys.map<Widget>((key) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${capitalize(key)}: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(width: 1),
                          ),
                          child: Text("${item.toJson()[key]}"),
                        ),
                        Divider(
                          color: Colors.transparent,
                          height: 10,
                        )
                      ],
                    ),
                  );
                }).toList()
                  ..insert(
                      0,
                      Padding(
                        padding: EdgeInsets.only(top: 16, bottom: 16),
                        child: Text(
                          "Todo Item",
                          style: TextStyle(fontSize: 24),
                        ),
                      )),
              ),
            ),
          );
        });
  }
}

String capitalize(String string) {
  if (string == null) {
    throw ArgumentError("string: $string");
  }

  if (string.isEmpty) {
    return string;
  }

  return string[0].toUpperCase() + string.substring(1);
}
