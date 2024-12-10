import 'package:flutter/material.dart';

import '../../../../core/styles/colors/my_colors.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget(
      {super.key, required this.title, required this.icon, required this.info});

  final String title, info;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: MyColors.baseColor),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(info),
    );
  }
}
