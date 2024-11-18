import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      this.isPassword,
      this.hintText,
      this.labelText,
      this.controller,
      this.suffix,
      this.validator});

  final String? hintText;
  final String? labelText;
  final dynamic controller;
  final bool? isPassword;
  final Widget? suffix;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ?? false,
      controller: widget.controller,
      decoration: InputDecoration(
        suffix: widget.suffix ?? SizedBox(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: '${widget.labelText ?? ''}',
        labelStyle: MyFonts.styleRegular400_12.copyWith(color: MyColors.gray),
        hintText: '${widget.hintText ?? ''}',
        hintStyle:
            MyFonts.styleRegular400_14.copyWith(color: MyColors.placeHolder),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: MyColors.gray),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: MyColors.gray),
        ),
      ),
      validator: widget.validator,
    );
  }
}
