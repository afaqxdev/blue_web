import 'package:blue_eye_web/Screens/Prices%20Screen/price_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../Core/Utils/button.dart';
import '../../Core/Utils/dropdwon.dart';
import '../../Core/Utils/textfield.dart';

class PricesScreenT extends StatefulWidget {
  const PricesScreenT({super.key});

  @override
  State<PricesScreenT> createState() => _PricesScreenTState();
}

class _PricesScreenTState extends State<PricesScreenT> {
  final nameController = TextEditingController();
  final pricePerVisitController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool visible = false;
  bool adjustVisible = false;
  final ScrollController _controllerOne = ScrollController();
  final ScrollController _controllerTwo = ScrollController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    width: 110,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Add Customer'),
                            content: SizedBox(
                              height: 170,
                              child: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    CustomTextField(
                                      label: 'Customer Name',
                                      controller: nameController,
                                    ),
                                    const SizedBox(height: 10),
                                    CustomTextField(
                                      label: 'Price per Visit',
                                      controller: pricePerVisitController,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    customerDataList.add(
                                      CustomerDataModel(
                                          name: nameController.text,
                                          pricePerVisit:
                                              pricePerVisitController.text,
                                          edit: false,
                                          delete: false),
                                    );
                                    setState(() {});
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text('Add'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    title: 'Add Customer',
                  ),
                  CustomButton(
                    width: 190,
                    title: 'Updated Adjusted Routes',
                    onTap: () {
                      setState(() {
                        visible = !visible;
                      });
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
                      scrollDirection: Axis.horizontal,
                      controller: _controllerOne,
                      child: Scrollbar(
                        controller: _controllerTwo,
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          controller: _controllerTwo,
                          child: DataTable(
                            columnSpacing: width <= 430 ? 50 : 260,
                            dataRowHeight: 50,
                            columns: const [
                              DataColumn(
                                  label: Text(
                                'id',
                              )),
                              DataColumn(
                                  label: Text(
                                'Customer',
                              )),
                              DataColumn(
                                  label: Text(
                                'Visit Price',
                                style: TextStyle(fontSize: 14),
                              )),
                              DataColumn(
                                  label: Text(
                                'Action',
                              )),
                            ],
                            rows: List.generate(
                              customerDataList.length,
                              (index) => DataRow(
                                cells: [
                                  DataCell(Text(index.toString())),
                                  DataCell(Text(customerDataList[index].name)),
                                  DataCell(
                                    Text(customerDataList[index]
                                        .pricePerVisit
                                        .toString()),
                                  ),
                                  DataCell(Text(index.toString())),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: CustomButton(
                  width: 130,
                  title: 'Adjust Price',
                  onTap: () {
                    setState(() {
                      adjustVisible = !adjustVisible;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              Visibility(
                visible: adjustVisible,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        dropdown(
                          items: items,
                          selectedValue: selectedValue,
                        ),
                        //  Container(color: Colors.green,height: 39,width: 100,)
                        SizedBox(
                          width: 80,
                          height: 35,
                          child: CustomTextField(
                            label: '%',
                            controller: nameController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
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
                                    scrollDirection: Axis.horizontal,
                                    controller: _controllerOne,
                                    child: Scrollbar(
                                        controller: _controllerTwo,
                                        thumbVisibility: true,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          controller: _controllerTwo,
                                          child: DataTable(
                                            columnSpacing:
                                                width <= 430 ? 50 : 260,
                                            border: TableBorder.symmetric(
                                              outside: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey.shade300),
                                            ),
                                            dataRowHeight: 50,
                                            columns: const [
                                              DataColumn(
                                                  label: Text(
                                                'id',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'Customer',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'Visit Price',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'Monthly Price/Visit',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ],
                                            rows: List.generate(
                                              customerDataList.length,
                                              (index) => DataRow(
                                                cells: [
                                                  DataCell(
                                                      Text(index.toString())),
                                                  DataCell(Text(
                                                      customerDataList[index]
                                                          .name)),
                                                  DataCell(
                                                    Text(customerDataList[index]
                                                        .pricePerVisit
                                                        .toString()),
                                                  ),
                                                  DataCell(
                                                      Text(index.toString())),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ))))))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                visible: visible,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Updated Adjusted Route',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: dropdown(
                        items: items,
                        selectedValue: selectedValue,
                      ),
                    ),
                    const SizedBox(height: 20),
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
                                    scrollDirection: Axis.horizontal,
                                    controller: _controllerOne,
                                    child: Scrollbar(
                                        controller: _controllerTwo,
                                        thumbVisibility: true,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          controller: _controllerTwo,
                                          child: DataTable(
                                              columnSpacing:
                                                  width <= 430 ? 50 : 260,
                                              dataRowHeight: 50,
                                              columns: const [
                                                DataColumn(
                                                    label: Text(
                                                  'id',
                                                )),
                                                DataColumn(
                                                    label: Text(
                                                  'Customer',
                                                )),
                                                DataColumn(
                                                    label: Text(
                                                  'Visit Price',
                                                )),
                                                DataColumn(
                                                    label: Text(
                                                  'Monthly Price/Visit',
                                                )),
                                              ],
                                              rows: [
                                                ...List<DataRow>.generate(
                                                  customerDataList.length,
                                                  (index) => DataRow(
                                                    cells: [
                                                      DataCell(Text(
                                                          index.toString())),
                                                      DataCell(Text(
                                                          customerDataList[
                                                                  index]
                                                              .name)),
                                                      DataCell(
                                                        Text(customerDataList[
                                                                index]
                                                            .pricePerVisit
                                                            .toString()),
                                                      ),
                                                      DataCell(Text(
                                                          index.toString())),
                                                    ],
                                                  ),
                                                ),
                                                const DataRow(cells: [
                                                  DataCell(Text(
                                                      'Totoal  Route Monthly Prices')),
                                                  DataCell(SizedBox.shrink()),
                                                  DataCell(SizedBox.shrink()),
                                                  DataCell(Text('2740'))
                                                ])
                                              ]),
                                        ))))))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
