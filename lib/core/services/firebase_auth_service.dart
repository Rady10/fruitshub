import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruitshub/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password
  }) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;

    } on FirebaseAuthException catch (e) {

      log('FirebaseAuthException.createUser: ${e.message}');

      if (e.code == 'weak-password') {
        throw CustomException(message: 'هذه كلمة المرور ضعيفة. يرجى اختيار كلمة مرور أقوى.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'هذا البريد الالكترونى مسجل بالفعل.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'فشل الاتصال بالشبكة. يرجى التحقق من اتصالك بالإنترنت.');
      } else {
        throw CustomException(message: 'حدث خطأ ما. يرجى المحاولة مرة أخرى لاحقًا.');
      }
    } catch (e) {

      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword: $e');

      throw CustomException(message: 'حدث خطأ ما. يرجى المحاولة مرة أخرى لاحقًا.');
    }
  }

  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;

    } on FirebaseAuthException catch (e) {

      log('FirebaseAuthException.signIn: ${e.message}');

      if (e.code == 'user-not-found') {
        throw CustomException(message: 'البيانات المدخلة غير صحيحة. يرجى التحقق من البريد الالكترونى وكلمة المرور.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'البيانات المدخلة غير صحيحة. يرجى التحقق من البريد الالكترونى وكلمة المرور.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'فشل الاتصال بالشبكة. يرجى التحقق من اتصالك بالإنترنت.');
      } else {
        throw CustomException(message: 'حدث خطأ ما. يرجى المحاولة مرة أخرى لاحقًا.');
      }
    } catch (e) {

      log('Exception in FirebaseAuthService.signInWithEmailAndPassword: $e');

      throw CustomException(message: 'حدث خطأ ما. يرجى المحاولة مرة أخرى لاحقًا.');
    }
  }


  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

}