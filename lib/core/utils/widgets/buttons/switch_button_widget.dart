import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';

class SwitchButtonWidget extends StatefulWidget {
final  String text;
late final ValueNotifier<bool> value;


    SwitchButtonWidget({super.key, required this.text, required this.value,});

  @override
  _SwitchButtonWidgetState createState() => _SwitchButtonWidgetState();
}

class _SwitchButtonWidgetState extends State<SwitchButtonWidget> {
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
              inactiveTrackColor:  MyColors.white ,
              inactiveThumbColor: MyColors.baseColor,
              activeColor:   MyColors.white,
              activeTrackColor: MyColors.baseColor,
              // trackOutlineColor: const WidgetStatePropertyAll(MyColors.white70),
              value: widget.value.value,
              // trackOutlineWidth: WidgetStateProperty.all(0),
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
