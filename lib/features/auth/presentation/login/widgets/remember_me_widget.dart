import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import '../../../../../core/localization/lang_keys.dart';
class RememberMeWidget extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool initialValue;

  const RememberMeWidget({
    super.key,
    required this.onChanged,
    this.initialValue = false,
  });

  @override
  RememberMeWidgetState createState() => RememberMeWidgetState();
}

class RememberMeWidgetState extends State<RememberMeWidget> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          widget.onChanged(isChecked);
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isChecked ? MyColors.baseColor : Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: isChecked ? Colors.transparent : MyColors.gray30,
                width: 2,
              ),
            ),
            width: 20,
            height: 20,
            child: isChecked
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  )
                : null,
          ),
          const SizedBox(width: 8),
          Text(
           context.translate(LangKeys.rememberMe),
            style: MyFonts.styleRegular400_13.copyWith(color: MyColors.black),
          ),
        ],
      ),
    );
  }
}
