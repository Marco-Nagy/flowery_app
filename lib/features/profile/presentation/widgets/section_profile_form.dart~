import 'package:auto_size_text/auto_size_text.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/snack_bar.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/features/profile/presentation/viewModel/profile_actions.dart';
import 'package:flowery_e_commerce/features/profile/presentation/viewModel/profile_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/profile/presentation/widgets/profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../../../../di/di.dart';
import 'custom_section_gender.dart';

class SectionProfileForm extends StatefulWidget {
  const SectionProfileForm({super.key});

  @override
  State<SectionProfileForm> createState() => _SectionProfileFormState();
}

class _SectionProfileFormState extends State<SectionProfileForm> {
  late final ProfileViewModelCubit profileViewModel;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController phoneNumberController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isModified = false;

  String? oldFirstName;
  String? oldLastName;
  String? oldEmail;
  String? oldPhone;
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneNumberController = TextEditingController();

    profileViewModel = getIt.get<ProfileViewModelCubit>();
    profileViewModel.doAction(GetLoggedUserData());

    // Add listeners to detect changes
    firstNameController.addListener(_checkIfModified);
    lastNameController.addListener(_checkIfModified);
    emailController.addListener(_checkIfModified);
    phoneNumberController.addListener(_checkIfModified);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void _checkIfModified() {
    setState(() {
      isModified = firstNameController.text != oldFirstName ||
          lastNameController.text != oldLastName ||
          emailController.text != oldEmail ||
          phoneNumberController.text != oldPhone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileViewModelCubit>(
      create: (context) => profileViewModel,
      child: BlocConsumer<ProfileViewModelCubit, ProfileViewModelState>(
        listener: (context, state) {
          switch (state) {
            case GetLoggedUserDataSuccess():
              oldFirstName = state.data.user?.firstName ?? "";
              oldLastName = state.data.user?.lastName ?? "";
              oldEmail = state.data.user?.email ?? "";
              oldPhone = state.data.user?.phone ?? "";
              selectedGender = state.data.user?.gender ?? "";

              firstNameController.text = oldFirstName!;
              lastNameController.text = oldLastName!;
              emailController.text = oldEmail!;
              phoneNumberController.text = oldPhone!;

              setState(() {
                isModified = false;
              });
              break;
            case GetLoggedUserDataError():
              aweSnackBar(
                  msg: state.error.toString(),
                  context: context,
                  type: MessageTypeConst.failure,
                  title: 'Error');
              break;
            case EditProfileLoading():
              aweSnackBar(
                  msg: 'Loading...',
                  context: context,
                  type: MessageTypeConst.help,
                  title: 'Loading');
              break;
            case EditProfileSuccess():
              aweSnackBar(
                  msg: 'Profile updated successfully',
                  context: context,
                  type: MessageTypeConst.success,
                  title: 'Success');

              setState(() {
                oldFirstName = firstNameController.text;
                oldLastName = lastNameController.text;
                oldEmail = emailController.text;
                oldPhone = phoneNumberController.text;
                selectedGender = state.data.user?.gender ?? "";
                isModified = false;
              });
              break;
            case EditProfileError():
              aweSnackBar(
                  msg: state.error.error.toString(),
                  context: context,
                  type: MessageTypeConst.failure,
                  title: 'Error');
              break;
            default:
              break;
          }
        },
        builder: (context, state) {
          if (state is GetLoggedUserDataSuccess) {
            selectedGender = state.data.user?.gender ?? "";
          }
          return Column(
            children: [
              ProfileForm(
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                emailController: emailController,
                passwordController: passwordController,
                phoneNumberController: phoneNumberController,
                formKey: formKey,
              ),
              const SizedBox(height: 24),
              CustomSectionGender(
                selectedGender: selectedGender ?? "",
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                    _checkIfModified();
                  });
                },
              ),
              CurvedButton(
                title: "Update",
                color: MyColors.baseColor,
                onTap: isModified
                    ? () {
                        if (formKey.currentState!.validate()) {
                          Map<String, dynamic> profileData = {
                            'firstName': firstNameController.text,
                            'lastName': lastNameController.text,
                            'email': emailController.text,
                            'phone': phoneNumberController.text,
                          };
                          profileViewModel.doAction(EditProfile(profileData));
                        }
                      }
                    : () {},
              ),
            ],
          );
        },
      ),
    );
  }
}
