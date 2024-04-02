import 'package:flutter/material.dart';

import 'model.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                  width: 1,
                )),
                width: MediaQuery.of(context).size.width * (1 / .7),
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
                          columnSpacing: width <= 450 ? 50 : 120,
                          checkboxHorizontalMargin: 10,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueGrey),
                            color: Colors.white,
                          ),
                          columns: const [
                            DataColumn(label: Text('routesname')),
                            DataColumn(label: Text('id')),
                            DataColumn(label: Text('totalVist')),
                            DataColumn(label: Text('amount')),
                            DataColumn(label: Text('deduction')),
                            DataColumn(label: Text('next')),
                            DataColumn(label: Text('transfer')),
                          ],
                          rows: paymentModel
                              .map(
                                (user) => DataRow(cells: [
                                  DataCell(Text(user.routesname)),
                                  DataCell(Text(user.id)),
                                  DataCell(Text(user.totalVist)),
                                  DataCell(Text(user.amount)),
                                  DataCell(Text(user.deduction)),
                                  DataCell(Text(user.next)),
                                  DataCell(Text(user.transfer)),
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
