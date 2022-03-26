import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/notifier/default_listener_notifier.dart';
import '../../../core/ui/messages.dart';
import '../../../core/widget/todo_list_field.dart';
import '../../../core/widget/todo_list_logo.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _emailFocus = FocusNode();
  @override
  void initState() {
    super.initState();
    DefaultListenerNotifier(changeNotifier: context.read<LoginController>())
        .listener(
      context: context,
      successCallback: (notifier, listenerInstance) {
        print('Login Efetuado com sucesso');
      },
      everCallback: (notifier, listenerInstance) {
        if (notifier is LoginController) {
          if (notifier.hasInfo) {
            Messages.of(context).showInfo(notifier.infoMessage!);
          }
        }
      },
    );
  }

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
                  key: _formKey,
                  child: Column(children: [
                    TodoListField(
                      label: 'Email',
                      controller: _emailEC,
                      focusNode: _emailFocus,
                      validator: Validatorless.multiple([
                        Validatorless.required('E-mail obrigatório'),
                        Validatorless.email('E-mail inválido')
                      ]),
                    ),
                    const SizedBox(height: 20),
                    TodoListField(
                        label: 'Senha',
                        controller: _passwordEC,
                        validator: Validatorless.multiple([
                          Validatorless.required('Senha obrigatória'),
                          Validatorless.min(
                              6, 'Senha deve conter no minimo 6 caracteres'),
                        ]),
                        obscureText: true),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              if (_emailEC.text.isNotEmpty) {
                                context
                                    .read<LoginController>()
                                    .forgotPassword(_emailEC.text);
                              } else {
                                _emailFocus.requestFocus();
                                Messages.of(context).showError(
                                    'Digite um e-mail para recuperar senha');
                              }
                            },
                            child: const Text('Esqueceu sua senha?'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              final formValid =
                                  _formKey.currentState?.validate() ?? false;
                              if (formValid) {
                                final email = _emailEC.text;
                                final password = _passwordEC.text;
                                context
                                    .read<LoginController>()
                                    .login(email, password);
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('Login'),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          )
                        ]),
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
                        onPressed: () {
                          Navigator.of(context).pushNamed('/register');
                        },
                        child: const Text(
                          'Cadastre-se',
                        )),
                  ],
                )
              ],
            ),
          ))
        ])),
      ));
    }));
  }
}
