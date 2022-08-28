import 'package:flutter/material.dart';

import '../constants/colors.dart';

class PriceTag extends StatelessWidget {
  const PriceTag({
    Key? key,
    this.oldPrice,
    required this.newPrice,
  }) : super(key: key);

  final double? oldPrice;
  final double newPrice;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          if (oldPrice != null)
            TextSpan(
              text: '$oldPrice\$',
              style: const TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          TextSpan(
            text: ' $newPrice\$',
            style: const TextStyle(
              color: Kcolors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
