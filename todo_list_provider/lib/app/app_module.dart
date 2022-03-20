import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/repositories/user_repository.dart';
import 'package:todo_list_provider/app/repositories/user_repository_impl.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';
import 'package:todo_list_provider/app/services/user/user_service_impl.dart';

import 'core/database/sqlite_connection_factory.dart';
import 'app_widget.dart';

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => FirebaseAuth.instance),
        Provider(lazy: false, create: (_) => SqliteConnectionFactory()),
        Provider<UserRepository>(create: (context) => UserRepositoryImpl(firebaseAuth: context.read())),
        Provider<UserService>(create: (context) => UserServiceImpl(userRepository: context.read()) ),
      ],
      child: const AppWidget(),
    );
  }
}
