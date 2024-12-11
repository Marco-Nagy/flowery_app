import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/features/auth/presentation/login/widgets/custom_text_form_field.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late final addressController;
  late final phoneController;
  late final recipientController;
  late final cityController;
  late final areaController;

  @override
  void initState() {
    addressController = TextEditingController();
    phoneController = TextEditingController();
    recipientController = TextEditingController();
    cityController = TextEditingController();
    areaController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    addressController.dispose();
    phoneController.dispose();
    recipientController.dispose();
    cityController.dispose();
    areaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        appBarTxt: 'Address',
        context: context,
        showArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(5.sp),
                width: 390.w,
                height: 200.h,
                child: Image.asset(Assets.imagesRectangle)),
            Container(
              margin: EdgeInsets.all(12.sp),
              child: CustomTextFormField(
                hintText: 'Enter the address',
                labelText: 'Address',
                controller: addressController,
              ),
            ),
            Container(
              margin: EdgeInsets.all(12.sp),
              child: CustomTextFormField(
                hintText: 'Enter the phone number',
                labelText: 'Phone number',
                controller: phoneController,
              ),
            ),
            Container(
              margin: EdgeInsets.all(12.sp),
              child: CustomTextFormField(
                hintText: 'Enter the recipient name',
                labelText: 'Recipient name',
                controller: recipientController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.all(12.sp),
                  width: 160.w,
                  child: CustomTextFormField(
                    labelText: 'City',
                    hintText: 'Cairo',
                    controller: cityController,
                    suffix: SizedBox(
                        width: 16.w,
                        height: 16.h,
                        child: Image.asset(Assets.imagesArrowDownIos)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(12.sp),
                  width: 160.w,
                  child: CustomTextFormField(
                    labelText: 'Area',
                    hintText: 'October',
                    controller: areaController,
                    suffix: SizedBox(
                        width: 16.w,
                        height: 16.h,
                        child: Image.asset(Assets.imagesArrowDownIos)),
                  ),
                ),

              ],
            ),
            SizedBox(height: 20.h,),
            SizedBox(
              width: 340.w,
              height: 65.h,
              child: CurvedButton(title: 'Save address ',onTap: (){},
              color: MyColors.gray30,),
            ),
          ],
        ),
      ),
    );
  }
}
