import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() {
  getIt.init();

  // Check if GlobalKey<NavigatorState> is already registered before adding it
  if (!getIt.isRegistered<GlobalKey<NavigatorState>>()) {
    getIt.registerLazySingleton<GlobalKey<NavigatorState>>(() => GlobalKey<NavigatorState>());
  }
}


void setupLocator() {
  if (!getIt.isRegistered<GlobalKey<NavigatorState>>()) {
    getIt.registerLazySingleton<GlobalKey<NavigatorState>>(
          () => GlobalKey<NavigatorState>(),
    );
  }
}
