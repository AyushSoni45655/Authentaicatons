
import 'package:authentication/auth/feature/domain/entity/user.dart';
import 'package:authentication/auth/feature/domain/usecase/forgotpassword_usecase.dart';
import 'package:authentication/auth/feature/domain/usecase/getuser_usecase.dart';
import 'package:authentication/auth/feature/domain/usecase/loggedin_usecase.dart';
import 'package:authentication/auth/feature/domain/usecase/logout_usecase.dart';
import 'package:authentication/auth/feature/domain/usecase/signin_usecase.dart';
import 'package:authentication/auth/feature/domain/usecase/signup_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUseCase getUserUseCase;
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final LogOutUseCase logOutUseCase;
  final LoggedInUseCase loggedInUseCase;
  UserBloc({
    required this.getUserUseCase,
    required this.loggedInUseCase,
    required this.signInUseCase,
    required this.forgotPasswordUseCase,
    required this.logOutUseCase,
    required this.signUpUseCase,
  }) : super(UserInitial()) {
    // Sign Up Bloc
    on<UserSignUpEvent>((event, emit) async {
      emit(UserLoading());
      final data = await signUpUseCase.call(event.userEntity);
      data.fold(
        (l) => emit(UserError(error: l.toString())),
        (r) => emit(UserSuccess(userEntity: r)),
      );
    });
    // SignIn Bloc

    on<UserSignInEvent>((event, emit) async {
      emit(UserLoading());
      final data = await signInUseCase.call(event.email, event.password);
      data.fold((l) => emit(UserError(error: l.toString())), (r) {
        emit(UserSuccess(userEntity: r));
      });
    });
    // forgot password bloc

    on<UserForgotPasswordEvent>((event, emit) async {
      emit(UserLoading());
      final data = await forgotPasswordUseCase.call(event.email);
      data.fold(
        (l) => emit(UserError(error: l.toString())),
        (_) => emit(UserLogOut()),
      );
    });
    // is user logged in

    on<UserIsLoggedInEvent>((event, emit) async {
      emit(UserLoading());
      final data = await loggedInUseCase.call();
      data.fold(
        (l) => emit(UserLogOut()),
        (r) => r ? emit(UserLoggedIn()) : emit(UserLogOut()),
      );
    });

    // log out bloc
    on<UserLogOutEvent>((event, emit) async {
      emit(UserLoading());
      final data = await logOutUseCase.call();
      data.fold(
        (l) => emit(UserError(error: l.toString())),
        (r) => emit(UserLogOut()),
      );
    });

    //user get event

    on<UserGetEvent>((event, emit) async {
      //emit(UserLoading());
      final data = await getUserUseCase.call();
      data.fold(
        (l) => emit(UserError(error: l.toString())),
        (r) => emit(UserFetchUserData(userEntity: r)),
      );
    });
  }
}
