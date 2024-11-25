import 'package:flowery_e_commerce/core/styles/app_images.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/features/categories/presentation/categories/views/categories_view.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/tabs/cart_tab.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/tabs/category_tab.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/tabs/home_tab.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
     HomeTab(),
    CategoriesView(),
    const CartTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white60,
        bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(15),
              topEnd: Radius.circular(15),
            ),
            child: BottomNavigationBar(
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
                    color: currentTabIndex== 0?MyColors.baseColor:MyColors.white80,
                    AppImages.home,
                    width: 24.w,
                    height: 24.h,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    color: currentTabIndex== 1?MyColors.baseColor:MyColors.white80,
                    AppImages.category,
                    width: 24.w,
                    height: 24.h,
                  ),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    color: currentTabIndex== 2?MyColors.baseColor:MyColors.white80,

                    AppImages.cart,
                    width: 24.w,
                    height: 24.h,
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    color: currentTabIndex== 3?MyColors.baseColor:MyColors.white80,
                    AppImages.profile,
                    width: 24.w,
                    height: 24.h,
                  ),
                  label: 'Profile',
                ),
              ],
              currentIndex: currentTabIndex,
              onTap: (index) => setState(() => currentTabIndex = index),
            )),
        body: tabs[currentTabIndex],
      ),
    );
  }
}
