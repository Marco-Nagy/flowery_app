import 'package:flutter/material.dart';

class CustomGiftSwitch extends StatefulWidget {
 late  bool value;


     CustomGiftSwitch({super.key, this.value = false, });

  @override
  State<CustomGiftSwitch> createState() => _CustomGiftSwitchState();
}

class _CustomGiftSwitchState extends State<CustomGiftSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: widget.value,
          onChanged: (bool value) {
            setState(() {

              widget.value = value;
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
