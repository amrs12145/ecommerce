import 'package:flutter/material.dart';

import '/models/main/product.dart';
import '/shared/constants/dimensions.dart';
import '/shared/constants/text_styles.dart';
import 'product.dart';

class Scroll extends StatelessWidget {
  const Scroll({
    Key? key,
    required this.title,
    required this.description,
    required this.products,
  }) : super(key: key);

  final String title;
  final String description;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$title\n',
                    style: KtextStyle.headline,
                  ),
                  TextSpan(
                    text: description,
                    style: KtextStyle.subtitle,
                  ),
                ],
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                //TODO:To be removed
                primary: Colors.white,
              ),
              child:
                  const Text('view all'), //TODO:To add view all screen (LATER)
            ),
          ],
        ),
        Kdimensions.verticleSpacing,
        SizedBox(
          height: 264,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (_, __) => const SizedBox(width: 18.0),
            itemBuilder: (context, i) => ProductItem(product: products[i]),
          ),
        ),
      ],
    );
  }
}
