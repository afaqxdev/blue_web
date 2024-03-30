import 'package:blue_eye_web/Core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonDialog {
  String? name;
  String? message;
  showErrorDialog({
    required String name,
    message,
  }) {
    Get.dialog(AlertDialog(
      backgroundColor: white,
      title: Column(
        children: [
          Align(alignment: Alignment.topLeft, child: Text(name)),
        ],
      ),
      actions: <Widget>[
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: 57,
            height: 39,
            child: Text("No"),
          ),
        ),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: 57,
            height: 39,
            child: Text("No"),
          ),
        ),
      ],
    ));
  }
}
