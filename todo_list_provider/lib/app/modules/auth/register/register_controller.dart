import 'package:flutter/cupertino.dart';
import 'package:todo_list_provider/exception/auth_exceptions.dart';

import '../../../services/user/user_service.dart';

class RegisterController extends ChangeNotifier {
  final UserService _userService;
  String? error;
  bool success = false;

  RegisterController({required UserService userService})
      : _userService = userService;

  Future<void> registerUser(String email, String password) async {
    try {
      error = null;
      success = false;
      final user = await _userService.register(email, password);
      if (user != null) {
        success == true;
        notifyListeners();
      } else {
        error = 'Erro ao registrar o usuário';
      }
      notifyListeners();
    } on AuthExceptions catch (e) {
      error = e.message;
    } finally {
      notifyListeners();
    }
  }
}
