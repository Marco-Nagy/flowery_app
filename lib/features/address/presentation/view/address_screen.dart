import 'package:country_state_city/models/city.dart';
import 'package:country_state_city/models/country.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/snack_bar.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/features/address_details/domain/entities/request/add_address_request_entity.dart';
import 'package:flowery_e_commerce/features/address_details/presentation/viewModel/add_address_action.dart';
import 'package:flowery_e_commerce/features/address_details/presentation/viewModel/add_address_view_model_cubit.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/widgets/custom_appbar.dart';
import '../widgets/build_dropdown_field_widget.dart';
import '../widgets/build_text_field_widget.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late final TextEditingController addressController;
  late final TextEditingController phoneController;
  late final TextEditingController recipientController;

  String? selectedCountry;
  String? selectedCity;

  List<Country> countryList = [];
  List<City> cityList = [];

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController()..addListener(_checkFields);
    phoneController = TextEditingController()..addListener(_checkFields);
    recipientController = TextEditingController()..addListener(_checkFields);
    context.read<AddAddressViewModelCubit>().doAction(FetchCountriesAction());
  }

  @override
  void dispose() {
    addressController.dispose();
    phoneController.dispose();
    recipientController.dispose();
    super.dispose();
  }

  void _checkFields() {
    setState(() {
      isButtonEnabled = addressController.text.isNotEmpty &&
          phoneController.text.isNotEmpty &&
          recipientController.text.isNotEmpty &&
          selectedCountry != null &&
          selectedCity != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        appBarTxt: 'Address',
        context: context,
        showArrow: true,
      ),
      body: BlocConsumer<AddAddressViewModelCubit, AddAddressViewModelState>(
        builder: (context, state) {
          switch (state) {
            case AddAddressViewModelFetchedCountries():
              countryList = state.countries;
              break;
            case AddAddressViewModelFetchedCities():
              cityList = state.cities;
              break;
            default:
              break;
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10.h),
                  width: 390.w,
                  height: 200.h,
                  child: Image.asset(Assets.imagesRectangle, fit: BoxFit.cover),
                ),
                BuildTextFieldWidget(
                  hint: "Enter the address",
                  label: "Address",
                  controller: addressController,
                ),
                SizedBox(height: 10.h),
                BuildTextFieldWidget(
                  hint: "Enter the phone number",
                  label: "Phone number",
                  controller: phoneController,
                ),
                SizedBox(height: 10.h),
                BuildTextFieldWidget(
                  hint: "Enter the recipient name",
                  label: "Recipient name",
                  controller: recipientController,
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.r),
                  child: Row(
                    children: [
                      Expanded(
                        child: BuildDropdownFieldWidget(
                          hint: "Select Country",
                          label: "Country",
                          items: countryList,
                          selectedValue: selectedCountry,
                          onChanged: (value) {
                            setState(() {
                              selectedCountry = value;
                              cityList
                                  .clear(); // Clear city list when country changes
                              _checkFields();
                              context.read<AddAddressViewModelCubit>().doAction(
                                    FetchCitiesAction(
                                      countryList
                                          .firstWhere((item) => item.name == value)
                                          .isoCode,
                                    ),
                                  );
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 10.h),
                      Expanded(
                        child: BuildDropdownFieldWidget(
                          hint: "Select City",
                          label: "City",
                          items: cityList,
                          selectedValue: selectedCity,
                          onChanged: (value) {
                            setState(() {
                              selectedCity = value;
                              _checkFields();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: 340.w,
                  height: 65.h,
                  child: CurvedButton(
                    title: 'Save address',
                    onTap: isButtonEnabled
                        ? () {
                            context.read<AddAddressViewModelCubit>().doAction(
                                  AddAddressSubmitAction(
                                    AddAddressRequestEntity(
                                      street: addressController.text.trim(),
                                      city: selectedCity,
                                      phone: phoneController.text.trim(),
                                    ),
                                  ),
                                );
                          }
                        : () {},
                    color:
                        isButtonEnabled ? MyColors.baseColor : MyColors.gray30,
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          switch (state) {
            case AddAddressViewModelLoading():
              aweSnackBar(
                msg: 'Loading...',
                context: context,
                type: MessageTypeConst.help,
                title: 'Loading',
              );
              break;
            case AddAddressViewModelSuccess():
              aweSnackBar(
                msg: 'Address saved successfully!',
                context: context,
                type: MessageTypeConst.success,
                title: 'Success',
              );
              break;
            case AddAddressViewModelError():
              aweSnackBar(
                msg: state.message.error ?? "Something went wrong, try again",
                context: context,
                type: MessageTypeConst.failure,
                title: 'Failure',
              );
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
