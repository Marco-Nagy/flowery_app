import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/cart_total_amount.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/check_out/addresses_list.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/check_out/gift_widget.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/check_out/payment_widget.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/check_out/section_title.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckoutScreen extends StatefulWidget {
  final CartEntity cart;

  const CheckoutScreen({super.key, required this.cart});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  ValueNotifier<String> selectedValueNotifier = ValueNotifier('Credit card');

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final arriveDate =
        DateTime(now.year, now.month, now.day + 3, now.hour, now.minute);
    final formattedDate = DateFormat("dd MMM yyyy HH:mm a").format(arriveDate);
    final arriveMessage = 'Arrive by $formattedDate';
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: customAppBar(
        appBarTxt: 'Checkout',
        showArrow: true,
        context: context,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Delivery Time Section
              const SectionTitle(title: 'Delivery time', action: 'Schedule'),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.black54),
                  const SizedBox(width: 8),
                   Text('Instant, ',style:MyFonts.styleMedium500_14,),
                  Text(
                    ' $arriveMessage',
                    style: const TextStyle(color: Colors.green),
                  ),
                ],
              ),
              const Divider(height: 60,thickness: 24,color: MyColors.white60,),

              // Delivery Address Section
              const SectionTitle(title: 'Delivery address'),
              const SizedBox(height: 8),
              AddressesList(),
              verticalSpacing(16),

              CurvedButton(
                title: ' + Add New',
                onTap: () => context.pushNamed(AppRoutes.addressScreen),
                color: MyColors.white,
                textColor: MyColors.baseColor,
                colorBorderSide: MyColors.gray30,
              ),
              verticalSpacing(24),

              // Payment Method Section
              const PaymentWidget(),
              const Divider(height: 60,thickness: 24,color: MyColors.white60,),

              const GiftWidget(),
               const Divider(height: 60,thickness: 24,color: MyColors.white60,),

              CartTotalAmount(cart: widget.cart),
              verticalSpacing(16),
              CurvedButton(
                title: 'Place Order',
                onTap: () {},
                color: MyColors.baseColor,
              ),
              verticalSpacing(16),
            ],
          ),
        ),
      ),
    );
  }
}
