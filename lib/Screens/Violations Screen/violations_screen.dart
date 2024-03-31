import 'package:blue_eye_web/Core/constants/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Core/Provider/violationProvider.dart';
import '../../Core/Utils/button.dart';

class ViolationsScreen extends StatefulWidget {
  const ViolationsScreen({super.key});

  @override
  State<ViolationsScreen> createState() => _ViolationsScreenState();
}

class _ViolationsScreenState extends State<ViolationsScreen> {
  final ScrollController _controllerOne = ScrollController();
  final ScrollController _controllerTwo = ScrollController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<ViolationProvider>(context, listen: false);
    return Scaffold(
        body: Center(
      child: Padding(
        padding: EdgeInsets.only(
            left: width <= 430 ? 30 : 100, right: width <= 430 ? 30 : 100),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<ViolationProvider>(
                  builder: (context, value, child) {
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onHover: (PointerHoverEvent event) {
                        value.updateviolaton(true);
                      },
                      onExit: (PointerExitEvent event) {
                        value.updateviolaton(false);
                      },
                      child: CustomButton(
                        textcolor: value.volition ? black : white,
                        colors: value.volition ? white : Color(0Xff036161),
                        onTap: () {},
                        title: "Add Violation",
                        width: 100,
                      ),
                    );
                  },
                ),
                Consumer<ViolationProvider>(
                  builder: (context, value, child) {
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onHover: (PointerHoverEvent event) {
                        value.updatepalanty(true);
                      },
                      onExit: (PointerExitEvent event) {
                        value.updatepalanty(false);
                      },
                      child: CustomButton(
                        textcolor: value.palaty ? black : white,
                        colors: value.palaty ? white : Color(0Xff036161),
                        onTap: () {},
                        title: "Add Penality",
                        width: 100,
                      ),
                    );
                  },
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: 500,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                  width: 1,
                )),
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _controllerOne,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: _controllerOne,
                    child: Scrollbar(
                      controller: _controllerTwo,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: _controllerTwo,
                        child: DataTable(
                          checkboxHorizontalMargin: 10,
                          columnSpacing: width <= 430 ? 30 : 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueGrey),
                            color: Colors.white,
                          ),
                          columns: const [
                            DataColumn(label: Text('Id')),
                            DataColumn(label: Text('Violation')),
                            DataColumn(label: Text('Violation price')),
                            DataColumn(label: Text('Action')),
                            // DataColumn(label: Text('Mobile Number')),
                            // DataColumn(label: Text('Country')),
                            // DataColumn(label: Text('City')),
                            // DataColumn(label: Text('Status')),
                            // DataColumn(label: Text('Action')),
                          ],
                          rows: provider.users
                              .map(
                                (user) => DataRow(cells: [
                                  DataCell(Text(user.id)),
                                  DataCell(Text(user.violation)),
                                  DataCell(Text(user.violationprice)),
                                  DataCell(Row(
                                    children: [
                                      Consumer<ViolationProvider>(
                                          builder: (context, value, child) {
                                        return MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          onHover: (PointerHoverEvent event) {
                                            value.updateEdit(user, true);
                                          },
                                          onExit: (PointerExitEvent event) {
                                            value.updateEdit(user, false);
                                          },
                                          child: Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0Xff036161),
                                                  width: 1),
                                              color: user.edit
                                                  ? Colors.white
                                                  : Color(0Xff036161),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.edit,
                                                color: user.edit
                                                    ? Color(0Xff036161)
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Consumer<ViolationProvider>(
                                          builder: (context, value, child) {
                                        return MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          onHover: (PointerHoverEvent event) {
                                            value.updateDelete(user, true);
                                          },
                                          onExit: (PointerExitEvent event) {
                                            value.updateDelete(user, false);
                                          },
                                          child: Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.red, width: 1),
                                              color: user.delete
                                                  ? Colors.white
                                                  : Colors.red,
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.delete,
                                                color: user.delete
                                                    ? Colors.red
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                        );
                                      })
                                    ],
                                  )),
                                ]),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
