// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/networking/api/api_manager.dart' as _i282;
import '../core/networking/common/regestet_context_module.dart' as _i125;
import '../core/networking/network_factory.dart' as _i377;
import '../core/provider/language_provider.dart' as _i1005;
import '../core/provider/language_service.dart' as _i289;
import '../features/address/data/data_sources/contracts/address_online_data_source.dart'
    as _i92;
import '../features/address/data/data_sources/impl/address_online_data_source_impl.dart'
    as _i112;
import '../features/address/data/repository/address_repo_impl.dart' as _i305;
import '../features/address/domain/repository/address_repo.dart' as _i917;
import '../features/address/domain/uses_cases/address_use_case.dart' as _i87;
import '../features/address/presentation/view_model/address_cubit.dart'
    as _i253;
import '../features/address_details/data/data_sources/contracts/add_address_online_data_source.dart'
    as _i700;
import '../features/address_details/data/data_sources/impl/add_address_online_data_source_impl.dart'
    as _i172;
import '../features/address_details/data/repositories/add_address_repo_impl.dart'
    as _i925;
import '../features/address_details/domain/contracts/add_address_repo.dart'
    as _i497;
import '../features/address_details/domain/use_cases/add_address_use_case.dart'
    as _i207;
import '../features/address_details/presentation/viewModel/add_address_view_model_cubit.dart'
    as _i526;
import '../features/auth/data/data_sources/contracts/auth_online_data_source.dart'
    as _i901;
import '../features/auth/data/data_sources/contracts/offline_data_source.dart'
    as _i345;
import '../features/auth/data/data_sources/impl/auth_offline_data_source_impl.dart'
    as _i1036;
import '../features/auth/data/data_sources/impl/auth_online_data_source_impl.dart'
    as _i326;
import '../features/auth/data/repositories/auth_repo_impl.dart' as _i990;
import '../features/auth/domain/contracts/auth_repo.dart' as _i665;
import '../features/auth/domain/use_cases/forgot_password_use_case.dart'
    as _i301;
import '../features/auth/domain/use_cases/login_use_case.dart' as _i496;
import '../features/auth/domain/use_cases/reset_password_use_case.dart'
    as _i906;
import '../features/auth/domain/use_cases/signup_use_case.dart' as _i853;
import '../features/auth/domain/use_cases/verify_reset_code_use_case.dart'
    as _i642;
import '../features/auth/presentation/forget_password/ViewModel/forget_password_view_model_cubit.dart'
    as _i60;
import '../features/auth/presentation/login/viewModel/login_view_model_cubit.dart'
    as _i690;
import '../features/auth/presentation/signup/view_model/signup_view_model_cubit.dart'
    as _i508;
import '../features/best_seller/data/best_seller_data_source/most_selling_api_manager.dart'
    as _i480;
import '../features/best_seller/data/best_seller_data_source/most_selling_products_online_data_source.dart'
    as _i475;
import '../features/best_seller/data/repo_impl/most_selling_repo_impl.dart'
    as _i221;
import '../features/best_seller/domain/repositories/most_selling_products_repository.dart'
    as _i643;
import '../features/best_seller/domain/use_cases/most_selling_use_case.dart'
    as _i972;
import '../features/best_seller/presentation/cubit/most_selling_cubit.dart'
    as _i372;
import '../features/cart/data/data_sources/contracts/cart_online_data_source.dart'
    as _i181;
import '../features/cart/data/data_sources/impl/cart_online_data_source_impl.dart'
    as _i1032;
import '../features/cart/data/repositories/cart_repository_impl.dart' as _i625;
import '../features/cart/domain/repositories/contracts/cart_repository.dart'
    as _i647;
import '../features/cart/domain/use_cases/add_to_cart_use_case.dart' as _i426;
import '../features/cart/domain/use_cases/clear_user_cart_data_use_case.dart'
    as _i170;
import '../features/cart/domain/use_cases/get_user_cart_data_use_case.dart'
    as _i510;
import '../features/cart/domain/use_cases/remove_product_from_cart_use_case.dart'
    as _i974;
import '../features/cart/domain/use_cases/update_product_quantity_use_case.dart'
    as _i138;
import '../features/cart/presentation/viewModel/cart_view_model_cubit.dart'
    as _i1043;
import '../features/categories/data/data_sources/contracts/categories_online_data_source.dart'
    as _i518;
import '../features/categories/data/data_sources/contracts/products_online_data_source.dart'
    as _i937;
import '../features/categories/data/data_sources/impl/categories_online_data_source_impl.dart'
    as _i1059;
import '../features/categories/data/data_sources/impl/products_online_data_source_impl.dart'
    as _i838;
import '../features/categories/data/repositories/categories_repo_impl.dart'
    as _i620;
import '../features/categories/data/repositories/products_repo_impl.dart'
    as _i160;
import '../features/categories/domain/repositories/categories_repo.dart'
    as _i590;
import '../features/categories/domain/repositories/products_repo.dart' as _i598;
import '../features/categories/domain/use_cases/categories_use_case.dart'
    as _i777;
import '../features/categories/domain/use_cases/products_use_case.dart' as _i98;
import '../features/categories/presentation/categories/viewModel/categories_view_model_cubit.dart'
    as _i80;
import '../features/checkout/presentation/viewModel/checkout_view_model_cubit.dart'
    as _i510;
import '../features/generic/data/data_sources/contracts/generic_online_data_source.dart'
    as _i211;
import '../features/generic/data/data_sources/impl/generic_online_data_source_impl.dart'
    as _i854;
import '../features/generic/data/repositories/generic_repo_impl.dart' as _i284;
import '../features/generic/domain/contracts/generic_repo.dart' as _i565;
import '../features/generic/domain/use_cases/generic_use_case.dart' as _i559;
import '../features/generic/presentation/generic_item_by_product/viewModel/generic_item_view_model_cubit.dart'
    as _i690;
import '../features/generic/presentation/view_model/generic_view_model_cubit.dart'
    as _i1070;
import '../features/home_screen/data/online_data_source/home_api_manager.dart'
    as _i507;
import '../features/home_screen/data/online_data_source/home_online_data_source.dart'
    as _i603;
import '../features/home_screen/data/repository_impl/home_repo_impl.dart'
    as _i178;
import '../features/home_screen/domain/repository/home_repo.dart' as _i765;
import '../features/home_screen/domain/uses_cases/home_use_case.dart' as _i720;
import '../features/home_screen/presentation/home_cubit/best_seller_cubit/best_seller_cubit.dart'
    as _i233;
import '../features/home_screen/presentation/home_cubit/occasions_cubit/occasions_cubit.dart'
    as _i851;
import '../features/product/data/data_sources/contracts/product_online_data_source.dart'
    as _i1037;
import '../features/product/data/data_sources/impl/product_online_data_source_impl.dart'
    as _i877;
import '../features/product/data/repositories/product_repo_impl.dart' as _i986;
import '../features/product/domain/repositories/product_repo.dart' as _i733;
import '../features/product/domain/use_cases/product_use_case.dart' as _i414;
import '../features/profile/data/data_sources/contracts/profile_online_data_source.dart'
    as _i46;
import '../features/profile/data/data_sources/impl/profile_online_data_source_impl.dart'
    as _i74;
import '../features/profile/data/repositories/profile_repo_impl.dart' as _i933;
import '../features/profile/domain/repositories/profile_repo.dart' as _i49;
import '../features/profile/domain/use_cases/profile_use_case.dart' as _i804;
import '../features/profile/presentation/viewModel/profile_view_model_cubit.dart'
    as _i907;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkFactory = _$NetworkFactory();
    final registerModule = _$RegisterModule();
    gh.factory<_i361.LogInterceptor>(
        () => networkFactory.providerInterceptor());
    gh.factory<_i510.CheckoutViewModelCubit>(
        () => _i510.CheckoutViewModelCubit());
    gh.singleton<_i409.GlobalKey<_i409.NavigatorState>>(
        () => registerModule.navigatorKey);
    gh.lazySingleton<_i361.Dio>(() => networkFactory.provideDio());
    gh.lazySingleton<_i289.LanguageService>(() => _i289.LanguageService());
    gh.singleton<_i282.ApiManager>(() => _i282.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i92.AddressOnlineDataSource>(
        () => _i112.AddressOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i901.AuthOnlineDataSource>(
        () => _i326.AuthOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i345.OfflineDataSource>(
        () => _i1036.OfflineDataSourceImplementation());
    gh.factory<_i937.ProductsOnlineDataSource>(
        () => _i838.ProductsOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i700.AddAddressOnlineDataSource>(
        () => _i172.AddAddressOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.lazySingleton<_i603.HomeOnlineDataSource>(
        () => _i507.HomeApiManager(gh<_i282.ApiManager>()));
    gh.factory<_i1005.LanguageProvider>(
        () => _i1005.LanguageProvider(gh<_i289.LanguageService>()));
    gh.factory<_i497.AddAddressRepo>(
        () => _i925.AddAddressRepoImpl(gh<_i700.AddAddressOnlineDataSource>()));
    gh.factory<_i917.AddressRepo>(
        () => _i305.AddressRepoImpl(gh<_i92.AddressOnlineDataSource>()));
    gh.lazySingleton<_i765.HomeRepository>(
        () => _i178.HomeRepoImpl(gh<_i603.HomeOnlineDataSource>()));
    gh.factory<_i46.ProfileOnlineDataSource>(
        () => _i74.ProfileOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i598.ProductsRepo>(
        () => _i160.ProductsRepoImpl(gh<_i937.ProductsOnlineDataSource>()));
    gh.lazySingleton<_i475.MostSellingProductsOnlineDataSource>(
        () => _i480.MostSellingProductsApiManager(gh<_i282.ApiManager>()));
    gh.factory<_i1037.ProductOnlineDataSource>(
        () => _i877.ProductOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i211.GenericOnlineDataSource>(
        () => _i854.GenericOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i181.CartOnlineDataSource>(
        () => _i1032.CartOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i518.CategoriesOnlineDataSource>(() =>
        _i1059.CategoriesOnlineDataSourceImplementation(
            gh<_i282.ApiManager>()));
    gh.factory<_i49.ProfileRepo>(
        () => _i933.ProfileRepoImpl(gh<_i46.ProfileOnlineDataSource>()));
    gh.factory<_i665.AuthRepository>(
        () => _i990.AuthRepositoryImpl(gh<_i901.AuthOnlineDataSource>()));
    gh.factory<_i207.AddAddressUseCase>(
        () => _i207.AddAddressUseCase(gh<_i497.AddAddressRepo>()));
    gh.factory<_i733.ProductRepo>(
        () => _i986.ProductRepoImpl(gh<_i1037.ProductOnlineDataSource>()));
    gh.factory<_i414.ProductUseCase>(
        () => _i414.ProductUseCase(gh<_i733.ProductRepo>()));
    gh.lazySingleton<_i643.MostSellingProductsRepository>(() =>
        _i221.MostSellingProductsRepoImpl(
            gh<_i475.MostSellingProductsOnlineDataSource>()));
    gh.factory<_i98.ProductsUseCase>(
        () => _i98.ProductsUseCase(gh<_i598.ProductsRepo>()));
    gh.factory<_i526.AddAddressViewModelCubit>(
        () => _i526.AddAddressViewModelCubit(gh<_i207.AddAddressUseCase>()));
    gh.factory<_i720.HomeUseCase>(
        () => _i720.HomeUseCase(gh<_i765.HomeRepository>()));
    gh.factory<_i87.AddressUseCase>(
        () => _i87.AddressUseCase(gh<_i917.AddressRepo>()));
    gh.factory<_i565.GenericRepo>(
        () => _i284.GenericRepositoryImpl(gh<_i211.GenericOnlineDataSource>()));
    gh.factory<_i804.ProfileUseCase>(
        () => _i804.ProfileUseCase(gh<_i49.ProfileRepo>()));
    gh.factory<_i647.CartRepository>(
        () => _i625.CartRepositoryImpl(gh<_i181.CartOnlineDataSource>()));
    gh.factory<_i253.AddressViewModel>(
        () => _i253.AddressViewModel(gh<_i87.AddressUseCase>()));
    gh.factory<_i496.LoginUseCase>(
        () => _i496.LoginUseCase(gh<_i665.AuthRepository>()));
    gh.factory<_i853.SignUpUseCase>(
        () => _i853.SignUpUseCase(gh<_i665.AuthRepository>()));
    gh.factory<_i301.ForgotPasswordUseCase>(
        () => _i301.ForgotPasswordUseCase(gh<_i665.AuthRepository>()));
    gh.factory<_i906.ResetPasswordUseCase>(
        () => _i906.ResetPasswordUseCase(gh<_i665.AuthRepository>()));
    gh.factory<_i642.VerifyResetCodeUseCase>(
        () => _i642.VerifyResetCodeUseCase(gh<_i665.AuthRepository>()));
    gh.factory<_i233.BestSellerCubit>(
        () => _i233.BestSellerCubit(gh<_i720.HomeUseCase>()));
    gh.factory<_i851.OccasionsCubit>(
        () => _i851.OccasionsCubit(gh<_i720.HomeUseCase>()));
    gh.factory<_i590.CategoriesRepository>(() =>
        _i620.CategoriesRepositoryImplementation(
            gh<_i518.CategoriesOnlineDataSource>()));
    gh.factory<_i972.MostSellingProductsUseCase>(() =>
        _i972.MostSellingProductsUseCase(
            gh<_i643.MostSellingProductsRepository>()));
    gh.factory<_i690.LoginViewModel>(
        () => _i690.LoginViewModel(gh<_i496.LoginUseCase>()));
    gh.factory<_i508.SignUpViewModel>(
        () => _i508.SignUpViewModel(gh<_i853.SignUpUseCase>()));
    gh.factory<_i907.ProfileViewModelCubit>(() => _i907.ProfileViewModelCubit(
          gh<_i804.ProfileUseCase>(),
          gh<_i345.OfflineDataSource>(),
        ));
    gh.factory<_i559.GenericUseCase>(
        () => _i559.GenericUseCase(gh<_i565.GenericRepo>()));
    gh.factory<_i426.AddToCartUseCase>(
        () => _i426.AddToCartUseCase(gh<_i647.CartRepository>()));
    gh.factory<_i170.ClearUserCartDataUseCase>(
        () => _i170.ClearUserCartDataUseCase(gh<_i647.CartRepository>()));
    gh.factory<_i510.GetUserCartDataUseCase>(
        () => _i510.GetUserCartDataUseCase(gh<_i647.CartRepository>()));
    gh.factory<_i974.RemoveProductFromCartUseCase>(
        () => _i974.RemoveProductFromCartUseCase(gh<_i647.CartRepository>()));
    gh.factory<_i138.UpdateProductQuantityUseCase>(
        () => _i138.UpdateProductQuantityUseCase(gh<_i647.CartRepository>()));
    gh.factory<_i60.ForgetPasswordViewModelCubit>(
        () => _i60.ForgetPasswordViewModelCubit(
              gh<_i301.ForgotPasswordUseCase>(),
              gh<_i642.VerifyResetCodeUseCase>(),
              gh<_i906.ResetPasswordUseCase>(),
            ));
    gh.factory<_i690.GenericItemViewModelCubit>(
        () => _i690.GenericItemViewModelCubit(
              gh<_i559.GenericUseCase>(),
              gh<_i414.ProductUseCase>(),
            ));
    gh.factory<_i777.CategoriesUseCase>(
        () => _i777.CategoriesUseCase(gh<_i590.CategoriesRepository>()));
    gh.factory<_i1043.CartViewModelCubit>(() => _i1043.CartViewModelCubit(
          gh<_i426.AddToCartUseCase>(),
          gh<_i510.GetUserCartDataUseCase>(),
          gh<_i138.UpdateProductQuantityUseCase>(),
          gh<_i974.RemoveProductFromCartUseCase>(),
          gh<_i170.ClearUserCartDataUseCase>(),
        ));
    gh.factory<_i372.MostSellerCubit>(
        () => _i372.MostSellerCubit(gh<_i972.MostSellingProductsUseCase>()));
    gh.factory<_i80.CategoriesViewModelCubit>(
        () => _i80.CategoriesViewModelCubit(gh<_i777.CategoriesUseCase>()));
    gh.factory<_i1070.GenericViewModelCubit>(
        () => _i1070.GenericViewModelCubit(gh<_i559.GenericUseCase>()));
    return this;
  }
}

class _$NetworkFactory extends _i377.NetworkFactory {}

class _$RegisterModule extends _i125.RegisterModule {}
