import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/localization/lang_keys.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/utils/widgets/base/app_loader.dart';
import '../../../../core/utils/widgets/buttons/carved_button.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../../../../generated/assets.dart';
import '../../../generic/presentation/widgets/cached_network_widget.dart';
import '../view_model/order_cubit.dart';

class ListOrderWidget extends StatelessWidget {
  const ListOrderWidget({
    super.key,
    required this.textButton,
  });

  final String textButton;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case OrderSuccess:
            final successState = state as OrderSuccess;
            if (successState.orders == null || successState.orders!.isEmpty) {
              return Center(
                child: Text(
                 context.translate(LangKeys.noOrdersAvailable),
                  style: MyFonts.styleMedium500_14,
                ),
              );
            }
            return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemCount: successState.orders!.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 125.h,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: MyColors.white70),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: CachedNetworkWidget(
                          imageUrl: successState.orders![index]
                                  .orderItems![index].product!.imgCover ??
                              Assets.imagesFlower,
                          fit: BoxFit.cover,
                          height: 109.h,
                          //  width: 127.w,
                        )),
                        horizontalSpacing(16.w),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                successState.orders![index].orderItems![index]
                                    .product!.title!,
                                style: MyFonts.styleRegular400_12,
                              ),
                              Text(
                                  '${context.translate(LangKeys.egp)} ${successState.orders![index].orderItems![index].product!.price.toString()}',
                                  style: MyFonts.styleMedium500_12),
                              Text(
                                  '${context.translate(LangKeys.orderNumber)} ${successState.orders![index].orderNumber}',
                                  style: MyFonts.styleRegular400_12
                                      .copyWith(color: MyColors.grey)),
                              verticalSpacing(8.h),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: CurvedButton(
                                  height: 30.h,
                                  style: MyFonts.styleMedium500_13
                                      .copyWith(color: MyColors.white),
                                  color: MyColors.baseColor,
                                  title: textButton,
                                  onTap: () {},
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                });
          case OrderError:
            final errorState = state as OrderError;
            return Center(
              child: Text(
                errorState.error.error.toString(),
              ),
            );
          case OrderInitial:
          case OrderLoading:
            return const AppLoader();
          default:
            return Container();
        }
      },
    );
  }
}
