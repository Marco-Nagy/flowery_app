import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization/lang_keys.dart';
import '../widgets/list_tile_widget.dart';

class AppInfoSection extends StatelessWidget {
  const AppInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileWidget(
          title: (context.translate(LangKeys.version)),
          icon: Icons.eco,
          info: (context.translate(LangKeys.appVersion)),
        ),
        ListTileWidget(
          title: (context.translate(LangKeys.developedBy)),
          icon: Icons.code,
          info: (context.translate(LangKeys.teamName)),
        ),
        ListTileWidget(
          title: (context.translate(LangKeys.contactUs)),
          icon: Icons.email,
          info: (context.translate(LangKeys.emailContact)),
        ),
      ],
    );
  }
}
