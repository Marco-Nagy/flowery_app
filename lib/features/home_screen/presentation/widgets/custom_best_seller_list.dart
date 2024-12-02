import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/snack_bar.dart';
import 'package:flowery_e_commerce/features/generic/presentation/widgets/cached_network_widget.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/home_cubit/best_seller_cubit/best_seller_cubit.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/home_cubit/best_seller_cubit/best_seller_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_routes.dart';

class CustomBestSellerList extends StatefulWidget {
  const CustomBestSellerList({super.key});

  @override
  State<CustomBestSellerList> createState() => CustomBestSellerListState();
}

class CustomBestSellerListState extends State<CustomBestSellerList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      child: BlocBuilder<BestSellerCubit, BestSellerStates>(
        builder: (context, state) {
         switch(state){
           case GetBestSellerSuccessState():
           return ListView.builder(
             itemCount: state.bestSeller.length,
             scrollDirection: Axis.horizontal,
             itemBuilder: (context, index) {
               return GestureDetector(
                 onTap: () => Navigator.pushNamed(context, AppRoutes.productsDetailsView, arguments: state.bestSeller[index]),
                 child: Container(
                   margin: EdgeInsets.all(3.sp),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(
                         width: 170.w,
                         height: 180.h,
                         child: CachedNetworkWidget(
                           imageUrl: state.bestSeller[index].imgCover??'',
                           fit: BoxFit.cover,
                         ),
                       ),
                       SizedBox(height: 8.h,),
                       SizedBox(
                         width: 170.w,
                         child: Text(state.bestSeller[index].title??'',
                           style: MyFonts.styleRegular400_14.copyWith(
                               color: MyColors.blackBase,
                               overflow: TextOverflow.visible
                           ),
                           maxLines: 2,
                         ),
                       ),
                       SizedBox(height: 3.h,),
                       Text('${state.bestSeller[index].price}' , style: MyFonts.styleMedium500_14.copyWith(
                           color: MyColors.blackBase)),
                     ],
                   ),
                 ),
               );
             },
           );
           case GetBestSellerErrorState():
             aweSnackBar(msg: state.errorModel.error??'', context: context, type: MessageTypeConst.failure);
           case GetBestSellerLoadingState():
             return const AppLoader();
           case BestSellerInitialState():
             default:null;
         }
         return Container();
        },
      ),
    );
  }
}
