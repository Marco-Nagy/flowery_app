import 'package:flowery_store/core/routes/app_routes.dart';
import 'package:flowery_store/core/styles/colors/my_colors.dart';
import 'package:flowery_store/core/styles/fonts/my_fonts.dart';
import 'package:flowery_store/core/utils/extension/media_query_values.dart';
import 'package:flowery_store/core/utils/extension/navigation.dart';
import 'package:flowery_store/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_store/features/address/presentation/view_model/address_action.dart';
import 'package:flowery_store/features/address/presentation/view_model/address_cubit.dart';
import 'package:flowery_store/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardItem extends StatelessWidget {
  final AddressesEntity address;
  const CustomCardItem({Key? key, required this.address,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: null,
      child: Container(
        margin: EdgeInsets.all(8.sp),
        child: Card(
          color: MyColors.whiteBase,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp)),
          child: Container(
            margin: EdgeInsets.all(8.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 20.w,
                        height: 20.h,
                        child: Image.asset(
                            Assets.imagesSavedAddress)),
                    SizedBox(
                      width: 6.w,
                    ),
                    SizedBox(
                      width: context.width * 0.5,
                      child: Text(
                        address.street ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: MyFonts.styleMedium500_16
                            .copyWith(color: MyColors.blackBase),
                      ),
                    ),
                    // const Spacer(),
                    InkWell(
                      onTap: () {
                        context.read<AddressViewModel>().doAction(
                            DeleteAddressAction(
                                address.id!));
                      },
                      child: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset(
                              Assets.imagesTrachIcon)),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    InkWell(
                      onTap: () {
                        context.pushNamed(AppRoutes.addressScreen,
                            arguments: address);
                      },
                      child: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset(
                              Assets.imagesEditAddress)),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  '${address.city} - ${address.street}',
                  style: MyFonts.styleRegular400_14.copyWith(
                    color: MyColors.gray,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
