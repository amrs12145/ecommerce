import 'package:flutter/material.dart';

extension BoxUnit on SizedBox {
  double get unit {
    return height ?? width!;
  }
}
//TODO:To add extension to get unit of margin or padding
// extension MarginUnit on EdgeInsets {
//   double get unit {
//     return this.vertical;
//   }
// }
// extension Unit on SizedBox {
//   double get unit {
//     return height!;
//   }
// }
