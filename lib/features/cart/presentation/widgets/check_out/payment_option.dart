import 'package:flutter/material.dart';

class PaymentOption extends StatelessWidget {
  final String title;
  final bool isSelected;

  const PaymentOption({super.key, required this.title, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: true,
          groupValue: isSelected,
          onChanged: (value) {},
          activeColor: Colors.pink,
        ),
        Text(title),
      ],
    );
  }
}
