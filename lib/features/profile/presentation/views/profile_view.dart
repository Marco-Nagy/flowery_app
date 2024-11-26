import 'package:flowery_e_commerce/features/profile/presentation/widgets/custom_profile_app_bar.dart';
import 'package:flutter/material.dart';
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
            CustomProfileAppBar(),
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
