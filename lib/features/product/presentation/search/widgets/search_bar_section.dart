import 'package:flutter/material.dart';

import 'custom_search_bar.dart';

class SearchBarSection extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchBarSection({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CustomSearchBar(
      hintText: "Search for products ...",
      onChanged: onChanged,
    );
  }
}
