import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';

class PlusMinusButtons extends StatelessWidget {
  final VoidCallback deleteQuantity;
  final VoidCallback addQuantity;
  final String text;

  const PlusMinusButtons(
      {super.key,
        required this.addQuantity,
        required this.deleteQuantity,
        required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: deleteQuantity,
            icon: Container(
                height: 30,
                width: 30,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Image.asset(
                    Assets.imagesRemove,
                  ),
                ))),
        Center(child: Text(text, style: MyFonts.styleSemiBold600_14),),
        IconButton(
            onPressed: addQuantity,
            icon: Container(
                height: 30,
                width: 30,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Image.asset(Assets.imagesAdd),
                )))
      ],
    );
  }
}
