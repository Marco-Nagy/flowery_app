import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/services/shared_preference/location_helper.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../generated/assets.dart';
import '../home_cubit/location_cubit/location_cubit.dart';

class LocationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = LocationCubit(LocationHelper());
        cubit.loadSavedLocation(context);
        return cubit;
      },
      child: Row(
        children: [
          Image.asset(Assets.imagesLocationOn,height: 20.h,width: 20.w,),
          SizedBox(width: 8.w,),
          BlocBuilder<LocationCubit, LocationState>(
            builder: (context, state) {
              if (state is LocationLoading) {
                return Center(
                  child: Text(AppLocalizations.of(context)!.loading),
                );
              } else if (state is LocationLoaded) {
                return Center(
                  child: Text(
                    state.location,
                    style: MyFonts.styleMedium500_14.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              } else if (state is LocationError || state is LocationNotAvailable) {
                return Center(
                  child: TextButton(
                    onPressed: () => context.read<LocationCubit>().detectLocation(context),
                    child: Text(
                      AppLocalizations.of(context)!.get_location,
                      style: MyFonts.styleMedium500_14.copyWith(
                        decoration: TextDecoration.underline,
                        color: MyColors.blackBase,
                      ),
                    ),
                  ),
                );
              }
              return Center(
                child: TextButton(
                  onPressed: () => context.read<LocationCubit>().detectLocation(context),
                  child: Text(
                    AppLocalizations.of(context)!.get_location,
                    style: MyFonts.styleMedium500_14.copyWith(
                      decoration: TextDecoration.underline,
                      color: MyColors.blackBase,
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(width: 8.w,),
          Image.asset(Assets.imagesArrowDownIos,height: 16.h,width: 16.w,),
        ],
      ),
    );
  }
}

