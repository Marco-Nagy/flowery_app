import 'package:animate_do/animate_do.dart';
import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/cart_item.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/cart_total_amount.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/services/shared_preference/location_helper.dart';
import '../../../../di/di.dart';
import '../../../auth/data/data_sources/contracts/offline_data_source.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key, required this.cart});
  final CartEntity cart;

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  final LocationHelper _locationHelper = LocationHelper();
  final OfflineDataSource offlineDataSource = getIt<OfflineDataSource>();

  String? _locationAddress;

  @override
  void initState() {
    super.initState();
    _loadLocation();
  }

  Future<void> _loadLocation() async {
    String? savedLocation = await _locationHelper.getSavedLocation();
    setState(() {
      _locationAddress = savedLocation ?? AppLocalizations.of(context)!.no_location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        appBarTxt: '${AppLocalizations.of(context)!.cart} (${widget.cart.numOfCartItems} ${AppLocalizations.of(context)!.items})',
        showArrow: true,
        context: context,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15.sp),
            child: Row(
              children: [
                Image.asset(
                  Assets.imagesLocationOn,
                  height: 20.h,
                  width: 20.w,
                ),
                SizedBox(width: 8.w),
                Text(
                  _locationAddress ?? AppLocalizations.of(context)!.no_location,
                  style: MyFonts.styleMedium500_14.copyWith(color: MyColors.blackBase ,overflow: TextOverflow.ellipsis),
                ),
                SizedBox(width: 8.w),
                Image.asset(
                  Assets.imagesArrowDownIos,
                  height: 16.h,
                  width: 16.w,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.cart.cartList.length,
              itemBuilder: (context, index) {
                return FadeInLeft(
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 100 * (index + 5)),
                  child: CartItem(product: widget.cart.cartList[index]),
                );
              },
            ),
          ),
          CartTotalAmount(cart: widget.cart),
          verticalSpacing(16),
          CurvedButton(
            title: AppLocalizations.of(context)!.checkout,
            onTap: () => context.pushNamed(AppRoutes.checkoutScreen, arguments: widget.cart),
            color: MyColors.baseColor,
          ),
          verticalSpacing(16),
        ],
      ),
    );
  }
}

