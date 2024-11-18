import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: "search",
        hintStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 16.sp,
          color: MyColors.white70,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: MyColors.white70,
          size: 24.sp,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(
              color:  MyColors.white70,
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(
              color:  MyColors.white70,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(
              color:  MyColors.white70,
            )),
      ),
    );
  }
}
