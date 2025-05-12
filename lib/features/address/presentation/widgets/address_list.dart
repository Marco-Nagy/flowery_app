import 'package:animate_do/animate_do.dart';
import 'package:flowery_store/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_store/di/di.dart';
import 'package:flowery_store/features/address/presentation/view_model/address_action.dart';
import 'package:flowery_store/features/address/presentation/view_model/address_cubit.dart';
import 'package:flowery_store/features/address/presentation/view_model/address_states.dart';
import 'package:flowery_store/features/address/presentation/widgets/custom_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressList extends StatefulWidget {
  const AddressList({super.key});

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  AddressViewModel addressViewModel = getIt.get<AddressViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          addressViewModel..doAction(FetchSavedAddressesAction()),
      child: BlocBuilder<AddressViewModel, AddressStates>(
        builder: (context, state) {
          if (state is GetSavedAddressesLoadingState ||
              state is AddAddressViewModelLoading ||
              state is UpdateAddressLoadingState ||
              state is DeleteAddressLoadingState ) {
            return const AppLoader();
          } else if (state is GetSavedAddressesSuccessState) {
            return SizedBox(
              height: state.addresses.length * 120.h,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.addresses.length,
                itemBuilder: (context, index) {
                  return FadeInRight(
                      animate: true,
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 120 * (index + 1)),
                      child: CustomCardItem(
                        address: state.addresses[index],
                      ));
                },
              ),
            );
          } else if (state is DeleteAddressSuccessState) {
            return SizedBox(
              height: state.addresses.length * 120.h,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.addresses.length,
                itemBuilder: (context, index) {
                  return FadeInLeft(
                      animate: true,
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 120 * (index + 1)),
                      child: CustomCardItem(
                        address: state.addresses[index],
                      ));
                },
              ),
            );
          } else if (state is UpdateAddressSuccessState) {
            return SizedBox(
              height: state.addresses.length * 120.h,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.addresses.length,
                itemBuilder: (context, index) {
                  return FadeInRight(
                      animate: true,
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 120 * (index + 1)),
                      child: CustomCardItem(
                        address: state.addresses[index],
                      ));
                },
              ),
            );
          }

          return const AppLoader();
        },
      ),
    );
  }
}
