import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_app/store/home_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeController = HomeController();

  @override
  void initState() {
    _homeController.loadTodos();
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
              print("${_homeController.itemsSelecionados}");
              return Container();
            },
          ),
          Observer(
            builder: (_) {
              return _homeController.itemsSelecionados.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {},
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
      body: Observer(
        builder: (_) {
          if (_homeController.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List items = _homeController.todos;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (_, index) {
              return Observer(
                builder: (_) {
                  bool isNotEmpty =
                      _homeController.itemsSelecionados.isNotEmpty;
                  bool isChecked =
                      _homeController.itemsSelecionados.contains(index);
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
                              _homeController.selecionar(items[index]["id"]);
                            }
                          : () {},
                      onLongPress: () {
                        _homeController.selecionar(items[index]["id"]);
                      },
                      title: Text("${items[index]["title"]}"));
                },
              );
            },
          );
        },
      ),
    );
  }
}
