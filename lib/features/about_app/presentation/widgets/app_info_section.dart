import 'package:flutter/material.dart';
import '../widgets/list_tile_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppInfoSection extends StatelessWidget {
  const AppInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        ListTileWidget(title: AppLocalizations.of(context)!.version, icon: Icons.eco, info:AppLocalizations.of(context)!.app_version,
        ),
        ListTileWidget(
            title: AppLocalizations.of(context)!.developed_by, icon: Icons.code, info: AppLocalizations.of(context)!.team_name,
        ),
        ListTileWidget(
            title: AppLocalizations.of(context)!.contact_us,
            icon: Icons.email,
            info: AppLocalizations.of(context)!.email_contact,
        ),
      ],
    );
  }
}
