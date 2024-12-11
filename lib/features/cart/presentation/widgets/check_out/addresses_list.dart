import 'package:flowery_e_commerce/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/address/presentation/view_model/address_cubit.dart';
import 'package:flowery_e_commerce/features/address/presentation/view_model/address_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'address_card.dart';

class AddressesList extends StatefulWidget {
  AddressesList({Key? key}) : super(key: key);
  late int selectedIndex = -1;

  @override
  State<AddressesList> createState() => _AddressesListState();
}

class _AddressesListState extends State<AddressesList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AddressViewModel>()..getSavedAddresses(),
      child: BlocBuilder<AddressViewModel, AddressStates>(
        builder: (context, state) {
          switch (state) {
            case GetSavedAddressesSuccessState():
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.addresses.length,
                itemBuilder: (context, index) {
                  return AddressCard(
                    title: state.addresses[index].street!,
                    address:
                        '${state.addresses[index].city} - ${state.addresses[index].street}',
                    isSelected: index == widget.selectedIndex,
                    onTap: () {
                      setState(() {
                        widget.selectedIndex = index;
                      });
                    },
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
      ),
    );
  }
}
