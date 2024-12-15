import 'package:flowery_e_commerce/features/generic/presentation/widgets/tab_bar_widget.dart';
import 'package:flowery_e_commerce/features/orders/presentation/widget/order_list_widget.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/widgets/custom_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        appBarTxt: AppLocalizations.of(context)!.my_orders,
        context: context,
        showArrow: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            tabBarWidget(tabs: [
              Tab(text: AppLocalizations.of(context)!.active),
              Tab(text: AppLocalizations.of(context)!.completed),
            ], onTap: (index) {},
            tabAlignment: TabAlignment.center,),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: TabBarView(
                  children: [
                    ListOrderWidget(
                      title: 'Red roses',
                      price: 'EGP 600',
                      orderNumber: 'Order number# 123456',
                      imageUrl: Assets.imagesFlower,
                      textButton: AppLocalizations.of(context)!.track_order,
                      itemCount: 2,
                    ),
                    ListOrderWidget(
                      title: 'Red roses',
                      price: 'EGP 600',
                      orderNumber: 'Order number# 123456',
                      imageUrl: Assets.imagesFlower,
                      textButton: AppLocalizations.of(context)!.reorder,
                      itemCount: 2, // Adjust item count as needed
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
