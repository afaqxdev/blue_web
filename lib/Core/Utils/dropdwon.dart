import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'hover.dart';

List<String> items = [
  'C102B2O1',
  'CW203J2K',
  'SK2KAI2L',
  'FOW20L22',
];

String? selectedValue;

///invoked

///Custom Code Full Class

class dropdown extends StatefulWidget {
  dropdown({
    super.key,
    required this.items,
    required this.selectedValue,
  });

  final List<String> items;
  String? selectedValue;

  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  // String? selectedValue;

  int? hoveredValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: const [
            Expanded(
              child: Text(
                'Select Item',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: List<DropdownMenuItem>.generate(
          widget.items.length,
          (index) {
            return DropdownMenuItem<String>(
              value: widget.items[index],
              child: MouseRegion(
                // cursor: SystemMouseCursors.click,
                onHover: (_) {
                  setState(() {
                    hoveredValue = index;
                  });
                },
                onExit: (_) {
                  setState(() {
                    hoveredValue = -1;
                  });
                },
                child: Row(
                  children: [
                    if (widget.selectedValue == widget.items[index])
                      const Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 18,
                      ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      // child: SizedBox(),
                      child: OnHover(
                        builder: ((isHovered) {
                          return Text(
                            widget.items[index],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: hoveredValue == index
                                  ? Colors.green
                                  : Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        value: widget.selectedValue,
        onChanged: (value) {
          setState(() {
            widget.selectedValue = value as String?;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 40,
          width: 160,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,
              width: 0.8,
            ),
            color: Colors.white,
          ),
          overlayColor: MaterialStateProperty.all<Color>(Colors.green),
          elevation: 2,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 25,
          ),
          iconEnabledColor: Colors.grey,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 200,
          padding: null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          elevation: 8,
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
          // overlayColor: MaterialStateProperty.all<Color>(Colors.green)
        ),
      ),
    );
  }
}
