import 'package:blue_eye_web/Screens/CompanyRequests%20Screen/PC/pc_companyRequest.dart';
import 'package:blue_eye_web/Screens/CompanyRequests%20Screen/Tab/tab_companyRequest.dart';
import 'package:flutter/material.dart';

import '../../Core/Utils/responsive.dart';
import 'Mobile/mobile_companyRequest.dart';
import 'model.dart';

class CompanyRequestsScreen extends StatefulWidget {
  const CompanyRequestsScreen({super.key});

  @override
  State<CompanyRequestsScreen> createState() => _CompanyRequestsScreenState();
}

class _CompanyRequestsScreenState extends State<CompanyRequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
        desktop: PcView(), tablet: TabView(), mobile: MobileView());
  }
}
