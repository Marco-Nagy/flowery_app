import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  final String title;
  final String address;
  final bool isSelected;
  final VoidCallback onTap;

  const AddressCard({
    required this.title,
    required this.address,
    this.isSelected = false,
    required this. onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors.whiteBase,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color:  MyColors.gray30,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: InkWell(
          onTap: () => onTap(),
          child: Row(children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: Colors.pink,
            ),
            horizontalSpacing(5),
            Text(title,style:MyFonts.styleMedium500_16),
          ],),
        ),
        subtitle: Text(address),
        trailing: InkWell(
          onTap: () => context.pushNamed(AppRoutes.addressScreen),
            child: Image.asset(Assets.imagesEditAddress,height: 20,width: 20,)),
      ),
    );
  }
}
