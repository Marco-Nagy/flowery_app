import 'dart:io';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPictureMainScreen extends StatefulWidget {
  const CustomPictureMainScreen({super.key});

  @override
  State<CustomPictureMainScreen> createState() => _CustomPictureMainScreenState();
}
class _CustomPictureMainScreenState extends State<CustomPictureMainScreen> {
  File? _image = null;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:40.h,right: 25.w),
      height: 115.h,
      width: 115.w,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          _image == null
              ? CircleAvatar(
            backgroundImage: AssetImage(Assets.imagesProfile),
          )
              : CircleAvatar(
              backgroundImage: FileImage(_image!) as ImageProvider),
        ],
      ),
    );
  }
}
