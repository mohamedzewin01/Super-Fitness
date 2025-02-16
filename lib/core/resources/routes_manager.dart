import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/email_verification_view.dart';
import '../../features/auth/presentation/pages/forget_password.dart';
import '../../features/auth/presentation/pages/reset_password_view.dart';

import '../../features/auth/presentation/pages/login_view.dart';
import '../../features/auth/presentation/pages/register_view.dart';
import '../../features/layout/presentation/pages/layout_view.dart';

import '../../onBoarding/presentation/screens/on_boarding.dart';

class RoutesManager {
  static const String onBoarding = '/';
  static const String registerView = '/RegisterView';
  static const String forgetPasswordView = '/ForgetPasswordView';
  static const String verifyPasswordView = '/VerifyPasswordView';
  static const String resetPasswordView = '/ResetPasswordView';
  static const String loginView = '/LoginView';
  static const String layOutView = '/layOut';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case RoutesManager.forgetPasswordView:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case RoutesManager.verifyPasswordView:
        return MaterialPageRoute(builder: (_) => const OtpVerificationPage());
      case RoutesManager.resetPasswordView:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());

      case RoutesManager.registerView:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case RoutesManager.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RoutesManager.layOutView:
        return MaterialPageRoute(builder: (_) => const LayoutView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("No Route Found"),
              ),
              body: const Center(child: Text("No Route Found")),
            ));
  }
}
