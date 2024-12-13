import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildDropdownFieldWidget extends StatelessWidget {
  final String hint;
  final String label;
  final List items;
  final String? selectedValue;
  final Function(String?) onChanged;

  const BuildDropdownFieldWidget({
    required this.hint,
    required this.label,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: selectedValue,
          hint: Text(hint),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item.name,
              child: Text(item.name ?? "Unknown"),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
