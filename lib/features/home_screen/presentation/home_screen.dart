import 'package:flowery_e_commerce/core/styles/app_images.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_base_action.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/generic/presentation/screens/categories_view.dart';
import 'package:flowery_e_commerce/features/cart/presentation/view/cart_view.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/tabs/home_tab.dart';
import 'package:flowery_e_commerce/features/profile/presentation/views/profile_main_screen.dart';
import 'package:flowery_e_commerce/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const CategoriesView(),
    BlocProvider(
      create: (context) => getIt.get<CartViewModelCubit>()
        ..doAction(
          GetUserCartDataAction(),
        ),
      child: const CartView(),
    ),
    const ProfileMainScreen(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white60,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: MyColors.whiteBase,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 11,
        unselectedItemColor: MyColors.white80,
        selectedItemColor: MyColors.baseColor,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              color:
              currentTabIndex == 0 ? MyColors.baseColor : MyColors.white80,
              AppImages.home,
              width: 24.w,
              height: 24.h,
            ),
            label:  AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              color:
              currentTabIndex == 1 ? MyColors.baseColor : MyColors.white80,
              AppImages.category,
              width: 24.w,
              height: 24.h,
            ),
            label:  AppLocalizations.of(context)!.categories,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              color:
              currentTabIndex == 2 ? MyColors.baseColor : MyColors.white80,
              AppImages.cart,
              width: 24.w,
              height: 24.h,
            ),
            label:  AppLocalizations.of(context)!.cart,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              color:
              currentTabIndex == 3 ? MyColors.baseColor : MyColors.white80,
              AppImages.profile,
              width: 24.w,
              height: 24.h,
            ),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
        currentIndex: currentTabIndex,
        onTap: (index) => setState(() => currentTabIndex = index),
      ),
      body: tabs[currentTabIndex],
    );
  }
}
