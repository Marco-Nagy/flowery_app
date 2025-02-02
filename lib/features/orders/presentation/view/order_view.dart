import 'package:flowery_e_commerce/features/generic/presentation/widgets/tab_bar_widget.dart';
import 'package:flowery_e_commerce/features/orders/presentation/widget/order_list_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/lang_keys.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/custom_appbar.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        appBarTxt: context.translate(LangKeys.myOrders),
        context: context,
        showArrow: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            tabBarWidget(
              tabs: [
                Tab(text: context.translate(LangKeys.active)),
                Tab(text: context.translate(LangKeys.completed)),
              ],
              onTap: (index) {},
              tabAlignment: TabAlignment.center,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: TabBarView(
                  children: [
                    ListOrderWidget(
                      // title: successState.orders![0].state.toString(),
                      // price: successState.orders![0].orderItems![0].product!.price.toString(),
                      // orderNumber:successState.orders![0].orderNumber!,
                      // imageUrl: successState.orders![0].orderItems![0].product!.imgCover!,
                      textButton: context.translate(LangKeys.trackOrder),
                    ),
                    ListOrderWidget(
                      textButton: context.translate(LangKeys.reorder),
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
