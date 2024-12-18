import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/features/checkout/presentation/widgets/payment_option.dart';
import 'package:flowery_e_commerce/features/checkout/presentation/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        const Divider(height: 60,thickness: 24,color: MyColors.white60,),
         SectionTitle(title: AppLocalizations.of(context)!.payment_method),
        verticalSpacing(16),

        PaymentOption(
          title: AppLocalizations.of(context)!.credit_card,
          selectedValue: _selectedValue,
          onSelected: _onPaymentOptionSelected,
        ),
        const SizedBox(height: 8),
        PaymentOption(
          title: AppLocalizations.of(context)!.cash_on_delivery,
          selectedValue: _selectedValue,
          onSelected: _onPaymentOptionSelected,
        ),
      ],
    );
  }
}