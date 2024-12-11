import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/address/presentation/view_model/address_cubit.dart';
import 'package:flowery_e_commerce/features/address/presentation/view_model/address_states.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardItem extends StatefulWidget {
  const CustomCardItem({super.key});

  @override
  State<CustomCardItem> createState() => _CustomCardItemState();
}

class _CustomCardItemState extends State<CustomCardItem> {
  AddressViewModel addressViewModel = getIt.get<AddressViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => addressViewModel..getSavedAddresses(),
      child: BlocBuilder<AddressViewModel, AddressStates>(
        builder: (context, state) {
          switch(state) {

            case GetSavedAddressesSuccessState():
             SingleChildScrollView(
              child: SizedBox(
                height: 300.h,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount:state.addresses.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 130.h,
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
                                  children: [
                                    SizedBox(
                                        width: 20.w,
                                        height: 20.h,
                                        child: Image.asset(
                                            Assets.imagesSavedAddress)),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Text(
                                      state.addresses[index].street!,
                                      style: MyFonts.styleMedium500_16
                                          .copyWith(color: MyColors.blackBase),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                        width: 20.w,
                                        height: 20.h,
                                        child: Image.asset(
                                            Assets.imagesTrachIcon)),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    SizedBox(
                                        width: 20.w,
                                        height: 20.h,
                                        child: Image.asset(
                                            Assets.imagesEditAddress)),
                                  ],
                                ),
                                SizedBox(
                                  height: 14.h,
                                ),
                                Text(
                                  '${state.addresses[index].city} - ${state.addresses[index].street}',
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
                  },
                ),
              ),
            );

            case GetSavedAddressesLoadingState():
            return const AppLoader();
            case GetSavedAddressesInitialState():
            case GetSavedAddressesErrorState():
          }
          return Container();
        },
      ),
    );
  }
}
