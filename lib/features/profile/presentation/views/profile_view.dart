import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/features/profile/presentation/widgets/custom_profile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_profile_picture.dart';
import '../widgets/section_profile_form.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 56.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
            const CustomProfileAppBar(),
            verticalSpacing(24),
            const ProfilePic(),
            verticalSpacing(24),
            const SectionProfileForm(),
          ],
        ),
      ),
    );
  }
}
