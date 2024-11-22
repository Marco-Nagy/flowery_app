import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/features/auth/presentation/login/widgets/remember_me_widget.dart';
import 'package:flutter/material.dart';

class RememberMeAndForgotPassword extends StatelessWidget {
  final ValueChanged<bool> onRememberMeChanged;

  const RememberMeAndForgotPassword({
    Key? key,
    required this.onRememberMeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RememberMeWidget(onChanged: onRememberMeChanged),
          InkWell(
            onTap: () => context.pushNamed(AppRoutes.forgetPassword),
            child: Text(
              'Forget Password?',
              style: MyFonts.styleRegular400_12.copyWith(
                color: MyColors.black,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
