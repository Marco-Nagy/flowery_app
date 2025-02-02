import 'package:another_stepper/another_stepper.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flutter/material.dart';

class StepperIndicator extends StatefulWidget {
  final int currentStep; // Current active step
// Total number of steps

  const StepperIndicator({
    super.key,
    required this.currentStep ,
  });

  @override
  State<StepperIndicator> createState() => _StepperIndicatorState();
}

class _StepperIndicatorState extends State<StepperIndicator> {
  @override
  Widget build(BuildContext context) {
    return AnotherStepper(
      stepperList: [
        StepperData(
            title: StepperText(
              "Order Placed",
              textStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
            subtitle: StepperText("Your order has been placed"),
            iconWidget: _iconStepper(1)),
        StepperData(
            title: StepperText("Preparing"),
            subtitle: StepperText("Your order is being prepared"),
            iconWidget: _iconStepper(2)),
        StepperData(
            title: StepperText("On the way"),
            subtitle: StepperText(
                "Our delivery executive is on the way to deliver your item"),
            iconWidget: _iconStepper(3)),
        StepperData(
            title: StepperText("Delivered",
                textStyle: const TextStyle(
                  color: Colors.grey,
                )),
            iconWidget: _iconStepper(4)),
      ],
      stepperDirection: Axis.vertical,
      iconWidth: 40, // Height that will be applied to all the stepper icons
      iconHeight: 40, // Width that will be applied to all the stepper icons
      inActiveBarColor: MyColors.grey,
      activeBarColor: MyColors.baseColor,
      activeIndex: widget.currentStep,
      verticalGap: 22,
    );
  }

  Widget _iconStepper(int step) {
    return widget.currentStep >= step
        ? const Icon(Icons.radio_button_checked, color: MyColors.baseColor)
        : const Icon(Icons.radio_button_off, color: MyColors.grey);
  }
}
