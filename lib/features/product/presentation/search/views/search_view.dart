import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_base_action.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/cart_icon_badge.dart';
import 'package:flowery_e_commerce/features/generic/presentation/generic_item_by_product/viewModel/generic_item_action.dart';
import 'package:flowery_e_commerce/features/generic/presentation/generic_item_by_product/viewModel/generic_item_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/generic/presentation/generic_item_by_product/widget/generic_builder_widget.dart';
import 'package:flowery_e_commerce/features/product/presentation/search/viewModel/search_view_model_cubit.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../viewModel/search_action.dart';
import '../widgets/no_products_found_widget.dart';
import '../widgets/search_bar_section.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late Function(GlobalKey) addToCartAnimation;
  final cartKey = GlobalKey<CartIconKey>();
  CartViewModelCubit cartViewModelCubit = getIt.get<CartViewModelCubit>();

  void listClick(GlobalKey widgetKey) async {
    await addToCartAnimation(widgetKey);
    // cartViewModelCubit.updateCartCount();
    await cartViewModelCubit.cartKey.currentState!
        .runCartAnimation(cartViewModelCubit.cartQuantityItems.toString());
    cartViewModelCubit.doAction(GetUserCartDataAction());
  }

  @override
  void initState() {
    super.initState();
    // Initialize the cart count to 20
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      cartViewModelCubit.doAction(GetUserCartDataAction());
      cartViewModelCubit.cartKey.currentState!
          .runCartAnimation(cartViewModelCubit.cartQuantityItems.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              cartViewModelCubit..doAction(GetUserCartDataAction()),
        ),
        BlocProvider(
          create: (context) => getIt.get<GenericItemViewModelCubit>()
            ..doAction(GetItemAction('categories'))
            ..doAction(GetProductAction()),
        ),
      ],
      child: AddToCartAnimation(
        cartKey: cartViewModelCubit.cartKey,
        height: 30,
        width: 30,
        opacity: 0.85,
        dragAnimation: const DragToCartAnimationOptions(
          rotation: true,
        ),
        jumpAnimation: const JumpAnimationOptions(),
        createAddToCartAnimation: (runAddToCartAnimation) {
          addToCartAnimation = runAddToCartAnimation;

          // return (GlobalKey) => addToCartAnimation(GlobalKey(cartKey));
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFffffff),
          body: Padding(
            padding: EdgeInsets.only(top: 50.h, left: 16.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {

                          Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: MyColors.black,
                      ),
                    ),
                    Expanded(
                      child: SearchBarSection(
                        onChanged: (value) {
                          context
                              .read<SearchViewModelCubit>()
                              .doAction(SearchProductAction(keyword: value));
                        },
                      ),
                    ),
                    horizontalSpacing(12),
                    CartIconBadge(
                      cartKey: cartViewModelCubit.cartKey,
                    ),
                  ],
                ),
                verticalSpacing(16.h),
                Expanded(
                  child:
                      BlocBuilder<SearchViewModelCubit, SearchViewModelState>(
                    builder: (context, state) {
                      switch (state) {
                        case SearchViewModelInitial():
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Image.asset(Assets.imagesAnimatedSearch),
                            ),
                          );
                        case SearchViewModelLoading():
                          return const Center(
                            child: AppLoader(),
                          );
                        case SearchViewModelSuccess():
                          if (state.products.products.isEmpty) {
                            return const Expanded(child: NoProductsFound());
                          }
                          return GenericBuilderWidget(
                            filteredProducts: state.products.products,
                            onClick: (widgetKey) => listClick(widgetKey),
                          );
                        case SearchViewModelFailure():
                          return Center(
                            child: Text(
                              state.message.toString(),
                              style: const TextStyle(color: Colors.red),
                            ),
                          );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
