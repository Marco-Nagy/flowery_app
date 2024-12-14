import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/utils/widgets/spacing.dart';
import '../widgets/signup_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: customAppBar(
          appBarTxt:AppLocalizations.of(context)!.signUp ,
          context: context,
          showArrow: true,
          navigation: () {
            return ;
          }),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: verticalSpacing(
                15,
              )),
              const SliverToBoxAdapter(
                child: SignUpForm(),
              )
            ],
          )),
    );
  }
}
