import 'package:flutter/material.dart';

import '../../../core/ui/theme_extensions.dart';
import '../../../core/widget/todo_list_field.dart';
import '../../../core/widget/todo_list_logo.dart';
import '../../auth/login/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTodoListCadastro(context),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * .5,
            child: const FittedBox(
              child: TodoListLogo(),
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: Column(
              children: [
                TodoListField(label: 'E-mail'),
                const SizedBox(height: 20),
                TodoListField(
                  label: 'Senha',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                TodoListField(
                  label: 'Confirma Senha',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.bottomRight,
                  child:  ButtonElevatedButton(
                    text: 'Salvar',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBarTodoListCadastro(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Todo List',
            style: TextStyle(
              fontSize: 10,
              color: context.primaryColor,
            ),
          ),
          Text(
            'Cadastro',
            style: TextStyle(
              fontSize: 15,
              color: context.primaryColor,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: ClipOval(
            child: Container(
              color: context.primaryColor.withAlpha(20),
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back_ios_outlined,
                size: 20,
                color: context.primaryColor,
              ),
            ),
          )),
    );
  }
}
