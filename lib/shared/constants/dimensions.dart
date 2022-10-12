import 'package:flutter/material.dart';

class Kdimensions {
  static const double marginUnit = 16.0;
  static const double paddingUnit = 16.0;
  static const double borderUnit = 16.0;

  static const EdgeInsetsGeometry marginAll = EdgeInsets.all(marginUnit);
  static const EdgeInsetsGeometry paddingAll = EdgeInsets.all(paddingUnit);
  static const EdgeInsetsGeometry paddingBottomNavBar = EdgeInsets.symmetric(
    vertical: 32.0,
    horizontal: paddingUnit,
  );

  static const BorderRadius borderAll = BorderRadius.all(
    Radius.circular(borderUnit),
  );
  static const roundBorderSmall = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
  );
  static const roundBorder = RoundedRectangleBorder(
    borderRadius: borderAll,
  );
  static const roundBorderLarge = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  );

  static const verticleSpacing = SizedBox(height: 16.0);
  static const verticleSpacingLarge = SizedBox(height: 32.0);
  static const verticleSpacingSmall = SizedBox(height: 3.0);
  static const horizontalSpacing = SizedBox(width: 8.0);
  static const horizontalSpacingLarge = SizedBox(width: 16.0);
}
