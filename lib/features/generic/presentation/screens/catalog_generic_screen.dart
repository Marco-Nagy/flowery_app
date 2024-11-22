import 'package:flowery_e_commerce/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../view_model/generic_view_model_cubit.dart';
import '../widgets/grid_builder_widget.dart';
import '../widgets/tab_bar_widget.dart';

class CatalogGenericScreen extends StatelessWidget {
  final String resourceName;

  const CatalogGenericScreen({Key? key, required this.resourceName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return BlocProvider(
      create: (context) =>
      getIt.get<GenericViewModelCubit>()..gitData(resourceName),
      child: BlocBuilder<GenericViewModelCubit, GenericViewModelState>(
        builder: (context, state) {
          final cubit = context.read<GenericViewModelCubit>();

          scrollController.addListener(() {
            if (scrollController.position.pixels >=
                scrollController.position.maxScrollExtent &&
                !(state is GenericItemLoadedState)) {
              cubit.fetchNextPage();
            }
          });

          if (state is GenericItemLoadedState ) {
            return Center(
              child: CircularProgressIndicator(color: MyColors.baseColor),
            );
          }

          if (state is GenericItemErrorState) {
            return Center(child: Text(state.message.error!));
          }

          if (state is GenericItemSuccessState) {
            return DefaultTabController(
              length: cubit.categories.length,
              child: Expanded(
                child: Column(
                  children: [
                    tabBarWidget(cubit: cubit),
                    verticalSpacing(20),
                    Expanded(
                      child: GridBuilderWidget(
                        controller: scrollController,
                        cubit: cubit,
                        state: state,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(color: MyColors.baseColor),
          );
        },
      ),
    );
  }
}
