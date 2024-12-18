import 'package:flowery_e_commerce/features/auth/data/data_sources/contracts/offline_data_source.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/services/shared_preference/location_helper.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../di/di.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final LocationHelper _locationHelper = LocationHelper();
  final OfflineDataSource offlineDataSource = getIt<OfflineDataSource>();

  String? _locationAddress;
  bool _isFetching = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    setState(() {
      _locationAddress = null;
    });

    await offlineDataSource.getToken();
    await _loadSavedLocation();
  }

  Future<void> _loadSavedLocation() async {
    String? savedLocation = await _locationHelper.getSavedLocation();

    setState(() {
      _locationAddress = savedLocation;
    });
  }

  Future<void> _detectLocation() async {
    setState(() {
      _isFetching = true;
    });

    bool isServiceEnabled = await _locationHelper.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      setState(() {
        _locationAddress =
            AppLocalizations.of(context)!.location_services_are_disabled;
        _isFetching = false;
      });
      return;
    }

    LocationPermission permission =
        await _locationHelper.requestLocationPermission(context);
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      setState(() {
        _locationAddress =
            AppLocalizations.of(context)!.location_permission_denied;
        _isFetching = false;
      });
      return;
    }

    try {
      Position position = await _locationHelper.getCurrentLocation(context);
      String address = await _locationHelper.getAddressFromLatLng(
          position.latitude, position.longitude, context);

      await _locationHelper.saveLocation(address);

      setState(() {
        _locationAddress = address;
        _isFetching = false;
      });
    } catch (e) {
      setState(() {
        _locationAddress = AppLocalizations.of(context)!.error_getting_location;
        _isFetching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isFetching
          ? Text(AppLocalizations.of(context)!.loading)
          : _locationAddress == null
              ? TextButton(
                  onPressed: _detectLocation,
                  child: Text(
                    AppLocalizations.of(context)!.get_location,
                    style: MyFonts.styleMedium500_14.copyWith(
                      decoration: TextDecoration.underline,
                      color: MyColors.blackBase,
                    ),
                  ),
                )
              : Text(
                  _locationAddress!,
                  style: const TextStyle(fontSize: 16),
                ),
    );
  }
}
