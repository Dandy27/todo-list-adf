import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/notifier/default_listener_notifier.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/theme_extensions.dart';
import '../../../core/validators/validators.dart';
import '../../../core/widget/todo_list_field.dart';
import '../../../core/widget/todo_list_logo.dart';
import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final defaultListener = DefaultListenerNotifier(
        changeNotifier: context.read<RegisterController>());
    defaultListener.listener(
      context: context,
      successVoildCallback: (notifier, listenerInstance) {
        listenerInstance.dispose();
        Navigator.of(context).pushNamed('/login');
      },
      //esse atributo é opcional
      // errorVoildCallback: (notifier, listenerInstande) {
      //   print('Deu ruim!!!!');
      // },
    );

    // context.read<RegisterController>().addListener(() {
    //   final controller = context.read<RegisterController>();
    //   var success = controller.success;
    //   var error = controller.error;
    //   if (success) {
    //     Navigator.of(context).pop();
    //   } else if (error != null && error.isNotEmpty) {
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: Text(error),
    //       backgroundColor: Colors.red,
    //     ));
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
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
                  TodoListField(
                      controller: _emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('E-mail obrigatório'),
                        Validatorless.email('Email inválido')
                      ]),
                      label: 'E-mail'),
                  const SizedBox(height: 20),
                  TodoListField(
                    controller: _passwordEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha obrogatória'),
                      Validatorless.min(
                          6, 'Senha deve ter pelo menos 6 caracteres')
                    ]),
                    label: 'Senha',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  TodoListField(
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha obrigatória'),
                      Validators.compare(
                          _passwordEC, 'Senha diferente de confirma senha')
                    ]),
                    controller: _confirmPasswordEC,
                    label: 'Confirma Senha',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        onPressed: () {
                          final formValid =
                              _formKey.currentState?.validate() ?? false;
                          if (formValid) {
                            final email = _emailEC.text;
                            final password = _passwordEC.text;
                            context
                                .read<RegisterController>()
                                .registerUser(email, password);
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('Salvar'),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
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
