import 'package:flutter/material.dart';
import 'package:super_fitness/features/profile/presentation/pages/profile_tab.dart';
import 'package:super_fitness/features/gemini/presentation/views/chat_view.dart';
import 'package:super_fitness/features/gemini/presentation/views/welcome_page_chat_gemini.dart';
import '../../features/auth/presentation/pages/email_verification_view.dart';
import '../../features/auth/presentation/pages/forget_password.dart';
import '../../features/auth/presentation/pages/reset_password_view.dart';
import '../../features/auth/presentation/pages/login_view.dart';
import '../../features/auth/presentation/pages/register_view.dart';
import '../../features/edit_profile/presentation/pages/edite_profile_view.dart';
import '../../features/layout/presentation/pages/layout_view.dart';

import '../../features/profile/presentation/pages/help_screen.dart';
import '../../features/profile/presentation/pages/privacy_screen.dart';
import '../../features/profile/presentation/pages/security_screen.dart';
import '../../onBoarding/presentation/screens/on_boarding.dart';

class RoutesManager {
  static const String onBoarding = '/';
  static const String registerView = '/RegisterView';
  static const String forgetPasswordView = '/ForgetPasswordView';
  static const String verifyPasswordView = '/VerifyPasswordView';
  static const String resetPasswordView = '/ResetPasswordView';
  static const String loginView = '/LoginView';
  static const String layOutView = '/layOut';
  static const String editeProfileView = '/editeProfileView';
  static const String profileView = '/profileTab';
  static const String securityView = '/securityScreen';
  static const String privacyView = '/privacyScreen';
  static const String helpView = '/helpScreen';

  static const String geminiWelcomePage = '/geminiWelcomePage';
  static const String geminiChatPage = '/geminiChatPage';
  static const String chatHistoryScreen = '/chatHistoryScreen';
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
      case RoutesManager.editeProfileView:
        return MaterialPageRoute(builder: (_) => const EditeProfileView());
      case RoutesManager.profileView:
        return MaterialPageRoute(builder: (_) => const ProfileTab());
      case RoutesManager.securityView:
        return MaterialPageRoute(builder: (_) => const SecurityScreen());
      case RoutesManager.privacyView:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen());
      case RoutesManager.helpView:
        return MaterialPageRoute(builder: (_) => const HelpScreen());

      case RoutesManager.geminiWelcomePage:
        return MaterialPageRoute(builder: (_) => const WelcomePageChatGemini());
      case RoutesManager.geminiChatPage:
        return MaterialPageRoute(builder: (_) => const ChatView());
      // case RoutesManager.chatHistoryScreen:
      //   return MaterialPageRoute(builder: (_) => const ChatHistoryScreen());
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
