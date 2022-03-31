import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/user/user_repository.dart';
import 'user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  UserServiceImpl({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<User?> register(String email, String password) =>
      _userRepository.register(email, password);

  @override
  Future<User?> login(String email, String password) =>
      _userRepository.login(email, password);

  @override
  Future<void> forgotPassword(String email) =>
      _userRepository.forgotPassword(email);

  @override
  Future<User?> googleLogin() => _userRepository.googleLogin();
<<<<<<< HEAD

  @override
  Future<void> googleLogout() => _userRepository.googleLogout();
=======
>>>>>>> e96d234ffdfac4037fa04b072e2f76cad09d0d5a
}
