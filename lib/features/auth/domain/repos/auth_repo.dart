import 'package:dartz/dartz.dart';
import 'package:fruitshub/core/errors/failures.dart';
import 'package:fruitshub/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    {required String email, required String password, required String name}
  );


}