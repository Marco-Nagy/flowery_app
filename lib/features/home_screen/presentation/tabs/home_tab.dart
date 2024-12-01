import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/categories/presentation/categories/viewModel/categories_action.dart';
import 'package:flowery_e_commerce/features/categories/presentation/categories/viewModel/categories_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/generic/presentation/generic_item_by_product/viewModel/generic_item_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/home_cubit/best_seller_cubit/best_seller_cubit.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/home_cubit/occasions_cubit/occasions_cubit.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/widgets/custom_best_seller_list.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/widgets/custom_categories_list.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/widgets/custom_occasion_list.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/widgets/search_textfield.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeTab extends StatelessWidget {
 const HomeTab({super.key});



  @override
  Widget build(BuildContext context) {
    OccasionsCubit occasionsCubit = getIt.get<OccasionsCubit>()
      ..getOccasions();
    BestSellerCubit bestSellerCubit = getIt.get<BestSellerCubit>()
      ..getBestSellers();
    CategoriesViewModelCubit categoriesCubit = getIt.get<CategoriesViewModelCubit>()..doAction( GetCategoriesAction());
    GenericItemViewModelCubit genericCubit=  getIt.get<GenericItemViewModelCubit>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => occasionsCubit,
        ),
        BlocProvider(
          create: (context) => bestSellerCubit,
        ),
        BlocProvider(
          create: (context) => categoriesCubit,
        ),
        BlocProvider(
          create: (context) => genericCubit,
        ),
      ],
      child: Scaffold(
        backgroundColor: MyColors.white,
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 89.w,
                height: 35.h,
              ),
              SizedBox(
                width: 20.w,
              ),
              SizedBox(width: 220.w, height: 50.h, child: SearchTextField()),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(15.sp),
                child: Row(
                  children: [
                    Image.asset(Assets.imagesLocationOn,height: 20.h,width: 20.w,),
                    SizedBox(width: 2.w,),
                    Text(
                      'Deliver to 2XVP+XC - Sheikh Zayed ',
                      style: MyFonts.styleMedium500_14
                          .copyWith(color: MyColors.blackBase),
                    ),
                    SizedBox(width: 2.w,),
                    Image.asset(Assets.imagesArrowDownIos,height: 16.h,width: 16.w,),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8.w),
                    child: Text('Categories',
                        style: MyFonts.styleMedium500_18
                            .copyWith(color: MyColors.blackBase)),
                  ),
                  InkWell(
                    onTap: (){
                      context.pushNamed(AppRoutes.categoriesView, arguments: 'categories');
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15.w, right: 15.w),
                      child: Text('View All',
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
                    child: Text('Best seller',
                        style: MyFonts.styleMedium500_18
                            .copyWith(color: MyColors.blackBase)),
                  ),
                  InkWell(
                    onTap: (){
                    context.pushNamed(AppRoutes.mostSellingScreen,arguments: '');
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15.w, right: 15.w),
                      child: Text('View All',
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
                    child: Text('Occasion',
                        style: MyFonts.styleMedium500_18
                            .copyWith(color: MyColors.blackBase)),
                  ),
                  InkWell(
                    onTap: (){
                      context.pushNamed(AppRoutes.occasionScreen,arguments: 'occasions');
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15.w, right: 15.w),
                      child: Text('View All',
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
