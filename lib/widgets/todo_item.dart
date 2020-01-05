import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_app/store/todo_controller.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final _todoController = BlocProvider.getDependency<TodoController>();
  final int index;
  final dynamic item;

  TodoItem({this.index, this.item});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        bool isNotEmpty = _todoController.itemsSelecionados.isNotEmpty;
        bool isChecked = _todoController.itemsSelecionados.contains(index);
        return ListTile(
            trailing: isChecked
                ? Icon(
                    Icons.check_box,
                    color: Theme.of(context).primaryColor,
                  )
                : isNotEmpty
                    ? Icon(
                        Icons.check_box_outline_blank,
                        color: Theme.of(context).primaryColor,
                      )
                    : Row(mainAxisSize: MainAxisSize.min),
            onTap: isNotEmpty
                ? () {
                    _todoController.selecionar(item["id"]);
                  }
                : () {},
            onLongPress: () {
              _todoController.selecionar(item["id"]);
            },
            title: Text("${item["title"]}"));
      },
    );
  }
}