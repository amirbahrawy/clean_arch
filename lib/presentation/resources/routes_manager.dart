import 'package:clean_architecture/presentation/modules/forgot_password/forgot_password_screen.dart';
import 'package:clean_architecture/presentation/modules/home/home_screen.dart';
import 'package:clean_architecture/presentation/modules/login/view/login_view.dart';
import 'package:clean_architecture/presentation/modules/onboarding/view/onboarding_view.dart';
import 'package:clean_architecture/presentation/modules/register/register_screen.dart';
import 'package:clean_architecture/presentation/modules/splash/splash_view.dart';
import 'package:clean_architecture/presentation/modules/store_details/store_details_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String onBoardingRoute = '/onBoarding';
  static const String homeRoute = '/home';
  static const String storeDetailsRoute = '/storeDetails';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsScreen());
      default: return MaterialPageRoute(builder: (_) => const HomeScreen());

    }
  }
}
