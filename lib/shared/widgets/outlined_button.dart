import 'package:ecommerce/core/string_extension.dart';
import 'package:ecommerce/shared/constants/colors.dart';
import 'package:flutter/material.dart';

import '../constants/dimensions.dart';

class KoutlinedButton extends StatefulWidget {
  const KoutlinedButton({
    Key? key,
    required this.text,
    this.width,
  }) : super(key: key);

  final String text;
  final double? width;

  @override
  State<KoutlinedButton> createState() => _KoutlinedButtonState();
}

class _KoutlinedButtonState extends State<KoutlinedButton> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        setState(() => _isActive = !_isActive);
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: !_isActive ? null : Kcolors.primary,
        fixedSize: Size(widget.width ?? 40.0, 40.0),
        shape: Kdimensions.roundBorderSmall,
        splashFactory: NoSplash.splashFactory,
      ),
      child: Text(widget.text.capitalize()),
    );
  }
}
