// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$itemsSelecionadosAtom =
      Atom(name: '_HomeController.itemsSelecionados');

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

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  dynamic selecionar(int id) {
    final _$actionInfo = _$_HomeControllerActionController.startAction();
    try {
      return super.selecionar(id);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clear() {
    final _$actionInfo = _$_HomeControllerActionController.startAction();
    try {
      return super.clear();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }
}
