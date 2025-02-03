import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_e_commerce/features/checkout/presentation/viewModel/checkout_base_action.dart';
import 'package:flowery_e_commerce/features/checkout/presentation/viewModel/checkout_view_model_cubit.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressCard extends StatelessWidget {
  final AddressesEntity address;
  final int index;
  const AddressCard({
    required this.address,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    CheckoutViewModelCubit viewModelCubit =
    context.read<CheckoutViewModelCubit>();
    return BlocBuilder<CheckoutViewModelCubit, CheckoutViewModelState>(
        builder: (context, state) {
      return InkWell(
        onTap: () {
          viewModelCubit.doAction(SelectAddressAction(address, index));
        },
        child: Card(
          color: MyColors.whiteBase,
          shape: RoundedRectangleBorder(
            side:  const BorderSide(
              color:
              // viewModelCubit.selectedIndex==index?MyColors.baseColor:
              MyColors.gray30,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            title: Row(
              children: [
                Icon(
              viewModelCubit.selectedAddress==index
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: MyColors.baseColor,
            ),
                horizontalSpacing(5),
            Text(address.street!,style:MyFonts.styleMedium500_16),
          ],),
            subtitle: Text('${address.city!} - ${address.street!}'),
            trailing: InkWell(
                onTap: () => context.pushNamed(AppRoutes.addressScreen),
                child: Image.asset(
                  Assets.imagesEditAddress,
                  height: 20,
                  width: 20,
                )),
          ),
        ),
      );
    });
  }
}
