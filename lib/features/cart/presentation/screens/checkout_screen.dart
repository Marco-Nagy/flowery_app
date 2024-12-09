import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/cart_total_amount.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/check_out/address_card.dart';
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

  List<Map<String, String>> addresses = [
    {'title': 'Home', 'address': '2XVP+XC - Sheikh Zayed'},
    {'title': 'Office', 'address': '2XVP+XC - Sheikh Zayed'},
  ];

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final arriveDate =
        DateTime(now.year, now.month, now.day + 3, now.hour, now.minute);
    final formattedDate = DateFormat("dd MMM yyyy HH:mm a").format(arriveDate);
    final arriveMessage = 'Arrive by $formattedDate';
    return Scaffold(
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
              const Divider(height: 32),

              // Delivery Address Section
              const SectionTitle(title: 'Delivery address'),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  return AddressCard(
                    title: addresses[index]['title']!,
                    address: addresses[index]['address']!,
                    isSelected: index == 0, // Example: Select the first address
                  );
                },
              ),
              verticalSpacing(16),

              CurvedButton(
                title: ' + Add New',
                onTap: () {},
                color: MyColors.white,
                textColor: MyColors.baseColor,
                colorBorderSide: MyColors.baseColor,
              ),
              verticalSpacing(24),

              // Payment Method Section
              const PaymentWidget(),

              const GiftWidget(),

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
