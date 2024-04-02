import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'chartPie.dart';
import 'linechart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController _dateTimeRangeController = TextEditingController(
    text: 'yyyy-MM-dd ~ yyyy-MM-dd',
  );

  FocusNode _dateTimeRangeFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Welcome, Admin',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: const Icon(
                Icons.person,
                size: 20,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Card(
            child: GestureDetector(
              onTap: () async {
                _dateTimeRangeFocusNode.unfocus();

                final dateRange = await showDialog(
                  context: context,
                  builder: (context) => SfDateRangePicker(
                    view: DateRangePickerView.month,
                    selectionMode: DateRangePickerSelectionMode.range,
                    initialSelectedRange: PickerDateRange(
                      DateTime.now().subtract(Duration(days: 7)),
                      DateTime.now(),
                    ),
                  ),
                );

                if (dateRange != null) {
                  final start =
                      DateFormat('yyyy-MM-dd').format(dateRange.startDate!);
                  final end =
                      DateFormat('yyyy-MM-dd').format(dateRange.endDate!);
                  final startDateTime = await showDateTimePicker(start);
                  final endDateTime = await showDateTimePicker(end);
                  if (startDateTime != null && endDateTime != null) {
                    final formattedStartDateTime =
                        DateFormat('yyyy-MM-dd hh:mm a').format(startDateTime);
                    final formattedEndDateTime =
                        DateFormat('yyyy-MM-dd hh:mm a').format(endDateTime);
                    setState(() {
                      _dateTimeRangeController.text =
                          '$formattedStartDateTime ~ $formattedEndDateTime';
                    });
                  }
                }
              },
              child: TextField(
                controller: _dateTimeRangeController,
                focusNode: _dateTimeRangeFocusNode,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Date-Time Range',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
            ),
          ),
          SizedBox(width: 500, height: 400, child: PieChartSample2()),
          SizedBox(width: 500, height: 400, child: LineChartSample2()),
        ]),
      ),
    );
  }

  Future<DateTime?> showDateTimePicker(String initialDateString) async {
    final initialDate = DateFormat('yyyy-MM-dd').parse(initialDateString);
    final initialTime = TimeOfDay.fromDateTime(initialDate);
    return await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    ).then((date) {
      if (date != null) {
        return showTimePicker(
          context: context,
          initialTime: initialTime,
        ).then((time) {
          if (time != null) {
            return DateTime(
              date.year,
              date.month,
              date.day,
              time.hour,
              time.minute,
            );
          }
          return null;
        });
      }
      return null;
    });
  }
}
