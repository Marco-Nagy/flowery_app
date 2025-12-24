import 'package:flowery_store/core/styles/colors/my_colors.dart';
import 'package:flowery_store/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';

class SwitchButtonWidget extends StatefulWidget {
  final String text;
  final ValueNotifier<bool> value;

  const SwitchButtonWidget({
    super.key,
    required this.text,
    required this.value,
  });

  @override
  SwitchButtonWidgetState createState() => SwitchButtonWidgetState();
}

class SwitchButtonWidgetState extends State<SwitchButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 24,
          child: Transform.scale(
            scale: .9,
            origin: Offset.zero,
            transformHitTests: true,
            alignment: Alignment.centerLeft,
            child: Switch(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              inactiveTrackColor: MyColors.white,
              inactiveThumbColor: MyColors.baseColor,
              activeThumbColor: MyColors.white,
              activeTrackColor: MyColors.baseColor,
              value: widget.value.value,
              onChanged: (value) {
                setState(() {
                  widget.value.value = value;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Text(
            widget.text,
            style: MyFonts.styleMedium500_18.copyWith(color: MyColors.black),
          ),
        ),
      ],
    );
  }
}

