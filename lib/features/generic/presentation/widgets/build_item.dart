import 'package:flowery_e_commerce/features/best_seller/presentation/cubit/most_seller_states.dart';
import 'package:flowery_e_commerce/features/best_seller/presentation/cubit/most_selling_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/buttons/row_button.dart';
import '../../../../core/utils/widgets/spacing.dart';
import 'cached_network_widget.dart';

class BuildItem extends StatelessWidget {
  BuildItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MostSellerCubit, MostSellerStates>(
      builder: (context, state) {
        if (state is GetMostSellerSuccessState) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              childAspectRatio: 3 / 4,
              mainAxisExtent: 270.h,
            ),
            shrinkWrap: true,
            itemCount: state.mostSeller.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: MyColors.white70),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 140.h,
                      child: CachedNetworkWidget(
                        imageUrl: state.mostSeller[index].imageCover,
                      ),
                    ),
                    verticalSpacing(8.h),
                    Align(
                      alignment: Alignment.center,
                      widthFactor: 1.7,
                      child: Text(
                        state.mostSeller[index].title,
                        style: MyFonts.styleRegular400_14
                            .copyWith(color: MyColors.black),
                      ),
                    ),
                    verticalSpacing(6.h),
                    RichText(
                      text: TextSpan(
                        text: 'EGP ${state.mostSeller[index].price}',
                        style: MyFonts.styleMedium500_14
                            .copyWith(color: MyColors.black),
                        children: [
                          WidgetSpan(child: horizontalSpacing(5.w)),
                          TextSpan(
                            text:
                                '${state.mostSeller[index].priceAfterDiscount}',
                            style: MyFonts.styleRegular400_12.copyWith(
                              color: MyColors.gray,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          WidgetSpan(child: horizontalSpacing(5.w)),
                          TextSpan(
                            text: '20%',
                            style: MyFonts.styleRegular400_12
                                .copyWith(color: MyColors.green),
                          ),
                        ],
                      ),
                    ),
                    verticalSpacing(8.h),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                            width: 150.w, child: RowButton(onTap: () {}))),
                  ],
                ),
              );
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
