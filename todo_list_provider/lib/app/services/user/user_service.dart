import 'package:firebase_auth/firebase_auth.dart';

abstract class UserService {
  Future<User?> register(String email, String password);
  Future<User?> login(String email, String password);
  Future<void> forgotPassword(String email);
  Future<User?> googleLogin();
<<<<<<< HEAD
  Future<void> googleLogout();
=======
>>>>>>> e96d234ffdfac4037fa04b072e2f76cad09d0d5a
}
