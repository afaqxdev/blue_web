import 'package:flutter/material.dart';

import '../model.dart';

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: MediaQuery.of(context).size.width * (1 / .7),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                  width: 1,
                )),
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _controllerOne,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    controller: _controllerOne,
                    child: Scrollbar(
                      controller: _controllerTwo,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: _controllerTwo,
                        child: DataTable(
                          headingRowHeight: 100,
                          columnSpacing: 150,
                          checkboxHorizontalMargin: 10,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueGrey),
                            color: Colors.white,
                          ),
                          columns: const [
                            DataColumn(label: Text('name')),
                            DataColumn(label: Text('classes')),
                            DataColumn(label: Text('branches')),
                            DataColumn(label: Text('visitperWeek')),
                          ],
                          rows: companyResquest
                              .map(
                                (user) => DataRow(cells: [
                                  DataCell(Text(user.name)),
                                  DataCell(Text(user.classes)),
                                  DataCell(Text(user.branches)),
                                  DataCell(Text(user.visitperWeek)),
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

final ScrollController _controllerOne = ScrollController();
final ScrollController _controllerTwo = ScrollController();
