import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/features/profile/presentation/viewModel/profile_actions.dart';
import 'package:flowery_e_commerce/features/profile/presentation/viewModel/profile_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/profile/presentation/widgets/profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/di.dart';

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

  String? oldUsername;
  String? oldFirstName;
  String? oldLastName;
  String? oldEmail;
  String? oldPhone;

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
      // Check if any field has been modified compared to the old values
      firstNameController.text != oldFirstName ||
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
          if (state is GetLoggedUserDataSuccess) {
            oldFirstName = state.data.user?.firstName ?? "";
            oldLastName = state.data.user?.lastName ?? "";
            oldEmail = state.data.user?.email ?? "";
            oldPhone = state.data.user?.phone ?? "";

            firstNameController.text = oldFirstName!;
            lastNameController.text = oldLastName!;
            emailController.text = oldEmail!;
            phoneNumberController.text = oldPhone!;

            // Reset isModified state after successful data load
            setState(() {
              isModified = false;
            });
          } else if (state is GetLoggedUserDataError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.error}")),
            );
          }
        },
        builder: (context, state) {
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
              const SizedBox(height: 30),
              GestureDetector(
                onTap: isModified
                    ? () {
                        if (formKey.currentState!.validate()) {
                          Map<String, dynamic> profileData = {
                            'firstName': firstNameController.text,
                            'lastName': lastNameController.text,
                            'email': emailController.text,
                            'phone': phoneNumberController.text,
                          };
                          // profileViewModel.doAction(EditProfile(
                          //   context: context,
                          //   profileData: profileData,
                          // ));
                        }
                      }
                    : null,
                child: CurvedButton(
                    title: "Update",
                    color: MyColors.baseColor,
                    onTap: () {
                      // if (formKey.currentState!.validate()) {
                      //   Map<String, dynamic> profileData = {
                      //     'username': usernameController.text,
                      //     'firstName': firstNameController.text,
                      //     'lastName': lastNameController.text,
                      //     'email': emailController.text,
                      //     'phone': phoneNumberController.text,
                      //   };
                      //   profileViewModel.doAction(EditProfile(
                      //     context: context,
                      //     profileData: profileData,
                      //   ));
                      // }
                    }),
              ),
            ],
          );
        },
      ),
    );
  }
}
