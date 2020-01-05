// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoController on _TodoController, Store {
  final _$itemsSelecionadosAtom =
      Atom(name: '_TodoController.itemsSelecionados');

  @override
  List<int> get itemsSelecionados {
    _$itemsSelecionadosAtom.context.enforceReadPolicy(_$itemsSelecionadosAtom);
    _$itemsSelecionadosAtom.reportObserved();
    return super.itemsSelecionados;
  }

  @override
  set itemsSelecionados(List<int> value) {
    _$itemsSelecionadosAtom.context.conditionallyRunInAction(() {
      super.itemsSelecionados = value;
      _$itemsSelecionadosAtom.reportChanged();
    }, _$itemsSelecionadosAtom, name: '${_$itemsSelecionadosAtom.name}_set');
  }

  final _$todosAtom = Atom(name: '_TodoController.todos');

  @override
  List<Todo> get todos {
    _$todosAtom.context.enforceReadPolicy(_$todosAtom);
    _$todosAtom.reportObserved();
    return super.todos;
  }

  @override
  set todos(List<Todo> value) {
    _$todosAtom.context.conditionallyRunInAction(() {
      super.todos = value;
      _$todosAtom.reportChanged();
    }, _$todosAtom, name: '${_$todosAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_TodoController.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$loadTodosAsyncAction = AsyncAction('loadTodos');

  @override
  Future loadTodos({bool refresh = false}) {
    return _$loadTodosAsyncAction.run(() => super.loadTodos(refresh: refresh));
  }

  final _$_TodoControllerActionController =
      ActionController(name: '_TodoController');

  @override
  dynamic selecionar(int id) {
    final _$actionInfo = _$_TodoControllerActionController.startAction();
    try {
      return super.selecionar(id);
    } finally {
      _$_TodoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clear() {
    final _$actionInfo = _$_TodoControllerActionController.startAction();
    try {
      return super.clear();
    } finally {
      _$_TodoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic adicionar(String content) {
    final _$actionInfo = _$_TodoControllerActionController.startAction();
    try {
      return super.adicionar(content);
    } finally {
      _$_TodoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic excluir() {
    final _$actionInfo = _$_TodoControllerActionController.startAction();
    try {
      return super.excluir();
    } finally {
      _$_TodoControllerActionController.endAction(_$actionInfo);
    }
  }
}
