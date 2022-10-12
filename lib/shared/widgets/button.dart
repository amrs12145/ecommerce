import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';

class Kbutton extends StatelessWidget {
  const Kbutton({
    Key? key,
    required this.text,
    this.onPressed,
    this.primary,
  }) : super(key: key);

  final String text;
  final Color? primary;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: primary ?? Kcolors.primary,
        minimumSize: const Size.fromHeight(50),
        shape: Kdimensions.roundBorderLarge.copyWith(),
      ),
      child: Text(
        text.toUpperCase(),
      ),
    );
  }
}
