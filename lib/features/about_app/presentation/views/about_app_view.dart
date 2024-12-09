import 'package:animate_do/animate_do.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/features/about_app/presentation/widgets/list_tile_widget.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'About Flowery App',
            style: MyFonts.styleMedium500_20.copyWith(color: MyColors.white),
          ),
          centerTitle: true,
          backgroundColor: MyColors.baseColor,
          elevation: 0,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        verticalSpacing(20),
                        FadeIn(
                          duration: const Duration(milliseconds: 1000),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              '${Assets.imagesAboutAppImage}',
                              height: 120,
                              width: 120,
                            ),
                          ),
                        ),
                        verticalSpacing(20),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1500),
                          child: Text(
                            "Welcome to Flowery App",
                            style: MyFonts.styleMedium500_20
                                .copyWith(color: MyColors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        verticalSpacing(20),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1800),
                          child: const Text(
                            "Flowery App is your ultimate companion for discovering beautiful flowers, managing your garden, and learning how to take care of your plants. Whether you're a gardening expert or a beginner, Flowery App has something for everyone!",
                            style: TextStyle(fontSize: 16, height: 1.5),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        verticalSpacing(30),
                        const Divider(color: MyColors.baseColor, thickness: 1),
                        verticalSpacing(10),
                        FadeInUp(
                            duration: const Duration(milliseconds: 2000),
                            child: const ListTileWidget(
                                title: "Version",
                                icon: Icons.eco,
                                info: "1.0.0")),
                        FadeInUp(
                            duration: const Duration(milliseconds: 2200),
                            child: const ListTileWidget(
                                title: "Developed By",
                                icon: Icons.code,
                                info: "Team Two")),
                        FadeInUp(
                          duration: const Duration(milliseconds: 2400),
                          child: const ListTileWidget(
                              title: "Contact Us",
                              icon: Icons.email,
                              info: "support@floweryapp.com"),
                        ),
                      ],
                    ),
                    const Positioned(
                      bottom: -5, // تأكد من أن النص مثبت عند الصفر
                      left: 0,
                      right: 0,
                      child: Text(
                        "© 2024 Flowery App. All rights reserved.",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
