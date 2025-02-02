import 'package:flowery_e_commerce/core/utils/widgets/app_text_form_field.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/switch_button_widget.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/lang_keys.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
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
      // Gift Option Section
      SwitchButtonWidget(
        value: isGift,
        text: context.translate(LangKeys.giftOption),
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
                      hintText: context.translate(LangKeys.name),
                      controller: _nameController,
                      labelText: context.translate(LangKeys.name),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 16),
                    AppTextFormField(
                      height: 50,
                      hintText: context.translate(LangKeys.phoneNumber),
                      controller: _phoneController,
                      labelText: context.translate(LangKeys.phoneNumber),
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
              )
                  : Container(),
            ),
      ),

    ],);
  }
}
