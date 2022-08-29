import 'package:flutter/material.dart';

class Kdimensions {
  static const double marginUnit = 16.0;
  static const EdgeInsetsGeometry marginAll = EdgeInsets.all(marginUnit);
  static const double paddingUnit = 16.0;
  static const EdgeInsetsGeometry paddingAll = EdgeInsets.all(paddingUnit);
  static const double borderUnit = 16.0;
  static const BorderRadius borderAll = BorderRadius.all(
    Radius.circular(borderUnit),
  );
  static const roundBorder = RoundedRectangleBorder(
    borderRadius: borderAll,
  );
  static const verticleSpacing = SizedBox(height: 16.0);
  static const verticleSpacingLarge = SizedBox(height: 32.0);
  static const verticleSpacingSmall = SizedBox(height: 3.0);
  static const horizontalSpacing = SizedBox(width: 8.0);
}
