import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class LoginController extends ChangeNotifier {
  final UserService _userService;
  LoginController({required UserService userService})
      : _userService = userService;
}
