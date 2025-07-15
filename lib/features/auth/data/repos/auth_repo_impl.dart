import 'package:dartz/dartz.dart';
import 'package:fruitshub/core/errors/exceptions.dart';
import 'package:fruitshub/core/errors/failures.dart';
import 'package:fruitshub/core/services/firebase_auth_service.dart';
import 'package:fruitshub/features/auth/data/models/user_model.dart';
import 'package:fruitshub/features/auth/domain/entites/user_entity.dart';
import 'package:fruitshub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {

  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email, required String password, required String name
  }) async {
    
    try {

      var user = await firebaseAuthService.createUserWithEmailAndPassword(email: email, password: password);
    
      return right(UserModel.fromFirebaseUser(user));

    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure('An error occurred. Please try again later.'));
    }
  }

}