import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitshub/core/errors/exceptions.dart';

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

}