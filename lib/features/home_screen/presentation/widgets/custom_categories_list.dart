import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/snack_bar.dart';
import 'package:flowery_e_commerce/features/categories/presentation/categories/viewModel/categories_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/generic/presentation/widgets/cached_network_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoriesList extends StatefulWidget {
  const CustomCategoriesList({super.key});

  @override
  State<CustomCategoriesList> createState() => _CustomCategoriesListState();
}

class _CustomCategoriesListState extends State<CustomCategoriesList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: BlocBuilder<CategoriesViewModelCubit, CategoriesViewModelState>(
        builder: (context, state) {
          switch (state) {
            case GetCategoriesViewModelLoading():
              return const AppLoader();
            case GetCategoriesViewModelError():
              aweSnackBar(
                  msg: state.error.error ?? '',
                  context: context,
                  type: MessageTypeConst.failure);

            case GetCategoriesViewModelSuccess():
              return ListView.builder(
              itemCount:state.categories!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5.sp),
                      height: 64.h,
                      width: 68.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        color: MyColors.lightPink,
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 24.w,
                          height: 24.h,
                          child: CachedNetworkWidget(
                            imageUrl: '${state.categories?[index]!.image}',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h,),
                    Text('${state.categories?[index]!.name}', style: MyFonts.styleRegular400_14.copyWith(
                        color: MyColors.blackBase)),
                  ],
                );
              },
            );
            case CategoriesViewModelInitial():
          }
          return Container();
        },
      ),
    );
  }
}
