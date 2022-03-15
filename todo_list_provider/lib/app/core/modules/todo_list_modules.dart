import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todo_list_provider/app/core/modules/todo_list_page.dart';

abstract class TodoListModules {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;
  TodoListModules({
    List<SingleChildWidget>? bindings,
    required Map<String, WidgetBuilder> routers,
  })  : _bindings = bindings,
        _routers = routers;

  Map<String, WidgetBuilder> get routers {
    return _routers.map((key, pageBuilder) => MapEntry(
        key,
        (_) => TodoListPage(
              page: pageBuilder,
              bindings: _bindings,
            )));
  }
}