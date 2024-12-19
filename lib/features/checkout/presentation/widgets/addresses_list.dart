import 'package:animate_do/animate_do.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_e_commerce/features/address/presentation/view_model/address_cubit.dart';
import 'package:flowery_e_commerce/features/address/presentation/view_model/address_states.dart';
import 'package:flowery_e_commerce/features/checkout/presentation/viewModel/checkout_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'address_card.dart';


class AddressesList extends StatefulWidget {
  AddressesList({Key? key}) : super(key: key);

  @override
  State<AddressesList> createState() => _AddressesListState();
}

class _AddressesListState extends State<AddressesList> {

  @override
  Widget build(BuildContext context) {
    CheckoutViewModelCubit viewModelCubit =
        context.read<CheckoutViewModelCubit>();
    return BlocBuilder<AddressViewModel, AddressStates>(
      builder: (context, state) {
        switch (state) {
          case GetSavedAddressesSuccessState():
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.addresses.length,
              itemBuilder: (context, index) {
                return FadeInRight(
                  animate: true,
                  curve: Curves.easeIn,
                  duration: Duration(milliseconds: 120 * (index + 1)),
                  child: AddressCard(
                    address: state.addresses[index],
                   index: index,
                  ),
                );
              },
            );

          case GetSavedAddressesLoadingState():
            return const AppLoader();
          case GetSavedAddressesInitialState():
          case GetSavedAddressesErrorState():
        }
        return Container();
      },
    );
  }
}
