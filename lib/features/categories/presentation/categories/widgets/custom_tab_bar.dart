import 'package:flutter/material.dart';

import '../../../../../core/styles/colors/my_colors.dart';
import '../../../../../core/styles/fonts/my_fonts.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          indicatorColor: MyColors.baseColor,
          labelColor: MyColors.baseColor,
          unselectedLabelColor: MyColors.placeHolder,
          labelStyle:
              MyFonts.styleRegular400_16.copyWith(color: MyColors.baseColor),
          tabs: const [
            Tab(text: "All"),
            Tab(text: "Hand Bouquet"),
            Tab(text: "Vases"),
            Tab(text: "Boxes"),
            Tab(text: "Jewelry"),
          ],
        ),
        Expanded(
          child: TabBarView(
            children: [
              for (int i = 0; i < 5; i++)
                Center(
                  child: Text(
                    "Tab ${i + 1}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
