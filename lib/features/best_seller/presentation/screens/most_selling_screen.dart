import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/best_seller/presentation/cubit/most_selling_cubit.dart';
import 'package:flowery_e_commerce/features/generic/presentation/widgets/build_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/spacing.dart';

class MostSellingScreen extends StatelessWidget {
  const MostSellingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MostSellerCubit mostSellerCubit = getIt.get<MostSellerCubit>()
      ..getMostSellers();
    return BlocProvider(
      create: (context) => mostSellerCubit,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(
          appBarTxt: 'Best seller',
          context: context,
          showArrow: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  'Bloom with our exquisite best sellers',
                  style: MyFonts.styleMedium500_14.copyWith(
                    color: MyColors.grey,
                  ),
                ),
              ),
              verticalSpacing(20),
              const BuildItem(),
            ],
          ),
        ),
      ),
    );
  }
}
