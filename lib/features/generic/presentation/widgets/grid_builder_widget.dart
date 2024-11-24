import 'package:flowery_e_commerce/core/utils/widgets/base/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';
import '../view_model/generic_view_model_cubit.dart';
import 'generic_item.dart';

class GridBuilderWidget extends StatelessWidget {
  const GridBuilderWidget({super.key,required this.controller, required this.cubit, required this.state});
  final ScrollController? controller;
  final GenericViewModelCubit cubit;
 final GenericItemSuccessState state;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        childAspectRatio: 3 / 4,
        mainAxisExtent: 248.w,
      ),
      itemCount: state.items.length + (cubit.isFetching ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= state.items.length) {
          return  AppLoader();
        }

        final item = state.items[index];
        return GenericItem(
          name: item.name ?? "No Name",
          image: item.image ?? Assets.imagesFlower,
        );
      },
    );
  }
}
