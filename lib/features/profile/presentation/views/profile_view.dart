import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/base/custom_app_bar.dart';
import '../widgets/custom_profile_picture.dart';
import '../widgets/section_profile_form.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
        child: Column(
          children: [
            CustomAppBar(appBarTxt: "Edit Profile", showArrow: true),
            const SizedBox(height: 20),
            const ProfilePic(),
            const SizedBox(height: 20),
            const SectionProfileForm(),
          ],
        ),
      ),
    );
  }
}
