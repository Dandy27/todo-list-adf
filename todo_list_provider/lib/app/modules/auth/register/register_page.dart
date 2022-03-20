import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/validators/validators.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/theme_extensions.dart';
import '../../../core/widget/todo_list_field.dart';
import '../../../core/widget/todo_list_logo.dart';
import '../../auth/login/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    confirmPasswordEC.dispose();
    super.dispose();
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
                      controller: emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('E-mail obrigatório'),
                        Validatorless.email('Email inválido')
                      ]),
                      label: 'E-mail'),
                  const SizedBox(height: 20),
                  TodoListField(
                    controller: passwordEC,
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
                          passwordEC, 'Senha diferente de confirma senha')
                    ]),
                    controller: confirmPasswordEC,
                    label: 'Confirma Senha',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
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
