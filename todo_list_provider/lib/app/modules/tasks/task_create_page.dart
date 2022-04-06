import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_field.dart';

import 'task_create_controller.dart';

class TaskCreatePage extends StatelessWidget {
  TaskCreateController _controller;

  TaskCreatePage({
    Key? key,
    required TaskCreateController controller,
  })  : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text('Tasks'),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (() {}),
          label: const Text(
            'Salvar Task',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Form(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Criar Atividade',
                style: context.titleStyle.copyWith(fontSize: 20),
              ),
            ),
            const SizedBox(height: 30),
            TodoListField(label: '')

          ],
        ),
      )),
    );
  }
}