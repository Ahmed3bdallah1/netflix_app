import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/view/widgets/navigation_bar.dart';

class Routes {
  static const String home = "home_page";
  static const String otp = "otp";
  static const String login = "login";
  static const String onboard = "onboard";

  static Route<dynamic> onGenerated(RouteSettings settings) {
    switch (settings.name) {
      // case onboard:
      //   return MaterialPageRoute(builder: (_) => const OnBoard());
      //
      // case login:
      //   return MaterialPageRoute(builder: (_) => const LoginPage());
      //
      // case otp:
      //   final Map args = settings.arguments as Map;
      //   return MaterialPageRoute(
      //       builder: (_) => OtpPage(
      //         phone: args['phone'],
      //         smsCodeId: args['smsCodeId'],
      //       ));
      //
      case home:
        return MaterialPageRoute(builder: (_) => const HomeNavBar());
      //

      default:
        return MaterialPageRoute(builder: (_) => const HomeNavBar());
    }
  }
}