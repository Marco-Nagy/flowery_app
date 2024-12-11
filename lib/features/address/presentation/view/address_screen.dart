import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/snack_bar.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/features/address/presentation/widgets/build_city_area_widget.dart';
import 'package:flowery_e_commerce/features/address/presentation/widgets/build_text_field_widget.dart';
import 'package:flowery_e_commerce/features/address_details/domain/entities/request/add_address_request_entity.dart';
import 'package:flowery_e_commerce/features/address_details/presentation/viewModel/add_address_action.dart';
import 'package:flowery_e_commerce/features/address_details/presentation/viewModel/add_address_view_model_cubit.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late final TextEditingController addressController;
  late final TextEditingController phoneController;
  late final TextEditingController recipientController;
  late final TextEditingController cityController;
  late final TextEditingController areaController;

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController()..addListener(_checkFields);
    phoneController = TextEditingController()..addListener(_checkFields);
    recipientController = TextEditingController()..addListener(_checkFields);
    cityController = TextEditingController()..addListener(_checkFields);
    areaController = TextEditingController()..addListener(_checkFields);
  }

  @override
  void dispose() {
    addressController.dispose();
    phoneController.dispose();
    recipientController.dispose();
    cityController.dispose();
    areaController.dispose();
    super.dispose();
  }

  void _checkFields() {
    setState(() {
      isButtonEnabled = addressController.text.isNotEmpty &&
          phoneController.text.isNotEmpty &&
          recipientController.text.isNotEmpty &&
          cityController.text.isNotEmpty &&
          areaController.text.isNotEmpty;
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
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.all(5.sp),
                    width: 390.w,
                    height: 200.h,
                    child: Image.asset(Assets.imagesRectangle)),
                BuildTextFieldWidget(
                    hint: "Enter the address",
                    label: "Address",
                    controller: addressController),
                BuildTextFieldWidget(
                    hint: "Enter the phone number",
                    label: "Phone number",
                    controller: phoneController),
                BuildTextFieldWidget(
                    hint: "Enter the recipient name",
                    label: "Recipient name",
                    controller: recipientController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BuildCityAreaWidget(
                        label: "City",
                        hint: "Cairo",
                        controller: cityController),
                    BuildCityAreaWidget(
                        label: "Area",
                        hint: "October",
                        controller: areaController),
                  ],
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
                                    city: cityController.text.trim(),
                                    phone: phoneController.text.trim(),
                                  )),
                                );
                          }
                        : () {}, // Disabled if fields are not filled
                    color: isButtonEnabled
                        ? MyColors.baseColor
                        : MyColors.gray30, // Change color conditionally
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
                  msg: 'loading...',
                  context: context,
                  type: MessageTypeConst.help,
                  title: 'Loading');
              break;
            case AddAddressViewModelSuccess():
              aweSnackBar(
                  msg: 'success',
                  context: context,
                  type: MessageTypeConst.success,
                  title: 'success');
              break;
            case AddAddressViewModelError():
              aweSnackBar(
                  msg: state.message.error ?? "Something went wrong, try again",
                  context: context,
                  type: MessageTypeConst.failure,
                  title: 'Failure');
              break;
            default:
          }
        },
      ),
    );
  }
}
