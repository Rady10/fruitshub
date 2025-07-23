import 'package:dartz/dartz.dart';
import 'package:fruitshub/core/errors/failures.dart';
import 'package:fruitshub/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {

  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    {required String email, required String password, required String name}
  );

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    {required String email, required String password}
  );

  Future<Either<Failure, UserEntity>> signInWithGoogle();

  //Facebook Sign in needs Configuration in Firebase Console
  Future<Either<Failure, UserEntity>> signInWithFacebook();

  Future addUserData({required UserEntity user});

  Future <UserEntity> getUserData({required String uId});

}