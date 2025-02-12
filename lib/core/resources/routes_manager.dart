import 'package:flutter/material.dart';
import 'package:super_fitness/features/auth/presentation/pages/email_verification_view.dart';
import 'package:super_fitness/features/auth/presentation/pages/forget_password.dart';
import 'package:super_fitness/features/auth/presentation/pages/reset_password_view.dart';

import '../../onBoarding/presentation/screens/on_boarding.dart';

class RoutesManager {
  static const String onBoarding = '/';
  static const String registerView = '/RegisterView';
  static const String forgetPasswordView = '/ForgetPasswordView';
  static const String verifyPasswordView = '/VerifyPasswordView';
  static const String resetPasswordView = '/ResetPasswordView';
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
