import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/check_out/payment_option.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/check_out/section_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({super.key});

  @override
  _PaymentWidgetState createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  String _selectedValue = 'Credit card';

  void _onPaymentOptionSelected(String value) {
    setState(() {
      _selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 32),
        const SectionTitle(title: 'Payment method'),
        verticalSpacing(16),

        PaymentOption(
          title: 'Credit card',
          selectedValue: _selectedValue,
          onSelected: _onPaymentOptionSelected,
        ),
        const SizedBox(height: 8),
        PaymentOption(
          title: 'Cash on delivery',
          selectedValue: _selectedValue,
          onSelected: _onPaymentOptionSelected,
        ),
      ],
    );
  }
}