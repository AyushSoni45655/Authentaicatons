import 'package:authentication/auth/feature/presentation/blocs/checkbox/check_bloc.dart';
import 'package:authentication/auth/feature/presentation/blocs/toggle_password/toggle_bloc.dart';
import 'package:authentication/auth/feature/presentation/blocs/user/user_bloc.dart';
import 'package:authentication/core/constant/firebase_option.dart';
import 'package:authentication/core/constant/routes.dart';
import 'package:authentication/getit_dependency.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'core/theme/theme.dart';

void main()async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  await Firebase.initializeApp(
    options: optionss
  );
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => GetIt.I<ToggleBloc>(),),
    BlocProvider(create: (context) => GetIt.I<CheckBloc>(),),
    BlocProvider(create: (context) => GetIt.I<UserBloc>()..add(UserGetEvent()),)
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return  MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          darkTheme: AAppTheme.darkTheme,
          theme: AAppTheme.lightTheme,
          themeMode: ThemeMode.system,
          routerConfig: appRoutes,
        );
      },
    );
  }
}
