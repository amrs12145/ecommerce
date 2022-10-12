import 'package:ecommerce/core/sized_box.dart';
import 'package:ecommerce/models/main/product.dart';
import 'package:ecommerce/net/size.dart';
import 'package:ecommerce/shared/constants/dimensions.dart';
import 'package:ecommerce/shared/constants/text_styles.dart';
import 'package:ecommerce/shared/widgets/bottom_sheet.dart';
import 'package:ecommerce/shared/widgets/button.dart';
import 'package:ecommerce/shared/widgets/price.dart';
import 'package:ecommerce/shared/widgets/stars.dart';
import 'package:flutter/material.dart';

import '../../../net/product.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/widgets/product_card.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  String size = '';
  int colorValue = -1;
  final Map<String, dynamic> selected = {
    'size': <String>[],
    'colors': <String>[],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kcolors.background,
      appBar: AppBar(
        backgroundColor: Kcolors.background,
        title: Text(product.title),
        centerTitle: true,
        actions: const [
          Icon(Icons.share),
        ],
        // elevation: 0,
      ),
      bottomNavigationBar: Padding(
        padding: Kdimensions.paddingBottomNavBar,
        child: Kbutton(
          onPressed: () {},
          text: 'Add to cart',
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 450,
            child: product.images == null
                ? Center(
                    child: Text(product.title),
                  )
                : PageView.builder(
                    controller: PageController(
                      viewportFraction: .90,
                    ),
                    pageSnapping: true,
                    padEnds: false,
                    itemCount: product.images!.length,
                    itemBuilder: (context, i) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Kdimensions.horizontalSpacing.unit,
                      ),
                      child: Image.network(
                        product.images![i],
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: Kdimensions.paddingAll,
            child: StatefulBuilder(
              builder: (context, setBuilderState) {
                return Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          KbottomSheet.show(
                            height: 370,
                            context: context,
                            text: 'select size',
                            child: ListView(
                              children: [
                                Wrap(
                                  spacing: 16,
                                  runSpacing:
                                      Kdimensions.verticleSpacingSmall.unit,
                                  children: loadSizes
                                      .map(
                                        (s) => OutlinedButton(
                                          onPressed: () {
                                            setBuilderState(() {
                                              size = s;
                                              Navigator.of(context).pop();
                                            });
                                          },
                                          style: TextButton.styleFrom(
                                            primary: Colors.white,
                                            fixedSize: const Size(90.0, 40.0),
                                            shape: Kdimensions.roundBorderSmall,
                                            side: const BorderSide(
                                              width: .5,
                                              color: Colors.grey,
                                            ),
                                            splashFactory:
                                                NoSplash.splashFactory,
                                          ),
                                          child: Text(s.toUpperCase()),
                                        ),
                                      )
                                      .toList(),
                                ),
                                Kdimensions.verticleSpacing,
                                const Divider(height: 0),
                                ListTile(
                                  onTap: () {},
                                  leading: const Text('Size info'),
                                  trailing:
                                      const Icon(Icons.keyboard_arrow_right),
                                ),
                                const Divider(height: 0),
                              ],
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 16.0,
                          ),
                          primary: Colors.white,
                          shape: Kdimensions.roundBorderSmall,
                          side: const BorderSide(
                            width: .5,
                            color: Colors.grey,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Size'),
                            size.isNotEmpty
                                ? SizedBox(
                                    height: 20,
                                    child: Text(
                                      size.toUpperCase(),
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  )
                                : const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Kdimensions.horizontalSpacingLarge,
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          KbottomSheet.show(
                            height: 370,
                            context: context,
                            text: 'select color',
                            child: ListView(
                              children: [
                                Wrap(
                                  spacing: 16,
                                  runSpacing:
                                      Kdimensions.verticleSpacingSmall.unit,
                                  children: loadColors
                                      .map(
                                        (c) => InkWell(
                                          onTap: () {
                                            setBuilderState(() {
                                              colorValue = c;
                                              Navigator.of(context).pop();
                                            });
                                          },
                                          child: CircleAvatar(
                                            backgroundColor: Color(c),
                                            radius: 18,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 16.0,
                          ),
                          primary: Colors.white,
                          shape: Kdimensions.roundBorderSmall,
                          side: const BorderSide(
                            width: .5,
                            color: Colors.grey,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Color'),
                            colorValue != -1
                                ? SizedBox(
                                    height: 20,
                                    child: CircleAvatar(
                                      backgroundColor: Color(colorValue),
                                      radius: 18,
                                    ),
                                  )
                                : const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Kdimensions.horizontalSpacingLarge,
                    FloatingActionButton(
                      heroTag:
                          '${DateTime.now()}', //TODO:To be removed -> to stop hero animation
                      onPressed: () {},
                      mini: true,
                      backgroundColor: Kcolors.dark,
                      elevation: 8.0,
                      child: const Icon(
                        Icons.favorite_outline,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: Kdimensions.paddingAll,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title, style: KtextStyle.headline2),
                    Kdimensions.verticleSpacingSmall,
                    Text(product.subtitle ?? '', style: KtextStyle.subtitle),
                    Kdimensions.verticleSpacingSmall,
                    Stars(
                      rating: product.rating,
                      numOfRating: product.numOfRating,
                    ),
                  ],
                ),
                PriceTag(
                  newPrice: product.newPrice,
                  oldPrice: product.oldPrice,
                  large: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: Kdimensions.paddingAll,
            child: Text(product.description ?? ''),
          ),
          Kdimensions.verticleSpacing,
          const Divider(height: 0),
          ListTile(
            onTap: () {},
            title: const Text('Shipping info'),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          const Divider(height: 0),
          ListTile(
            onTap: () {},
            title: const Text('Support'),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          const Divider(height: 0),
          Kdimensions.verticleSpacing,
          Padding(
            padding: Kdimensions.paddingAll,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('You can also like this', style: KtextStyle.bodyText),
                Text('12 items', style: KtextStyle.subtitle),
              ],
            ),
          ),
          Padding(
            padding: Kdimensions.paddingAll,
            child: SizedBox(
              height: 264,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: loadProducts.length,
                separatorBuilder: (_, __) => const SizedBox(width: 18.0),
                itemBuilder: (context, i) => ProductCard(
                  product: loadProducts[i],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
