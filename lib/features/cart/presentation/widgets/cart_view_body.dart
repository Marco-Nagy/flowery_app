import 'package:animate_do/animate_do.dart';
import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/cart_item.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/cart_total_amount.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/widgets/location%20_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../di/di.dart';
import '../../../auth/data/data_sources/contracts/offline_data_source.dart';

class CartViewBody extends StatelessWidget {
   CartViewBody({super.key, required this.cart});
  final CartEntity cart;

  final OfflineDataSource offlineDataSource = getIt<OfflineDataSource>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        appBarTxt: '${AppLocalizations.of(context)!.cart} (${cart.numOfCartItems} ${AppLocalizations.of(context)!.items})',
        showArrow: true,
        context: context,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15.sp),
            child:LocationWidget(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.cartList.length,
              itemBuilder: (context, index) {
                return FadeInLeft(
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 100 * (index + 5)),
                  child: CartItem(product: cart.cartList[index]),
                );
              },
            ),
          ),
          CartTotalAmount(cart: cart),
          verticalSpacing(16),
          CurvedButton(
            title: AppLocalizations.of(context)!.checkout,
            onTap: () => context.pushNamed(AppRoutes.checkoutScreen, arguments: cart),
            color: MyColors.baseColor,
          ),
          verticalSpacing(16),
        ],
      ),
    );
  }
}

