import 'package:flowery_e_commerce/core/utils/widgets/base/base_view.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/categories/presentation/categories/viewModel/categories_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/generic/presentation/screens/categories_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesTab extends StatelessWidget {
 const  CategoriesTab({super.key});
  @override
  Widget build(BuildContext context) {
    CategoriesViewModelCubit categoriesViewModelCubit = getIt.get<CategoriesViewModelCubit>();

    return BlocProvider(
      create: (context) => categoriesViewModelCubit,
      child: const BaseView(child: CategoriesView()),
    );
  }
}
