import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/snack_bar.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/features/checkout/presentation/viewModel/checkout_base_action.dart';
import 'package:flowery_e_commerce/features/checkout/presentation/viewModel/checkout_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/localization/lang_keys.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckoutConsumer extends StatelessWidget {
  const CheckoutConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CheckoutViewModelCubit viewModelCubit = context.read<CheckoutViewModelCubit>();

    return  BlocConsumer<CheckoutViewModelCubit, CheckoutViewModelState>(
      listener: (context, state) async {
        switch (state) {
          case CheckoutCashSuccess():
            aweSnackBar(
                title:context.translate(LangKeys.success),
                msg: state.successMessage,
                context: context,
                type: MessageTypeConst.success);
            await context.pushNamed(AppRoutes.homeScreen);

          case CheckoutCreditSuccess():
        Uri url = Uri.parse(state.url);
        if(await launchUrl(url)) {
        await launchUrl(url,mode: LaunchMode.inAppBrowserView);
        }
          case CheckoutError():
            aweSnackBar(
                title: context.translate(LangKeys.error),
                msg: state.error.error!,
                context: context,
                type: MessageTypeConst.failure);
          case CheckoutViewModelInitial():
            break;
          case AddShippingAddress():
            break;
          case SelectPaymentOption():
            break;
          case CheckoutLoading():
            break;
        }
      },
      builder: (context, state) {
        return CurvedButton(
          title: context.translate(LangKeys.placeOrder),
          onTap: () async {
            if(viewModelCubit.selectedAddress<0) {
              aweSnackBar(
                  title: 'Warning',
                  msg: 'Please add a shipping address',
                  context: context,
                  type: MessageTypeConst.help);
              return;
            }else if(viewModelCubit.paymentOption.isEmpty){
              aweSnackBar(
                  title: 'Warning',
                  msg: 'Please select a payment option',
                  context: context,
                  type: MessageTypeConst.help);
              return;
            }else{
             await viewModelCubit.doAction(CheckoutAction());
            }
          },
          color: MyColors.baseColor,
        );
      },
    );
  }
}
