import 'package:country_state_city/models/city.dart';
import 'package:country_state_city/models/country.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/snack_bar.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/features/address_details/domain/entities/request/add_address_request_entity.dart';
import 'package:flowery_e_commerce/features/address_details/presentation/viewModel/add_address_action.dart';
import 'package:flowery_e_commerce/features/address_details/presentation/viewModel/add_address_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/custom_appbar.dart';
import '../widgets/address_image_picker.dart';
import '../widgets/address_input_fields.dart';
import '../widgets/address_save_button.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late final TextEditingController usernameController;
  late final TextEditingController phoneController;
  late final TextEditingController streetController;
  late final TextEditingController cityController;
  late final TextEditingController longitudeController;
  late final TextEditingController latitudeController;

  String? selectedCountry;
  String? selectedCity;

  List<Country> countryList = [];
  List<City> cityList = [];

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController()..addListener(_checkFields);
    phoneController = TextEditingController()..addListener(_checkFields);
    streetController = TextEditingController()..addListener(_checkFields);
    cityController = TextEditingController()..addListener(_checkFields);
    longitudeController = TextEditingController()..addListener(_checkFields);
    latitudeController = TextEditingController()..addListener(_checkFields);
    context.read<AddAddressViewModelCubit>().doAction(FetchCountriesAction());
  }

  @override
  void dispose() {
    streetController.dispose();
    phoneController.dispose();
    longitudeController.dispose();
    latitudeController.dispose();
    usernameController.dispose();
    cityController.dispose();
    super.dispose();
  }

  void _checkFields() {
    setState(() {
      isButtonEnabled = streetController.text.isNotEmpty &&
          phoneController.text.isNotEmpty &&
          usernameController.text.isNotEmpty &&
          cityController.text.isNotEmpty &&
          latitudeController.text.isNotEmpty &&
          longitudeController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: customAppBar(
        appBarTxt: AppLocalizations.of(context)!.address,
        context: context,
        showArrow: true,
      ),
      body: BlocConsumer<AddAddressViewModelCubit, AddAddressViewModelState>(
        builder: (context, state) {
          if (state is AddAddressViewModelFetchedCountries) {
            countryList = state.countries;
          } else if (state is AddAddressViewModelFetchedCities) {
            cityList = state.cities;
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                AddressImagePickerWidget(
                    streetController: streetController,
                    cityController: cityController,
                    longitudeController: longitudeController,
                    latitudeController: latitudeController),
                AddressInputFieldsWidget(
                  usernameController: usernameController,
                  phoneController: phoneController,
                  streetController: streetController,
                  cityController: cityController,
                  latitudeController: latitudeController,
                  longitudeController: longitudeController,
                ),
                AddressSaveButton(
                  isButtonEnabled: isButtonEnabled,
                  onTap: () {
                    context.read<AddAddressViewModelCubit>().doAction(
                          AddAddressSubmitAction(
                            AddAddressRequestEntity(
                              street: streetController.text.trim(),
                              city: cityController.text.trim(),
                              phone: phoneController.text.trim(),
                              lat: latitudeController.text.trim(),
                              long: longitudeController.text.trim(),
                              username: usernameController.text.trim(),
                            ),
                          ),
                        );
                  },
                ),
                verticalSpacing(16.h),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state is AddAddressViewModelLoading) {
            aweSnackBar(
              msg: AppLocalizations.of(context)!.loading,
              context: context,
              type: MessageTypeConst.help,
              title: AppLocalizations.of(context)!.loading,
            );
          } else if (state is AddAddressViewModelSuccess) {
            aweSnackBar(
              msg: AppLocalizations.of(context)!.address_saved_successfully,
              context: context,
              type: MessageTypeConst.success,
              title: AppLocalizations.of(context)!.success,
            );
          } else if (state is AddAddressViewModelError) {
            aweSnackBar(
              msg: state.message.error ?? AppLocalizations.of(context)!.wrong,
              context: context,
              type: MessageTypeConst.failure,
              title: AppLocalizations.of(context)!.failure,
            );
          }
        },
      ),
    );
  }
}
