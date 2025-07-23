import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitshub/core/errors/exceptions.dart';
import 'package:fruitshub/core/errors/failures.dart';
import 'package:fruitshub/core/services/database_service.dart';
import 'package:fruitshub/core/services/firebase_auth_service.dart';
import 'package:fruitshub/core/utils/backend_endpoints.dart';
import 'package:fruitshub/features/auth/data/models/user_model.dart';
import 'package:fruitshub/features/auth/domain/entites/user_entity.dart';
import 'package:fruitshub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {

  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({required this.firebaseAuthService, required this.databaseService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email, required String password, required String name
  }) async {

    User? user;
    
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(email: email, password: password);
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);

      await addUserData(user: userEntity);
      return right(userEntity);

    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in createUserWithEmailAndPassword: $e');
      return left(ServerFailure('لقد جرى خطأ ما, حاول مرة اخرى'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email, required String password
  }) async {
    
    try {

      var user = await firebaseAuthService.signInWithEmailAndPassword(email: email, password: password);
      var userEntity = await getUserData(uId: user.uid);

      return right(userEntity);

    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in signInWithEmailAndPassword: $e');
      return left(ServerFailure('لقد جرى خطأ ما, حاول مرة اخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    
    User? user;

    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      bool isUserExists = await databaseService.checkIfDataExists(
        path: BackendEndpoints.isUserExists,
        documentId: userEntity.uId
      );
      if (isUserExists){
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);

    } catch (e) {
      await deleteUser(user);
      log('Exception in signInWithGoogle: $e');
      return left(ServerFailure('لقد جرى خطأ ما, حاول مرة اخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    
    User? user;

    try {
      user = await firebaseAuthService.signInWithFacebook();

      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);

      return right(userEntity);

    } catch (e) {
      await deleteUser(user);
      log('Exception in signInWithFacebook: $e');
      return left(ServerFailure('لقد جرى خطأ ما, حاول مرة اخرى'));
    }
  }
  
  @override
  Future addUserData({required UserEntity user}) async{
     await databaseService.addData(path: BackendEndpoints.addUserData, data: user.toMap(), documnetId: user.uId);
  }
  
  @override
  Future<UserEntity> getUserData({required String uId}) async{
    var userData = await databaseService.getData(path: BackendEndpoints.getUserData, documentId: uId);
    return UserModel.fromJson(userData);
  }

  

}