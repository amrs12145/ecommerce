import 'package:ecommerce/shared/constants/text_styles.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class PriceTag extends StatelessWidget {
  const PriceTag({
    Key? key,
    this.oldPrice,
    required this.newPrice,
    this.large = false,
  }) : super(key: key);

  final double? oldPrice;
  final double newPrice;
  final bool large;

  @override
  Widget build(BuildContext context) {
    return large
        ? RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '\$${newPrice.toInt()}\n',
                  style: KtextStyle.headline2,
                ),
                if (oldPrice != null)
                  TextSpan(
                    text: '\$${oldPrice!.toInt()}',
                    style: KtextStyle.subtitle.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
              ],
            ),
          )
        : RichText(
            text: TextSpan(
              children: [
                if (oldPrice != null)
                  TextSpan(
                    text: '${oldPrice!.toInt()}\$',
                    style: const TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                TextSpan(
                  text: ' ${newPrice.toInt()}\$',
                  style: TextStyle(
                    color: oldPrice == null ? null : Kcolors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
  }
}
