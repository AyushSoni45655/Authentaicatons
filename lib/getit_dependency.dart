import 'package:authentication/auth/feature/data/data_source/user_datasource.dart';
import 'package:authentication/auth/feature/data/repository_implementation/user_repository_implementation.dart';
import 'package:authentication/auth/feature/domain/repository/user_repository.dart';
import 'package:authentication/auth/feature/domain/usecase/forgotpassword_usecase.dart';
import 'package:authentication/auth/feature/domain/usecase/getuser_usecase.dart';
import 'package:authentication/auth/feature/domain/usecase/loggedin_usecase.dart';
import 'package:authentication/auth/feature/domain/usecase/logout_usecase.dart';
import 'package:authentication/auth/feature/domain/usecase/signin_usecase.dart';
import 'package:authentication/auth/feature/domain/usecase/signup_usecase.dart';
import 'package:authentication/auth/feature/presentation/blocs/checkbox/check_bloc.dart';
import 'package:authentication/auth/feature/presentation/blocs/user/user_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/feature/presentation/blocs/toggle_password/toggle_bloc.dart';

final sl = GetIt.instance;
Future<void> setUpLocator() async {
  // for authentication dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<SharedPreferences>(() =>sharedPreferences ,);

  sl.registerFactory(() => ToggleBloc());
  sl.registerFactory(() => CheckBloc());

  // user bloc start dependency
  sl.registerLazySingleton<UserDataSource>(
    () => userDataSourceImplementation(firestore: sl(), auth: sl(), sh: sl()),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImplementation(userDataSource: sl()),
  );
  sl.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(userRepository: sl()),
  );
  sl.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(userRepository: sl()),
  );
  sl.registerLazySingleton<LogOutUseCase>(
    () => LogOutUseCase(userRepository: sl()),
  );
  sl.registerLazySingleton<LoggedInUseCase>(
    () => LoggedInUseCase(userRepository: sl()),
  );
  sl.registerLazySingleton<GetUserUseCase>(() =>GetUserUseCase(userRepository: sl()),);
  sl.registerLazySingleton<ForgotPasswordUseCase>(
    () => ForgotPasswordUseCase(userRepository: sl()),
  );
  sl.registerFactory(
    () => UserBloc(
      getUserUseCase: sl(),
      loggedInUseCase: sl(),
      signInUseCase: sl(),
      forgotPasswordUseCase: sl(),
      logOutUseCase: sl(),
      signUpUseCase: sl(),
    ),
  );
}
