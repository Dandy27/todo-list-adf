import '../../core/modules/todo_list_modules.dart';
import 'home_page.dart';

class HomeModule extends TodoListModule {
  HomeModule()
      : super(
          // bindings: [],
          routers: {
            '/home': (context) => const HomePage(),
          },
        );
}
