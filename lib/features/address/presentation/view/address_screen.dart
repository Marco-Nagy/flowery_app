import 'package:country_state_city/models/city.dart';
import 'package:country_state_city/models/country.dart';
import 'package:flowery_store/core/localization/lang_keys.dart';
import 'package:flowery_store/core/styles/colors/my_colors.dart';
import 'package:flowery_store/core/utils/extension/media_query_values.dart';
import 'package:flowery_store/core/utils/widgets/base/snack_bar.dart';
import 'package:flowery_store/core/utils/widgets/spacing.dart';
import 'package:flowery_store/features/address/domain/entities/request/add_address_request_entity.dart';
import 'package:flowery_store/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_store/features/address/presentation/view_model/address_action.dart';
import 'package:flowery_store/features/address/presentation/view_model/address_cubit.dart';
import 'package:flowery_store/features/address/presentation/view_model/address_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/custom_appbar.dart';
import '../widgets/address_image_picker.dart';
import '../widgets/address_input_fields.dart';
import '../widgets/address_save_button.dart';

class AddressScreen extends StatefulWidget {
  final AddressesEntity address;

  const AddressScreen({super.key, required this.address});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController? usernameController;
  TextEditingController? phoneController;
  TextEditingController? streetController;
  TextEditingController? cityController;
  TextEditingController? longitudeController;
  TextEditingController? latitudeController;

  String? selectedCountry;
  String? selectedCity;

  List<Country> countryList = [];
  List<City> cityList = [];

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    if (widget.address.id != null) {
      setState(() {
        usernameController?.text = widget.address.username ?? '';
        phoneController?.text = widget.address.phone ?? '';
        streetController?.text = widget.address.street ?? '';
        cityController?.text = widget.address.city ?? '';
        longitudeController?.text = widget.address.long ?? '';
        latitudeController?.text = widget.address.lat ?? '';
      });

    }else{
      setState(() {
        usernameController?.text = '';
        phoneController?.text = '';
        streetController?.text = '';
        cityController?.text = '';
        longitudeController?.text = '';
        latitudeController?.text = '';
      });
      }

    usernameController = TextEditingController()..addListener(_checkFields);
    phoneController = TextEditingController()..addListener(_checkFields);
    streetController = TextEditingController()..addListener(_checkFields);
    cityController = TextEditingController()..addListener(_checkFields);
    longitudeController = TextEditingController()..addListener(_checkFields);
    latitudeController = TextEditingController()..addListener(_checkFields);
    context.read<AddressViewModel>()..doAction(FetchCountriesAction());
  }

  @override
  void dispose() {
    streetController?.dispose();
    phoneController?.dispose();
    longitudeController?.dispose();
    latitudeController?.dispose();
    usernameController?.dispose();
    cityController?.dispose();
    super.dispose();
  }

  void _checkFields() {
    setState(() {
      isButtonEnabled = streetController!.text.isNotEmpty &&
          phoneController!.text.isNotEmpty &&
          usernameController!.text.isNotEmpty &&
          cityController!.text.isNotEmpty &&
          latitudeController!.text.isNotEmpty &&
          longitudeController!.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: customAppBar(
        appBarTxt: context.translate(LangKeys.address),
        context: context,
        showArrow: true,
      ),
      body: BlocConsumer<AddressViewModel, AddressStates>(
        builder: (context, state) {
          if (state is AddAddressViewModelFetchedCountries) {
            countryList = state.countries;
          } else if (state is AddAddressViewModelFetchedCities) {
            cityList = state.cities;
          }
          if (widget.address.id != null) {
              usernameController!.text = widget.address.username ?? '';
              phoneController!.text = widget.address.phone ?? '';
              streetController?.text = widget.address.street ?? '';
              cityController?.text = widget.address.city ?? '';
              longitudeController?.text = widget.address.long ?? '';
              latitudeController?.text = widget.address.lat ?? '';


          }

          return SingleChildScrollView(
            child: Column(
              children: [
                AddressImagePickerWidget(
                    streetController: streetController ?? TextEditingController(),
                    cityController: cityController ?? TextEditingController(),
                    longitudeController: longitudeController ?? TextEditingController(),
                    latitudeController: latitudeController ?? TextEditingController(),),
                AddressInputFieldsWidget(
                  usernameController: usernameController ?? TextEditingController(),
                  phoneController: phoneController  ?? TextEditingController(),
                  streetController: streetController ?? TextEditingController(),
                  cityController: cityController ?? TextEditingController(),
                  latitudeController: latitudeController  ?? TextEditingController(),
                  longitudeController: longitudeController ?? TextEditingController(),
                ),
                AddressSaveButton(
                  isButtonEnabled: isButtonEnabled,
                  onTap: () {
                    context.read<AddressViewModel>().doAction(
                          AddAddressSubmitAction(
                            AddAddressRequestEntity(
                              street: streetController?.text.trim(),
                              city: cityController?.text.trim(),
                              phone: phoneController?.text.trim(),
                              lat: latitudeController?.text.trim(),
                              long: longitudeController?.text.trim(),
                              username: usernameController?.text.trim(),
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
              msg: context.translate(LangKeys.loading),
              context: context,
              type: MessageTypeConst.help,
              title: context.translate(LangKeys.loading),
            );
          } else if (state is AddAddressViewModelSuccess) {
            aweSnackBar(
              msg: context.translate(LangKeys.addressSavedSuccessfully),
              context: context,
              type: MessageTypeConst.success,
              title: context.translate(LangKeys.success),
            );
          } else if (state is AddAddressViewModelError) {
            aweSnackBar(
              msg: state.message.error ?? context.translate(LangKeys.wrong),
              context: context,
              type: MessageTypeConst.failure,
              title: context.translate(LangKeys.failure),
            );
          }
        },
      ),
    );
  }
}
