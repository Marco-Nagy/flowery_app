import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/generic/presentation/view_model/generic_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/widgets/base/app_loader.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../view_model/generic_view_model_cubit.dart';
import '../widgets/grid_builder_widget.dart';
import '../widgets/tab_bar_widget.dart';

class CatalogGenericScreen extends StatelessWidget {
  final String resourceName;

  const CatalogGenericScreen({Key? key, required this.resourceName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return BlocProvider(
      create: (context) =>
      getIt.get<GenericViewModelCubit>()..doAction(getData(resourceName)),
      child: BlocBuilder<GenericViewModelCubit, GenericViewModelState>(
        builder: (context, state) {
          final cubit = context.read<GenericViewModelCubit>();

          scrollController.addListener(() {
            if (scrollController.position.pixels >=
                scrollController.position.maxScrollExtent &&
                !(state is GenericItemLoadedState)) {
              cubit.doAction(fetchNextPage());
            }
          });

          switch (state.runtimeType) {
            case GenericItemLoadedState:
              return AppLoader();
            case GenericItemErrorState:
              final errorState = state as GenericItemErrorState;
              return Center(child: Text(errorState.message.error!));

            case GenericItemSuccessState:
              final successState = state as GenericItemSuccessState;
              return DefaultTabController(
                length: cubit.items.length,
                child: Expanded(
                  child: Column(
                    children: [
                      tabBarWidget(
                        tabs: cubit.items
                            .map((category) => Tab(text: category))
                            .toList(),
                        onTap: (index) {
                          final selectedCategory = cubit.items.elementAt(index);
                          cubit.doAction(setCategory(selectedCategory));
                        },
                      ),
                      verticalSpacing(20),
                      Expanded(
                        child: GridBuilderWidget(
                          controller: scrollController,
                          cubit: cubit,
                          state: successState,
                        ),
                      ),
                    ],
                  ),
                ),
              );

            default:
              return AppLoader();

          }
        },
      ),
    );
  }
}
