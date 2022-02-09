import 'package:bazar_updated/view/buyer/buyer_dashboard/buyer_dashboard.dart';
import 'package:bazar_updated/view/common_screen/login/login_screen.dart';
import 'package:bazar_updated/view/common_screen/option_screen.dart';
import 'package:bazar_updated/view/common_screen/splash_screen.dart';
import 'package:bazar_updated/view/utilz/route_name.dart';
import 'package:flutter/material.dart';

class Routers {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.option:
        return MaterialPageRoute(builder: (_) => const OptionScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

        //buyer dashboard screen
      case RouteName.buyerDashboard:
        return MaterialPageRoute(builder: (_) => const BuyerDashboardScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}