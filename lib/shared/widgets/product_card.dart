import 'package:ecommerce/screens/main/shop/product.dart';
import 'package:flutter/material.dart';

import 'stars.dart';
import '/models/main/product.dart';
import '/shared/constants/colors.dart';
import '/shared/constants/dimensions.dart';
import '/shared/constants/text_styles.dart';
import '/shared/widgets/price.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    this.width,
    this.height,
  }) : super(key: key);

  final Product product;
  final double? width;
  final double? height;

  static int i = 0; //TODO:to be removed after using product.id

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductDetails(
                product: product,
              ),
            ),
          );
        },
        highlightColor: Kcolors.dark,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: Kdimensions.borderAll,
                  child: Image.network(
                    product.mainImgUrl,
                    width: width ?? 150,
                    height: height ?? 185,
                    fit: BoxFit.cover,
                  ),
                ),
                if (product.discount != null)
                  Positioned(
                    left: 8,
                    top: 8,
                    child: Container(
                      width: 40,
                      height: 28,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 227, 48, 35),
                        borderRadius: Kdimensions.borderAll,
                        boxShadow: [
                          BoxShadow(blurRadius: 4),
                        ],
                      ),
                      child: Center(
                        child: Text('-${product.discount!}%'),
                      ),
                    ),
                  ),
                Positioned(
                  right: -2,
                  bottom: -22,
                  child: FloatingActionButton(
                    //TODO:Can not trigger the bottom of the FAB (BUG)
                    heroTag:
                        '${product.title}${product.newPrice} ${i++}', //TODO:To be replaced with product.id
                    mini: true,
                    onPressed: () {},
                    backgroundColor: Kcolors.dark,
                    elevation: 8.0,
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Kdimensions.verticleSpacingSmall,
            Stars(
              rating: product.rating,
              numOfRating: product.numOfRating,
            ),
            Kdimensions.verticleSpacingSmall,
            Text(
              product.title,
              style: KtextStyle.bodyText,
            ),
            Kdimensions.verticleSpacingSmall,
            if (product.subtitle != null)
              Text(
                product.subtitle!,
                style: KtextStyle.subtitle,
              ),
            Kdimensions.verticleSpacingSmall,
            PriceTag(
              oldPrice: product.oldPrice,
              newPrice: product.newPrice,
            ),
          ],
        ),
      ),
    );
  }
}
