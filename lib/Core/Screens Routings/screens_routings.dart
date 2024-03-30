import 'package:blue_eye_web/Screens/Prices%20Screen/priceScreen.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../Screens/CompanyRequests Screen/company_requests_screen.dart';
import '../../Screens/Dashboard Screen/dashboard_screen.dart';
import '../../Screens/Payments Screen/payments_screen.dart';
import '../../Screens/Reg & Status Screen/reg_status_screen.dart';
import '../../Screens/Routes Screen/routes_Screen.dart';
import '../../Screens/Violations Screen/violations_screen.dart';

class ScreensRouting extends StatelessWidget {
  const ScreensRouting({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        switch (controller.selectedIndex) {
          case 0:
            return const DashboardScreen();
          case 1:
            return const RegStatusScreen();
          case 2:
            return const RoutesScreen();
          case 3:
            return const PricesScreenT();
          case 4:
            return const ViolationsScreen();
          case 5:
            return const PaymentsScreen();
          case 6:
            return const CompanyRequestsScreen();
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
