import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/core/utils/widgets/app_text_form_field.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/request/verify_reset_code_request_entity.dart';
import 'package:flowery_e_commerce/features/auth/presentation/forget_password/ViewModel/forget_password_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../ViewModel/forget_password_base_actions.dart';
 // Your custom text form field

class VerificationCode extends HookWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    // Use flutter_hooks to create TextEditingControllers
    final pinControllers = List.generate(6, (_) => useTextEditingController());

    String fullCode = context.read<ForgetPasswordViewModelCubit>().fullCode;

    // Method to concatenate the code
    void updateFullCode() {
      fullCode = pinControllers.map((controller) => controller.text).join();
    }

   void handleOnChange(value, index) {
      // Move focus forward when the current field is filled
      if (value.length == 1 && index < 5) {
        FocusScope.of(context).nextFocus();
      }

      // Move focus backward when deleting a character
      if (value.isEmpty && index > 0) {
        FocusScope.of(context).previousFocus();
        pinControllers[index].clear();
        updateFullCode();
        debugPrint('full Code(-) ==>> $fullCode');
      }

      // Update the full code when the last field is filled
      if (index == 5) {
        updateFullCode();
        context.pushReplacementNamed(AppRoutes.resetPassWord);
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: AppTextFormField(
              maxLength: 1,
              autofocus: index == 0,
              // Autofocus only on the first field
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],

              onChanged: (value) async {
                handleOnChange(value, index);
                if (fullCode.length == 6) {
                  context.read<ForgetPasswordViewModelCubit>().doAction(
                      VerifyResetCodeAction(
                          VerifyResetCodeRequestEntity(resetCode: fullCode)));
                }
              },
              controller: pinControllers[index],
              hintText: '',
              labelText: '',
            ),
          ),
        );
      }),
    );
  }
}
