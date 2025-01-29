import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/utils/widgets/spacing.dart';

Widget horizontalCardScroll(List<Map<String, dynamic>> items) {
  return FadeInLeft(
    duration: const Duration(milliseconds: 1800),
    child: SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Container(
            width: 160,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  MyColors.lightBlue.withValues(alpha: (0.8 * 255).toDouble()), // 80% opacity
                ],

              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 2,
                  offset: const Offset(2, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(items[index]['icon'], size: 44, color: MyColors.baseColor),
                verticalSpacing(12),
                Text(
                  items[index]['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 12),
      ),
    ),
  );
}
