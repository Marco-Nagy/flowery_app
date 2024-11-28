import 'package:flutter/material.dart';

class VisibilityIcon extends StatefulWidget {
  const VisibilityIcon({super.key, required this.isVisible});

  final bool isVisible;

  @override
  VisibilityIconState createState() => VisibilityIconState();
}

class VisibilityIconState extends State<VisibilityIcon> {
  late bool _isVisible;

  @override
  void initState() {
    super.initState();
    _isVisible = widget.isVisible;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isVisible = !_isVisible;
        });
      },
      child: Icon(
        _isVisible ? Icons.visibility_off_rounded : Icons.visibility_rounded,
      ),
    );
  }
}
