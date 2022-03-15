import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/database/sqlite_connection_factory.dart';
import 'app_widget.dart';

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider(
      lazy: false,
      create: (_) => SqliteConnectionFactory())],
      child: const AppWidget(),
    );
  }
}
