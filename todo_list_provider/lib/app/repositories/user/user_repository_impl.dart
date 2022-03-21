import 'package:firebase_auth/firebase_auth.dart';

import '../../../exception/auth_exceptions.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  UserRepositoryImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);
      //email-already-exists
      if (e.code == 'email-already-in-use') {
        final loginTypes =
            await _firebaseAuth.fetchSignInMethodsForEmail(email);
        if (loginTypes.contains('password')) {
          throw AuthExceptions(
              message: 'E-mail já utilizado, por favor escolha outro e-mail');
        } else {
          throw AuthExceptions(
              message:
                  'Você se cadastrou no TodoList pelo Google, por favor utilize ele para entrar');
        }
      } else {
        throw AuthExceptions(message: 'Erro ao registrar o usuário');
      }
    }
  }
}
