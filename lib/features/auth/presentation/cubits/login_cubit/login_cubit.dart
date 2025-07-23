import 'package:bloc/bloc.dart';
import 'package:fruitshub/features/auth/domain/entites/user_entity.dart';
import 'package:fruitshub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;

  Future<void> logInUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    
    var result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity)),
    );
  }

  Future<void> logInWithGoogle() async {
    emit(LoginLoading());

    var result = await authRepo.signInWithGoogle();

    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity)),
    );
  }

  Future<void> logInWithFacebook() async {
    emit(LoginLoading());

    var result = await authRepo.signInWithFacebook();

    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity)),
    );
  }

}
