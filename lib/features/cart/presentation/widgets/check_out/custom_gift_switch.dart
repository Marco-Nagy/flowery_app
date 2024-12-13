import 'package:flutter/material.dart';

class CustomGiftSwitch extends StatefulWidget {
 final  bool? initialValue ;


     CustomGiftSwitch({super.key, this.initialValue, });

  @override
  State<CustomGiftSwitch> createState() => _CustomGiftSwitchState();
}

class _CustomGiftSwitchState extends State<CustomGiftSwitch> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue!; // Initialize value from widget
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: value,
          onChanged: (bool value) {
            setState(() {

              value = value;
            });
          },        ),
        const Text(
          'It is a gift',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
