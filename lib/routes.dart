import 'package:flutter/material.dart';
import 'pages/detail_page.dart';
import 'pages/login_page.dart';

import 'pages/register_page.dart';
import 'pages/welcome_page.dart';
import 'pages/camera_page.dart';
import 'pages/home_page.dart';

class RouteGenerator {
  static const String welcomePage = '/';
  static const String homePage = '/home';
  static const String loginPage = "/login";
  static const String registerPage = "/register";
  static const String detailPage = "/detail";
  static const String previewPage = "/preview";

  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomePage:
        return MaterialPageRoute(
          builder: (_) => const WelcomePage(),
        );
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case registerPage:
        return MaterialPageRoute(
          builder: (_) => RegisterPage(),
        );
      case detailPage:
        return MaterialPageRoute(
          builder: (_) => const DetailPage(),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );

      default:
        throw FormatException("Rota não encontrada");
    }
  }
}
