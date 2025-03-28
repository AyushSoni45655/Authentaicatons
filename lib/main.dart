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
import 'package:shared_preferences/shared_preferences.dart';
import 'core/theme/theme.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sh = await SharedPreferences.getInstance();
  bool isFirst =  sh.getBool("isFirstTime")??true;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  setUpLocator();
  await Firebase.initializeApp(
    options: optionss
  );
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => GetIt.I<ToggleBloc>(),),
    BlocProvider(create: (context) => GetIt.I<CheckBloc>(),),
    BlocProvider(create: (context) => GetIt.I<UserBloc>()..add(UserGetEvent()),)
  ], child: MyApp(isFirst: isFirst,)));
}

class MyApp extends StatelessWidget {
  final bool isFirst;
  const MyApp({super.key, required this.isFirst});
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
          routerConfig: goRouter(isFirst: isFirst),
        );
      },
    );
  }
}
