import 'package:flowery_e_commerce/core/utils/widgets/app_text_form_field.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/switch_button_widget.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flutter/material.dart';

class GiftWidget extends StatefulWidget {

  const GiftWidget({super.key});

  @override
  State<GiftWidget> createState() => _GiftWidgetState();
}

class _GiftWidgetState extends State<GiftWidget> {
  ValueNotifier<bool> isGift = ValueNotifier(false);

  late TextEditingController _nameController;
  late TextEditingController _phoneController;
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
    return Column(children: [
      const Divider(height: 32),
      // Gift Option Section
      SwitchButtonWidget(
        value: isGift,
        text: 'It is a gift',
      ),
      verticalSpacing(16),
      ValueListenableBuilder(
        valueListenable: isGift,
        builder: (BuildContext context, value, Widget? child) =>
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: value ? null : 0,
              constraints:
              const BoxConstraints(minHeight: 0, maxHeight: 150),
              child: value
                  ? SingleChildScrollView(
                child: Column(
                  children: [
                    AppTextFormField(
                      height: 50,
                      hintText: 'Name',
                      controller: _nameController,
                      labelText: 'Name',
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 16),
                    AppTextFormField(
                      height: 50,
                      hintText: 'Phone number',
                      controller: _phoneController,
                      labelText: 'Phone number',
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
              )
                  : Container(),
            ),
      ),

      const Divider(height: 32),
    ],);
  }
}
