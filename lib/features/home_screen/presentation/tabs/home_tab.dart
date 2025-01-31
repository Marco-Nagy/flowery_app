import 'package:animate_do/animate_do.dart';
import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/categories/presentation/categories/viewModel/categories_action.dart';
import 'package:flowery_e_commerce/features/categories/presentation/categories/viewModel/categories_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/generic/presentation/generic_item_by_product/viewModel/generic_item_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/generic/presentation/widgets/custom_search_categories.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/home_cubit/best_seller_cubit/best_seller_cubit.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/home_cubit/occasions_cubit/occasions_cubit.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/widgets/custom_best_seller_list.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/widgets/custom_categories_list.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/widgets/custom_occasion_list.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/location _widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<OccasionsCubit>()..getOccasions(),
        ),
        BlocProvider(
          create: (context) => getIt.get<BestSellerCubit>()..getBestSellers(),
        ),
        BlocProvider(
          create: (context) => getIt.get<CategoriesViewModelCubit>()
            ..doAction(GetCategoriesAction()),
        ),
        BlocProvider(
          create: (context) => getIt.get<GenericItemViewModelCubit>(),
        ),
      ],
      child: Scaffold(
        backgroundColor: MyColors.white,
        appBar: AppBar(
          backgroundColor: MyColors.white,
          title: FadeInDown(
            duration: const Duration(milliseconds:700),
            child: Row(
              children: [
                Flexible(
                  child: Image.asset(
                    Assets.imagesLogo,
                    width: 89.w,
                    height: 35.h,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                const Expanded(flex: 3, child: CustomSearchWidget()),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(15.sp),
                child: FadeInDown(
                  duration: const Duration(milliseconds:700),
                  child: LocationWidget(),
                ),
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8.w),
                    child: Text(AppLocalizations.of(context)!.categories,
                        style: MyFonts.styleMedium500_18
                            .copyWith(color: MyColors.blackBase)),
                  ),
                  InkWell(
                    onTap: (){
                      context.pushNamed(AppRoutes.categoriesView, arguments: 'categories');
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15.w, right: 15.w),
                      child: Text(AppLocalizations.of(context)!.view_all,
                          style: MyFonts.styleMedium500_14.copyWith(
                              color: MyColors.baseColor,
                              decoration: TextDecoration.underline)),
                    ),
                  ),
                ],
              ),
              const CustomCategoriesList(),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8.w),
                    child: Text(AppLocalizations.of(context)!.best_seller,
                        style: MyFonts.styleMedium500_18
                            .copyWith(color: MyColors.blackBase)),
                  ),
                  InkWell(
                    onTap: (){
                    context.pushNamed(AppRoutes.mostSellingScreen,arguments: '');
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15.w, right: 15.w),
                      child: Text(AppLocalizations.of(context)!.view_all,
                          style: MyFonts.styleMedium500_12.copyWith(
                              color: MyColors.baseColor,
                              decoration: TextDecoration.underline)),
                    ),
                  ),
      ],
              ),
              const CustomBestSellerList(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8.w),
                    child: Text(AppLocalizations.of(context)!.occasion,
                        style: MyFonts.styleMedium500_18
                            .copyWith(color: MyColors.blackBase)),
                  ),
                  InkWell(
                    onTap: (){
                      context.pushNamed(AppRoutes.occasionScreen,arguments: 'occasions');
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15.w, right: 15.w),
                      child: Text(AppLocalizations.of(context)!.view_all,
                          style: MyFonts.styleMedium500_12.copyWith(
                              color: MyColors.baseColor,
                              decoration: TextDecoration.underline)),
                    ),
                  ),
                ],
              ),
              const CustomOccasionList(),
            ],
          ),
        ),
      ),
    );
  }
}
