import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/base/custom_app_bar.dart';
import '../widgets/section_reset_password_form.dart';

class ResetPasswordProfileView extends StatelessWidget {
  const ResetPasswordProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomAppBar(
                    appBarTxt: 'Reset Password',
                    showArrow: true,
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  const SectionResetPasswordForm(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
