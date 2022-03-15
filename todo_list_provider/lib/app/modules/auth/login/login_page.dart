import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../../../core/widget/todo_list_field.dart';
import '../../../core/widget/todo_list_logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (
      BuildContext context,
      BoxConstraints constraints,
    ) {
      return SingleChildScrollView(
          child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: constraints.maxHeight,
          minWidth: constraints.maxWidth,
        ),
        child: IntrinsicHeight(
            //IntrinsicHeight -> controla o tamanho da tela
            // está controlando o tamanho da Column
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(height: 10),
          const TodoListLogo(),
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
              child: Form(
                  child: Column(children: [
                 TodoListField(label: 'Email'),
                const SizedBox(height: 20),
                 TodoListField(label: 'Senha', obscureText: true),
                const SizedBox(
                  height: 40,
                ),
                head3()
              ]))),
          const SizedBox(height: 20),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: const Color(0XFFF0F3F7),
                border: Border(
                    top: BorderSide(
                  width: 2,
                  color: Colors.grey.withAlpha(50),
                ))),
            child: Column(
              children: [
                const SizedBox(height: 30),
                SignInButton(
                  Buttons.Google,
                  padding: const EdgeInsets.all(5),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  text: 'Continue com o Google',
                  onPressed: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Não tem conta?'),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Cadastre-se',
                        ))
                  ],
                )
              ],
            ),
          ))
        ])),
      ));
    }));
  }

  Row head3() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      TextButton(
        onPressed: () {},
        child: const Text('Esqueceu sua senha?'),
      ),
      methodButton('Login')
    ]);
  }

  ElevatedButton methodButton(
    String text,
  ) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(text),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
