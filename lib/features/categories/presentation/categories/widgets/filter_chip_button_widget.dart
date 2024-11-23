import 'package:flowery_e_commerce/features/categories/presentation/categories/widgets/filter_chip_button.dart';
import 'package:flutter/material.dart';

class FilterChipButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const FilterChipButtonWidget({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 12,
        left: MediaQuery.of(context).size.width * 0.3,
        child: FilterChipButton(onPressed: onPressed));
  }
}
