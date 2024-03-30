import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.inputFormatters,
    this.keyboardType,
  });
  final String label;
  final TextEditingController controller;
  // String? Function(String?)? validator;

  List<TextInputFormatter>? inputFormatters;
  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    Color themeColor = Theme.of(context).colorScheme.secondary;
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty || value.isEmpty) {
          return 'Enter the Data';
        }
      },
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(color: themeColor),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: themeColor,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: themeColor,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: themeColor,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
