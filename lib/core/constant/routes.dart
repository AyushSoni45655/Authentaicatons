import 'package:authentication/auth/feature/presentation/screens/forgot_password.dart';
import 'package:authentication/auth/feature/presentation/screens/home_page.dart';
import 'package:authentication/auth/feature/presentation/screens/signin.dart';
import 'package:authentication/auth/feature/presentation/screens/signup.dart';
import 'package:authentication/auth/feature/presentation/screens/splash.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRoutes = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: 'splash',
    builder: (context, state) => SplashScreen(),
  ),
  //
  GoRoute(
    path: "/signin",
    name: "login",
    builder: (context, state) => SignInScreen(),
  ),
  GoRoute(
    path: "/fPassword",
    name: "fPassword",
    builder: (context, state) => ForgotPasswordScreen(),
  ),
  GoRoute(
    path: "/signup",
    name: "signin",
  builder: (context, state) => SignupScreen(),
  ),
  // GoRoute(
  //   path: "/bottom",
  //   name: "bottom",
  //   builder: (context, state) => BottomNavScreen(),
  // ),
  // GoRoute(
  //   path: "/chat",
  //   name: "navPage",
  //   builder: (context, state) => ChatPage(),
  // ),
  GoRoute(
    path: "/home",
    name: "homescreen",
    builder: (context, state) => HomePage(),
  ),
  // GoRoute(
  //   path: "/graph",
  //   name: "graphScreen",
  //   builder: (context, state) => GrapHScreen(),
  // ),
  // GoRoute(
  //   path: "/cWallet",
  //   name: "connectWallet",
  //   builder: (context, state) => ConnectWalletScreen(),
  // ),
  // GoRoute(
  //   path: "/login",
  //   name: "loginPage",
  //   builder: (context, state) => LoginScreen(),
  // ),
  // GoRoute(
  //   path: "/fp",
  //   name: "fPassword",
  //   builder: (context, state) =>ForgotPasswordScreen(),
  // ),
  // GoRoute(
  //   path: "/details",
  //   name: "dtailsPage",
  //   builder: (context, state){
  //     final foodItem = state.extra as CategoryData;
  //     return DetailsScreen(categoryData: foodItem,);
  //   },
  // )
 ]);
