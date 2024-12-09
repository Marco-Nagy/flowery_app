import 'package:flutter/material.dart';

class PaymentOption extends StatelessWidget {
  final String title;
  final String selectedValue;
  final Function(String) onSelected;

  const PaymentOption({
    super.key,
    required this.title,
    required this.selectedValue,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedValue == title;

    return GestureDetector(
      onTap: () => onSelected(title),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
}


