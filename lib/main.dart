import 'package:flowery_e_commerce/flowery_ecommerce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowery_e_commerce/core/services/shared_preference/shared_preference_helper.dart';
import 'core/utils/abb_bloc_observer.dart';
import 'di/di.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPrefHelper().instantiatePreferences();
  Bloc.observer = MyBlocObserver();
  runApp(FloweryEcommerce(),
  );
}
