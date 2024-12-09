import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/widgets/app_text_form_field.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/cart_total_amount.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/check_out/address_card.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/check_out/custom_gift_switch.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/check_out/payment_option.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/check_out/section_title.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  final CartEntity cart;

  const CheckoutScreen({super.key, required this.cart});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool isGift = false;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  List<Map<String, String>> addresses = [
    {'title': 'Home', 'address': '2XVP+XC - Sheikh Zayed'},
    {'title': 'Office', 'address': '2XVP+XC - Sheikh Zayed'},
  ];
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              const Row(
                children: [
                  Icon(Icons.access_time, color: Colors.black54),
                  SizedBox(width: 8),
                  Text('Instant, '),
                  Text(
                    'Arrive by 03 Sep 2024, 11:00 AM',
                    style: TextStyle(color: Colors.green),
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

              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.pink),
                label: const Text(
                  'Add new',
                  style: TextStyle(color: Colors.pink),
                ),
              ),
              const Divider(height: 32),

              // Payment Method Section
              const SectionTitle(title: 'Payment method'),
              const PaymentOption(title: 'Cash on delivery', isSelected: true),
              const PaymentOption(title: 'Credit card'),
              const Divider(height: 32),

              // Gift Option Section
              CustomGiftSwitch(
                value: isGift,

              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: isGift ? 150 : 0,
                child: isGift
                    ? Column(
                        children: [
                          AppTextFormField(
                            hintText: 'Name',
                            controller: _nameController,
                            labelText: 'Name',
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(height: 16),
                          AppTextFormField(
                            hintText: 'Phone number',
                            controller: _phoneController,
                            labelText: 'Phone number',
                             keyboardType: TextInputType.phone,
                          ),
                        ],
                      )
                    : Container(),
              ),
              const Divider(height: 32),

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
