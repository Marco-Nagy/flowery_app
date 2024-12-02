import 'package:flowery_e_commerce/core/utils/widgets/base/base_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/base/custom_app_bar.dart';
import '../widgets/section_reset_password_form.dart';

class ResetPasswordProfileView extends StatelessWidget {
  const ResetPasswordProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseView(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomAppBar(
                  appBarTxt: 'Reset Password',
                  showArrow: true,
                ),
                SizedBox(
                  height: 34,
                ),
                SectionResetPasswordForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
