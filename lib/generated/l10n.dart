// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Please enter first name`
  String get enterFirstName {
    return Intl.message(
      'Please enter first name',
      name: 'enterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter last name`
  String get enterLastName {
    return Intl.message(
      'Please enter last name',
      name: 'enterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get enterEmail {
    return Intl.message(
      'Please enter your email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `This email is not valid`
  String get invalidEmail {
    return Intl.message(
      'This email is not valid',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password`
  String get enterPassword {
    return Intl.message(
      'Please enter password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character.`
  String get passwordComplexity {
    return Intl.message(
      'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character.',
      name: 'passwordComplexity',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordMismatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Please enter your phone number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get invalidPhoneNumber {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your user name`
  String get hintUserName {
    return Intl.message(
      'Enter your user name',
      name: 'hintUserName',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get labelUserName {
    return Intl.message(
      'User Name',
      name: 'labelUserName',
      desc: '',
      args: [],
    );
  }

  /// `Enter first name`
  String get hintFirstName {
    return Intl.message(
      'Enter first name',
      name: 'hintFirstName',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get labelFirstName {
    return Intl.message(
      'First Name',
      name: 'labelFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Enter last name`
  String get hintLastName {
    return Intl.message(
      'Enter last name',
      name: 'hintLastName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get labelLastName {
    return Intl.message(
      'Last Name',
      name: 'labelLastName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Email`
  String get hintEmail {
    return Intl.message(
      'Enter your Email',
      name: 'hintEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get labelEmail {
    return Intl.message(
      'Email',
      name: 'labelEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get hintPassword {
    return Intl.message(
      'Enter password',
      name: 'hintPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get labelPassword {
    return Intl.message(
      'Password',
      name: 'labelPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get hintConfirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'hintConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get labelConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'labelConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number`
  String get hintPhoneNumber {
    return Intl.message(
      'Enter phone number',
      name: 'hintPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get labelPhoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'labelPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Email verification`
  String get emailVerificationTitle {
    return Intl.message(
      'Email verification',
      name: 'emailVerificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the code sent to your email address.`
  String get emailVerificationDescription {
    return Intl.message(
      'Please enter the code sent to your email address.',
      name: 'emailVerificationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPasswordTitle {
    return Intl.message(
      'Reset password',
      name: 'resetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Password must not be empty and must contain 6 characters with upper case letter and one number at least`
  String get resetPasswordDescription {
    return Intl.message(
      'Password must not be empty and must contain 6 characters with upper case letter and one number at least',
      name: 'resetPasswordDescription',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while logging in. Please try again.`
  String get loginError {
    return Intl.message(
      'An error occurred while logging in. Please try again.',
      name: 'loginError',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while resetting the password. Please try again.`
  String get resetPasswordError {
    return Intl.message(
      'An error occurred while resetting the password. Please try again.',
      name: 'resetPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while verifying the email. Please try again.`
  String get emailVerificationError {
    return Intl.message(
      'An error occurred while verifying the email. Please try again.',
      name: 'emailVerificationError',
      desc: '',
      args: [],
    );
  }

  /// `Request Timeout.`
  String get requestTimeout {
    return Intl.message(
      'Request Timeout.',
      name: 'requestTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email or password`
  String get unauthorizedException {
    return Intl.message(
      'Incorrect email or password',
      name: 'unauthorizedException',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get noInternetException {
    return Intl.message(
      'No Internet Connection',
      name: 'noInternetException',
      desc: '',
      args: [],
    );
  }

  /// `Server Error`
  String get serverErrorException {
    return Intl.message(
      'Server Error',
      name: 'serverErrorException',
      desc: '',
      args: [],
    );
  }

  /// `Email or Username already exists`
  String get conflictException {
    return Intl.message(
      'Email or Username already exists',
      name: 'conflictException',
      desc: '',
      args: [],
    );
  }

  /// `There is no account with this email address`
  String get notFoundException {
    return Intl.message(
      'There is no account with this email address',
      name: 'notFoundException',
      desc: '',
      args: [],
    );
  }

  /// `Data Parsing Error`
  String get parsingErrorException {
    return Intl.message(
      'Data Parsing Error',
      name: 'parsingErrorException',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred`
  String get unknownErrorException {
    return Intl.message(
      'An unknown error occurred',
      name: 'unknownErrorException',
      desc: '',
      args: [],
    );
  }

  /// `Bad Request`
  String get badRequestException {
    return Intl.message(
      'Bad Request',
      name: 'badRequestException',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgetPassword {
    return Intl.message(
      'Forget Password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forget_password {
    return Intl.message(
      'Forget Password?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email associated to your account`
  String get pleaseEnterYourEmailAssociatedToYourAccount {
    return Intl.message(
      'Please enter your email associated to your account',
      name: 'pleaseEnterYourEmailAssociatedToYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get labelContinue {
    return Intl.message(
      'Continue',
      name: 'labelContinue',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get notHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'notHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Enter new password`
  String get enterNewPassword {
    return Intl.message(
      'Enter new password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Result`
  String get result {
    return Intl.message(
      'Result',
      name: 'result',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get my_orders {
    return Intl.message(
      'My Orders',
      name: 'my_orders',
      desc: '',
      args: [],
    );
  }

  /// `Saved Address`
  String get saved_address {
    return Intl.message(
      'Saved Address',
      name: 'saved_address',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `About App`
  String get about_app {
    return Intl.message(
      'About App',
      name: 'about_app',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get terms_and_conditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Flowery App!`
  String get welcome_app {
    return Intl.message(
      'Welcome to Flowery App!',
      name: 'welcome_app',
      desc: '',
      args: [],
    );
  }

  /// `By using our app, you agree to the following terms and conditions. Please read them carefully before proceeding.`
  String get welcome_app_description {
    return Intl.message(
      'By using our app, you agree to the following terms and conditions. Please read them carefully before proceeding.',
      name: 'welcome_app_description',
      desc: '',
      args: [],
    );
  }

  /// `Introduction`
  String get introduction {
    return Intl.message(
      'Introduction',
      name: 'introduction',
      desc: '',
      args: [],
    );
  }

  /// `Payment Terms`
  String get payment_terms {
    return Intl.message(
      'Payment Terms',
      name: 'payment_terms',
      desc: '',
      args: [],
    );
  }

  /// `Refund Policy`
  String get refund_policy {
    return Intl.message(
      'Refund Policy',
      name: 'refund_policy',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Flowery is an online marketplace where you can purchase floral products and gifts. These terms apply to all users of the app. By using the app, you agree to these terms. If you do not agree to these terms, please do not use the app.`
  String get introduction_description {
    return Intl.message(
      'Flowery is an online marketplace where you can purchase floral products and gifts. These terms apply to all users of the app. By using the app, you agree to these terms. If you do not agree to these terms, please do not use the app.',
      name: 'introduction_description',
      desc: '',
      args: [],
    );
  }

  /// `All payments are processed securely. Please ensure the accuracy of your payment details to avoid interruptions.`
  String get payment_terms_description {
    return Intl.message(
      'All payments are processed securely. Please ensure the accuracy of your payment details to avoid interruptions.',
      name: 'payment_terms_description',
      desc: '',
      args: [],
    );
  }

  /// `Refunds are issued in accordance with our refund policy. Products must be returned in their original condition to be eligible for a refund.`
  String get refund_policy_description {
    return Intl.message(
      'Refunds are issued in accordance with our refund policy. Products must be returned in their original condition to be eligible for a refund.',
      name: 'refund_policy_description',
      desc: '',
      args: [],
    );
  }

  /// `We take your privacy seriously. Your data is protected and will not be shared with third parties.`
  String get privacy_policy_description {
    return Intl.message(
      'We take your privacy seriously. Your data is protected and will not be shared with third parties.',
      name: 'privacy_policy_description',
      desc: '',
      args: [],
    );
  }

  /// `If you have any questions or inquiries, please contact us at [Your Contact Information]`
  String get contact_us_description {
    return Intl.message(
      'If you have any questions or inquiries, please contact us at [Your Contact Information]',
      name: 'contact_us_description',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message(
      'First Name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name {
    return Intl.message(
      'Last Name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get add_new_address {
    return Intl.message(
      'Add New Address',
      name: 'add_new_address',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Enter the address`
  String get enter_address {
    return Intl.message(
      'Enter the address',
      name: 'enter_address',
      desc: '',
      args: [],
    );
  }

  /// `Enter the phone number`
  String get enter_phone_number {
    return Intl.message(
      'Enter the phone number',
      name: 'enter_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Recipient Name`
  String get recipient_name {
    return Intl.message(
      'Recipient Name',
      name: 'recipient_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter the recipient name`
  String get enter_recipient_name {
    return Intl.message(
      'Enter the recipient name',
      name: 'enter_recipient_name',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get area {
    return Intl.message(
      'Area',
      name: 'area',
      desc: '',
      args: [],
    );
  }

  /// `Cairo`
  String get cairo {
    return Intl.message(
      'Cairo',
      name: 'cairo',
      desc: '',
      args: [],
    );
  }

  /// `October`
  String get october {
    return Intl.message(
      'October',
      name: 'october',
      desc: '',
      args: [],
    );
  }

  /// `Save Address`
  String get save_address {
    return Intl.message(
      'Save Address',
      name: 'save_address',
      desc: '',
      args: [],
    );
  }

  /// `Profile updated successfully`
  String get profile_updated_successfully {
    return Intl.message(
      'Profile updated successfully',
      name: 'profile_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Select a Photo`
  String get select_a_photo {
    return Intl.message(
      'Select a Photo',
      name: 'select_a_photo',
      desc: '',
      args: [],
    );
  }

  /// `Take a photo`
  String get take_a_photo {
    return Intl.message(
      'Take a photo',
      name: 'take_a_photo',
      desc: '',
      args: [],
    );
  }

  /// `Pick from gallery`
  String get pick_from_gallery {
    return Intl.message(
      'Pick from gallery',
      name: 'pick_from_gallery',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email or password`
  String get incorrect_email_or_password {
    return Intl.message(
      'Incorrect email or password',
      name: 'incorrect_email_or_password',
      desc: '',
      args: [],
    );
  }

  /// `Old password is incorrect, Please try again`
  String get old_password_incorrect {
    return Intl.message(
      'Old password is incorrect, Please try again',
      name: 'old_password_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get password_changed_successfully {
    return Intl.message(
      'Password changed successfully',
      name: 'password_changed_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Birthday Flowers`
  String get birthday_flowers {
    return Intl.message(
      'Birthday Flowers',
      name: 'birthday_flowers',
      desc: '',
      args: [],
    );
  }

  /// `Anniversary`
  String get anniversary {
    return Intl.message(
      'Anniversary',
      name: 'anniversary',
      desc: '',
      args: [],
    );
  }

  /// `Get Well Soon`
  String get get_well_soon {
    return Intl.message(
      'Get Well Soon',
      name: 'get_well_soon',
      desc: '',
      args: [],
    );
  }

  /// `Best Sellers`
  String get best_sellers {
    return Intl.message(
      'Best Sellers',
      name: 'best_sellers',
      desc: '',
      args: [],
    );
  }

  /// `About Flowery App`
  String get about_flowery_app {
    return Intl.message(
      'About Flowery App',
      name: 'about_flowery_app',
      desc: '',
      args: [],
    );
  }

  /// `Rose Bouquet`
  String get rose_bouquet {
    return Intl.message(
      'Rose Bouquet',
      name: 'rose_bouquet',
      desc: '',
      args: [],
    );
  }

  /// `Lily Bunch`
  String get lily_bunch {
    return Intl.message(
      'Lily Bunch',
      name: 'lily_bunch',
      desc: '',
      args: [],
    );
  }

  /// `© 2024 Flowery App. All rights reserved.`
  String get copyright_notice {
    return Intl.message(
      '© 2024 Flowery App. All rights reserved.',
      name: 'copyright_notice',
      desc: '',
      args: [],
    );
  }

  /// `support@floweryapp.com`
  String get email_contact {
    return Intl.message(
      'support@floweryapp.com',
      name: 'email_contact',
      desc: '',
      args: [],
    );
  }

  /// `Developed By`
  String get developed_by {
    return Intl.message(
      'Developed By',
      name: 'developed_by',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `1.0.0`
  String get app_version {
    return Intl.message(
      '1.0.0',
      name: 'app_version',
      desc: '',
      args: [],
    );
  }

  /// `Team Two`
  String get team_name {
    return Intl.message(
      'Team Two',
      name: 'team_name',
      desc: '',
      args: [],
    );
  }

  /// `Discover a wide variety of flowers for all occasions.`
  String get discover_flowers {
    return Intl.message(
      'Discover a wide variety of flowers for all occasions.',
      name: 'discover_flowers',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Flowery`
  String get app_name {
    return Intl.message(
      'Flowery',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Deliver to 2XVP+XC - Sheikh Zayed`
  String get deliver_location {
    return Intl.message(
      'Deliver to 2XVP+XC - Sheikh Zayed',
      name: 'deliver_location',
      desc: '',
      args: [],
    );
  }

  /// `Discover something now`
  String get discover_something_now {
    return Intl.message(
      'Discover something now',
      name: 'discover_something_now',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get view_all {
    return Intl.message(
      'View All',
      name: 'view_all',
      desc: '',
      args: [],
    );
  }

  /// `Best Seller`
  String get best_seller {
    return Intl.message(
      'Best Seller',
      name: 'best_seller',
      desc: '',
      args: [],
    );
  }

  /// `Bloom with our exquisite best sellers`
  String get best_sellers_desc {
    return Intl.message(
      'Bloom with our exquisite best sellers',
      name: 'best_sellers_desc',
      desc: '',
      args: [],
    );
  }

  /// `Occasion`
  String get occasion {
    return Intl.message(
      'Occasion',
      name: 'occasion',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get add_to_cart {
    return Intl.message(
      'Add to Cart',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `is required`
  String get is_required {
    return Intl.message(
      'is required',
      name: 'is_required',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get email_is_required {
    return Intl.message(
      'Email is required',
      name: 'email_is_required',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get invalid_email_address {
    return Intl.message(
      'Invalid email address',
      name: 'invalid_email_address',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get password_is_required {
    return Intl.message(
      'Password is required',
      name: 'password_is_required',
      desc: '',
      args: [],
    );
  }

  /// `Must contain A-Z, a-z, @-#-&.. , 1-9`
  String get password_validation_hint {
    return Intl.message(
      'Must contain A-Z, a-z, @-#-&.. , 1-9',
      name: 'password_validation_hint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password is required`
  String get confirm_password_is_required {
    return Intl.message(
      'Confirm Password is required',
      name: 'confirm_password_is_required',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwords_do_not_match {
    return Intl.message(
      'Passwords do not match',
      name: 'passwords_do_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number is required`
  String get phone_number_is_required {
    return Intl.message(
      'Phone Number is required',
      name: 'phone_number_is_required',
      desc: '',
      args: [],
    );
  }

  /// `Must be 11 digits starting with (+20) or 0. Prefix can be 10, 11, 12, or 15 only.`
  String get phone_number_validation_hint {
    return Intl.message(
      'Must be 11 digits starting with (+20) or 0. Prefix can be 10, 11, 12, or 15 only.',
      name: 'phone_number_validation_hint',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong!`
  String get something_went_wrong {
    return Intl.message(
      'Something went wrong!',
      name: 'something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Oops! No Internet Connection`
  String get no_internet_connection {
    return Intl.message(
      'Oops! No Internet Connection',
      name: 'no_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `It seems like you're offline. Please check your connection and try again.`
  String get offline_message {
    return Intl.message(
      'It seems like you\'re offline. Please check your connection and try again.',
      name: 'offline_message',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection. Please check your settings.`
  String get no_internet_connection_message {
    return Intl.message(
      'No internet connection. Please check your settings.',
      name: 'no_internet_connection_message',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred. Please try again.`
  String get unknown_error {
    return Intl.message(
      'An unknown error occurred. Please try again.',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Bad request. Please verify your input and try again.`
  String get bad_request_error {
    return Intl.message(
      'Bad request. Please verify your input and try again.',
      name: 'bad_request_error',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized access.`
  String get unauthorized_access {
    return Intl.message(
      'Unauthorized access.',
      name: 'unauthorized_access',
      desc: '',
      args: [],
    );
  }

  /// `Connection timed out. Please check your internet connection.`
  String get connection_timed_out {
    return Intl.message(
      'Connection timed out. Please check your internet connection.',
      name: 'connection_timed_out',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error. Please try again later.`
  String get internal_server_error {
    return Intl.message(
      'Internal server error. Please try again later.',
      name: 'internal_server_error',
      desc: '',
      args: [],
    );
  }

  /// `Bad Gateway. The server received an invalid response.`
  String get bad_gateway_error {
    return Intl.message(
      'Bad Gateway. The server received an invalid response.',
      name: 'bad_gateway_error',
      desc: '',
      args: [],
    );
  }

  /// `Service Unavailable. The server is currently unable to handle the request.`
  String get service_unavailable_error {
    return Intl.message(
      'Service Unavailable. The server is currently unable to handle the request.',
      name: 'service_unavailable_error',
      desc: '',
      args: [],
    );
  }

  /// `Gateway Timeout. The server took too long to respond.`
  String get gateway_timeout_error {
    return Intl.message(
      'Gateway Timeout. The server took too long to respond.',
      name: 'gateway_timeout_error',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred. Please try again.`
  String get unexpected_error {
    return Intl.message(
      'An unexpected error occurred. Please try again.',
      name: 'unexpected_error',
      desc: '',
      args: [],
    );
  }

  /// `Logout Successfully`
  String get logout_successfully {
    return Intl.message(
      'Logout Successfully',
      name: 'logout_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Confirm logout!!`
  String get confirm_logout {
    return Intl.message(
      'Confirm logout!!',
      name: 'confirm_logout',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive code?`
  String get not_receive_code {
    return Intl.message(
      'Didn\'t receive code?',
      name: 'not_receive_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter code`
  String get enter_code {
    return Intl.message(
      'Enter code',
      name: 'enter_code',
      desc: '',
      args: [],
    );
  }

  /// `Continue as Guest`
  String get guest {
    return Intl.message(
      'Continue as Guest',
      name: 'guest',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get remember_me {
    return Intl.message(
      'Remember me',
      name: 'remember_me',
      desc: '',
      args: [],
    );
  }

  /// `Creating an account, you agree to our`
  String get creating_account {
    return Intl.message(
      'Creating an account, you agree to our',
      name: 'creating_account',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `No products available.`
  String get no_products_available {
    return Intl.message(
      'No products available.',
      name: 'no_products_available',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get currency {
    return Intl.message(
      'EGP',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `In stock`
  String get in_stock {
    return Intl.message(
      'In stock',
      name: 'in_stock',
      desc: '',
      args: [],
    );
  }

  /// `All prices include tax`
  String get all_prices_include_tax {
    return Intl.message(
      'All prices include tax',
      name: 'all_prices_include_tax',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Bouquet include`
  String get bouquet_include {
    return Intl.message(
      'Bouquet include',
      name: 'bouquet_include',
      desc: '',
      args: [],
    );
  }

  /// `White wrap`
  String get white_wrap {
    return Intl.message(
      'White wrap',
      name: 'white_wrap',
      desc: '',
      args: [],
    );
  }

  /// `Deliver to`
  String get deliver_to {
    return Intl.message(
      'Deliver to',
      name: 'deliver_to',
      desc: '',
      args: [],
    );
  }

  /// `2XVP+XC - Sheikh Zayed`
  String get address_sample {
    return Intl.message(
      '2XVP+XC - Sheikh Zayed',
      name: 'address_sample',
      desc: '',
      args: [],
    );
  }

  /// `Red roses`
  String get red_roses {
    return Intl.message(
      'Red roses',
      name: 'red_roses',
      desc: '',
      args: [],
    );
  }

  /// `15 Pink Rose Bouquet`
  String get pink_rose_bouquet {
    return Intl.message(
      '15 Pink Rose Bouquet',
      name: 'pink_rose_bouquet',
      desc: '',
      args: [],
    );
  }

  /// `Sub Total`
  String get sub_total {
    return Intl.message(
      'Sub Total',
      name: 'sub_total',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Fee`
  String get delivery_fee {
    return Intl.message(
      'Delivery Fee',
      name: 'delivery_fee',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get payment_method {
    return Intl.message(
      'Payment Method',
      name: 'payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Cash on Delivery`
  String get cash_on_delivery {
    return Intl.message(
      'Cash on Delivery',
      name: 'cash_on_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get credit_card {
    return Intl.message(
      'Credit Card',
      name: 'credit_card',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card Number`
  String get credit_card_number {
    return Intl.message(
      'Credit Card Number',
      name: 'credit_card_number',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card Expiration Date`
  String get credit_card_expiration_date {
    return Intl.message(
      'Credit Card Expiration Date',
      name: 'credit_card_expiration_date',
      desc: '',
      args: [],
    );
  }

  /// `Track order`
  String get track_order {
    return Intl.message(
      'Track order',
      name: 'track_order',
      desc: '',
      args: [],
    );
  }

  /// ` It is a gift`
  String get gift_option {
    return Intl.message(
      ' It is a gift',
      name: 'gift_option',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Enter the name`
  String get enter_name {
    return Intl.message(
      'Enter the name',
      name: 'enter_name',
      desc: '',
      args: [],
    );
  }

  /// `Office`
  String get office {
    return Intl.message(
      'Office',
      name: 'office',
      desc: '',
      args: [],
    );
  }

  /// `Add new`
  String get add_new {
    return Intl.message(
      'Add new',
      name: 'add_new',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `1`
  String get step_1 {
    return Intl.message(
      '1',
      name: 'step_1',
      desc: '',
      args: [],
    );
  }

  /// `2`
  String get step_2 {
    return Intl.message(
      '2',
      name: 'step_2',
      desc: '',
      args: [],
    );
  }

  /// `3`
  String get step_3 {
    return Intl.message(
      '3',
      name: 'step_3',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Delivery time`
  String get delivery_time {
    return Intl.message(
      'Delivery time',
      name: 'delivery_time',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get schedule {
    return Intl.message(
      'Schedule',
      name: 'schedule',
      desc: '',
      args: [],
    );
  }

  /// `Instant`
  String get instant {
    return Intl.message(
      'Instant',
      name: 'instant',
      desc: '',
      args: [],
    );
  }

  /// `Arrive by`
  String get arrive_by {
    return Intl.message(
      'Arrive by',
      name: 'arrive_by',
      desc: '',
      args: [],
    );
  }

  /// `Delivery address`
  String get delivery_address {
    return Intl.message(
      'Delivery address',
      name: 'delivery_address',
      desc: '',
      args: [],
    );
  }

  /// `Place Order`
  String get place_order {
    return Intl.message(
      'Place Order',
      name: 'place_order',
      desc: '',
      args: [],
    );
  }

  /// `Your cart is empty`
  String get your_cart_is_empty {
    return Intl.message(
      'Your cart is empty',
      name: 'your_cart_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get items {
    return Intl.message(
      'Items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `Deliver to 2XVP+XC - Sheikh Zayed`
  String get deliver_sheikh_zayed {
    return Intl.message(
      'Deliver to 2XVP+XC - Sheikh Zayed',
      name: 'deliver_sheikh_zayed',
      desc: '',
      args: [],
    );
  }

  /// `Must contains`
  String get must_contains {
    return Intl.message(
      'Must contains',
      name: 'must_contains',
      desc: '',
      args: [],
    );
  }

  /// `Address saved successfully`
  String get address_saved_successfully {
    return Intl.message(
      'Address saved successfully',
      name: 'address_saved_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, try again`
  String get wrong {
    return Intl.message(
      'Something went wrong, try again',
      name: 'wrong',
      desc: '',
      args: [],
    );
  }

  /// `Failure`
  String get failure {
    return Intl.message(
      'Failure',
      name: 'failure',
      desc: '',
      args: [],
    );
  }

  /// `Select City`
  String get select_city {
    return Intl.message(
      'Select City',
      name: 'select_city',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get select_country {
    return Intl.message(
      'Select Country',
      name: 'select_country',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
