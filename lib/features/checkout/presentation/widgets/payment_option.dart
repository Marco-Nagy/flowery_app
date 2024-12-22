import 'package:flowery_e_commerce/features/checkout/presentation/viewModel/checkout_base_action.dart';
import 'package:flowery_e_commerce/features/checkout/presentation/viewModel/checkout_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentOption extends StatelessWidget {
  final String title;
  final String selectedValue;
  final Function onSelected;

  const PaymentOption({
    super.key,
    required this.title,
    required this.selectedValue,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    CheckoutViewModelCubit viewModelCubit =
    context.read<CheckoutViewModelCubit>();
    return BlocBuilder<CheckoutViewModelCubit, CheckoutViewModelState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => viewModelCubit.doAction(SelectPaymentOptionAction(selectedValue)),
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
                  viewModelCubit.paymentOption==selectedValue
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: Colors.pink,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


