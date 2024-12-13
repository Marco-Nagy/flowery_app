import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/features/auth/presentation/login/widgets/custom_text_form_field.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var recipientController = TextEditingController();
  var cityController = TextEditingController();
  var areaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        appBarTxt: AppLocalizations.of(context)!.address,
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
                hintText: AppLocalizations.of(context)!.enter_address,
                labelText: AppLocalizations.of(context)!.address,
                controller: addressController,
              ),
            ),
            Container(
              margin: EdgeInsets.all(12.sp),
              child: CustomTextFormField(
                hintText: AppLocalizations.of(context)!.enter_phone_number,
                labelText: AppLocalizations.of(context)!.phone_number,
                controller: phoneController,
              ),
            ),
            Container(
              margin: EdgeInsets.all(12.sp),
              child: CustomTextFormField(
                hintText: AppLocalizations.of(context)!.enter_recipient_name,
                labelText: AppLocalizations.of(context)!.recipient_name,
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
                    labelText: AppLocalizations.of(context)!.city,
                    hintText: AppLocalizations.of(context)!.cairo,
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
                    labelText: AppLocalizations.of(context)!.area,
                    hintText: AppLocalizations.of(context)!.october,
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
              child: CurvedButton(title:AppLocalizations.of(context)!.save_address,onTap: (){},
              color: MyColors.gray30,),
            ),
          ],
        ),
      ),
    );
  }
}
