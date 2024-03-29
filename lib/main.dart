import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

import 'Core/Provider/modelProvider.dart';
import 'Core/Provider/violationProvider.dart';
import 'Core/Screens Routings/screens_routings.dart';
import 'Core/constants/colors.dart';
import 'Core/Side Bar/side_bar.dart';
import 'Screens/Reg & Status Screen/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserTableModel()),
        ChangeNotifierProvider(create: (context) => ViolationProvider()),
      ],
      child: GetMaterialApp(
        title: 'Blue Eye',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: white,
            textTheme: const TextTheme(
              headlineSmall: TextStyle(
                color: Colors.black,
                fontSize: 46,
                fontWeight: FontWeight.w800,
              ),
            ),
            appBarTheme: AppBarTheme(
              color: mainColor.withOpacity(0.6),
            )),
        home: Builder(
          builder: (context) {
            final isSmallScreen = MediaQuery.of(context).size.width < 600;
            return Scaffold(
              key: _key,
              appBar: isSmallScreen
                  ? AppBar(
                      backgroundColor: white,
                      title: Text(
                        _getTitleByIndex(_controller.selectedIndex),
                        style: const TextStyle(
                          color: black,
                        ),
                      ),
                      leading: IconButton(
                        onPressed: () {
                          _key.currentState?.openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: black,
                        ),
                      ),
                    )
                  : null,
              drawer: SideBar(controller: _controller),
              body: Row(
                children: [
                  if (!isSmallScreen) SideBar(controller: _controller),
                  Expanded(
                    child: Center(
                      child: ScreensRouting(
                        controller: _controller,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  String _getTitleByIndex(int index) {
    switch (index) {
      case 0:
        return 'Dashboard';
      case 1:
        return 'Reg/Status';
      case 2:
        return 'Routes';
      case 3:
        return 'Prices';
      case 4:
        return 'Violations';
      case 5:
        return 'Payments';
      case 6:
        return 'Company Requests';
      default:
        return 'Not found page';
    }
  }
}
