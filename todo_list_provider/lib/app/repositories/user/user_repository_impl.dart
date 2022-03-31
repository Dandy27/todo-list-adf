import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../exception/auth_exception.dart';
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

      if (e.code == 'email-already-in-use') {
        final loginTypes =
            await _firebaseAuth.fetchSignInMethodsForEmail(email);
        if (loginTypes.contains('password')) {
          throw AuthException(
              message: 'E-mail já utilizado, por favor escolha outro e-mail');
        } else {
          throw AuthException(
              message:
                  'Você se cadastrou no TodoList pelo Google, por favor utilize ele para entrar');
        }
      } else {
        throw AuthException(message: 'Erro ao registrar o usuário');
      }
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      final userCredencial = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredencial.user;
    } on PlatformException catch (e, s) {
      print(e);
      print(s);
      throw AuthException(message: e.message ?? 'Erro ao realizar login');
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);
      throw AuthException(message: e.message ?? 'Erro ao realizar login');
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      final loginMethods =
          await _firebaseAuth.fetchSignInMethodsForEmail(email);
      if (loginMethods.contains('password')) {
        await _firebaseAuth.sendPasswordResetEmail(email: email);
      } else if (loginMethods.contains('google')) {
        throw AuthException(
            message:
                'Cadastro realizado com o google, não pode ser restado a senha');
      } else {
        throw AuthException(message: 'E-mail não cadastrado');
      }
    } on PlatformException catch (e, s) {
      print(e);
      print(s);
      throw AuthException(message: 'Erro ao restar senha');
    }
  }

  @override
  Future<User?> googleLogin() async {
    List<String>? loginMethods;
    try {
<<<<<<< HEAD
      final googleSignIn = GoogleSignIn();
      final googleUser = await googleSignIn.signIn();
=======
      final googleSingIn = GoogleSignIn();
      final googleUser = await googleSingIn.signIn();
>>>>>>> e96d234ffdfac4037fa04b072e2f76cad09d0d5a
      if (googleUser != null) {
        loginMethods =
            await _firebaseAuth.fetchSignInMethodsForEmail(googleUser.email);

        if (loginMethods.contains('password')) {
          throw AuthException(
              message:
<<<<<<< HEAD
                  'Você utilizou o e-mail para cadastro TodoList, caso tenha esquecido sua semha por favor click no link esqueci minha senha ');
        } else {
          final googleAuth = await googleUser.authentication;
          final firebaseCredential = GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
          var userCrential =
              await _firebaseAuth.signInWithCredential(firebaseCredential);
          return userCrential.user;
=======
                  'Você utilizou o e-mail para cadastro no TodoList, caso tenha esquecido sua senha por favor clique no link esqueci minha senha ');
        } else {
          final googleAuth = await googleUser.authentication;
          final firebaseCredencial = GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
          var userCredencial =
              await _firebaseAuth.signInWithCredential(firebaseCredencial);
          return userCredencial.user;
>>>>>>> e96d234ffdfac4037fa04b072e2f76cad09d0d5a
        }
      }
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);
<<<<<<< HEAD
      if (e.code == 'account-exits-with-different-credential') {
        throw AuthException(
            message:
                '''Login inválido, você se registrou no TodoList com os seguintes provedores
                ${loginMethods?.join(',')}
        ''');
      } else {
        throw AuthException(message: 'Erro ao realizar o login');
      }
    }
  }

  @override
  Future<void> googleLogout() async {
    await GoogleSignIn().signOut();
    _firebaseAuth.signOut();
=======
      if (e.code == 'account-exists-with-different-credential') {
        throw AuthException(message: '''
              Login inválido você se registrou no TodoList com os seguintes provedores:
              ${loginMethods?.join(',')}''');
      } else {
        throw AuthException(message: 'Erro ao realizar login');
      }
    }
    // return null;
>>>>>>> e96d234ffdfac4037fa04b072e2f76cad09d0d5a
  }
}
