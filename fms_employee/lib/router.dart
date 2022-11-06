
import 'package:flutter/material.dart';
import 'package:fms_employee/screens/login_screen.dart';
import 'package:fms_employee/screens/staff_home_page.dart';
import 'package:fms_employee/widgets/bottom_bar.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );
    case StaffHomePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const StaffHomePage(),
      );
    case NavScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NavScreen(),
      );
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Trang không tồn tại'),
            ),
          ));
  }
}
