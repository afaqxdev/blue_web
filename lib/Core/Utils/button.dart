import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.colors,
      this.textcolor,
      required this.width});

  String title;
  VoidCallback onTap;
  double width;
  Color? colors;
  Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        width: width,
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            border: Border.all(color: Color(0Xff036161), width: 1),
            color: colors ?? Color(0Xff036161),
            borderRadius: BorderRadius.circular(7)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textcolor ?? Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
