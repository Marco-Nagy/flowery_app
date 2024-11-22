import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
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
          if(state is GetOccasionsSuccessState){
            return ListView.builder(
              itemCount: state.occasions.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(5.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        state.occasions[index].image,
                        width: 161.w,
                        height: 181.h,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 5.h,),
                      Text(state.occasions[index].name, style: MyFonts.styleMedium500_14.copyWith(
                          color: MyColors.blackBase)),
                    ],
                  ),
                );
              },
            );
          }else{
            return SizedBox();
          }
        },
      ),
    );
  }
}
