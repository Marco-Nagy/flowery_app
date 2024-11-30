import 'package:flowery_e_commerce/features/generic/presentation/widgets/filter_chip_button.dart';
import 'package:flutter/material.dart';

class FilterChipButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const FilterChipButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 12,
        left: MediaQuery.of(context).size.width * 0.3,
        child: FilterChipButton(onPressed: onPressed));
  }
}
