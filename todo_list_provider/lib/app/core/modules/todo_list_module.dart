import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

import 'todo_list_page.dart';

abstract class TodoListModule {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;
  TodoListModule({
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
