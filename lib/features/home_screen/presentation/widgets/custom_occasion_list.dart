import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/snack_bar.dart';
import 'package:flowery_e_commerce/features/generic/presentation/widgets/cached_network_widget.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/home_cubit/occasions_cubit/occasions_cubit.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/home_cubit/occasions_cubit/occasions_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOccasionList extends StatefulWidget {
  const CustomOccasionList({super.key});

  @override
  State<CustomOccasionList> createState() => CustomOccasionListState();
}

class CustomOccasionListState extends State<CustomOccasionList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: BlocBuilder<OccasionsCubit, OccasionsStates>(
        builder: (context, state) {
          switch (state) {
            case GetOccasionsLoadingState():
              AppLoader();
            case GetOccasionsSuccessState():
              return ListView.builder(
                itemCount: state.occasions.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(5.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 161.w,
                          height: 181.h,
                          child: CachedNetworkWidget(
                            imageUrl: state.occasions[index].image,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(state.occasions[index].name,
                            style: MyFonts.styleMedium500_14
                                .copyWith(color: MyColors.blackBase)),
                      ],
                    ),
                  );
                },
              );
            case GetOccasionsErrorState():
              aweSnackBar(
                  msg: state.errorModel.error ?? '',
                  context: context,
                  type: MessageTypeConst.failure);
            case OccasionsInitialState():
          }
          return Container();
        },
      ),
    );
  }
}
