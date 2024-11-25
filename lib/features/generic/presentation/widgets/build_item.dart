import 'package:flowery_e_commerce/features/best_seller/presentation/cubit/most_seller_states.dart';
import 'package:flowery_e_commerce/features/best_seller/presentation/cubit/most_selling_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generic_item_by_product/widget/generic_build_item.dart';


class BuildItem extends StatelessWidget {
  BuildItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MostSellerCubit, MostSellerStates>(
      builder: (context, state) {
        if(state is GetMostSellerSuccessState){
          return GridView.builder( gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            childAspectRatio: 3 / 4,
            mainAxisExtent: 275.h,
          ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.mostSeller.length,
            itemBuilder: (BuildContext context, int index) {
              return GenericBuildItem(
                imageCover: state.mostSeller[index].imageCover,
                title: state.mostSeller[index].title,
                price: state.mostSeller[index].price.toString(),
                priceAfterDiscount: state.mostSeller[index].priceAfterDiscount.toString(),

              );
            },);
        }else{
          return SizedBox();
        }
      },
    );
  }
}

