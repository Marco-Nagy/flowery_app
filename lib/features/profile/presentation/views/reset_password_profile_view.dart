import 'package:flowery_e_commerce/core/utils/widgets/base/base_view.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/widgets/base/custom_app_bar.dart';
import '../widgets/section_reset_password_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ResetPasswordProfileView extends StatelessWidget {
  const ResetPasswordProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomAppBar(
                  appBarTxt: AppLocalizations.of(context)!.resetPassword,
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
    );
  }
}
