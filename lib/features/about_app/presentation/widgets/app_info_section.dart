import 'package:flutter/material.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../widgets/list_tile_widget.dart';

class AppInfoSection extends StatelessWidget {
  const AppInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTileWidget(title: "Version", icon: Icons.eco, info: "1.0.0"),
        ListTileWidget(
            title: "Developed By", icon: Icons.code, info: "Team Two"),
        ListTileWidget(
            title: "Contact Us",
            icon: Icons.email,
            info: "support@floweryapp.com"),
      ],
    );
  }
}
