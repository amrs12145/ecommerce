import 'package:flutter/material.dart';

import '../../../controller/main/product.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/dimensions.dart';
import '../../../shared/constants/text_styles.dart';
import 'scrollable.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kcolors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            collapsedHeight: MediaQuery.of(context).size.height * 0.20,
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            elevation: 6,
            pinned: true,
            flexibleSpace: Stack(
              fit: StackFit.expand,
              children: [
                const Image(
                  image: AssetImage("assets/images/HomeImg.png"),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 20,
                  bottom: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Fashion \nSale",
                        style: KtextStyle.headline,
                      ),
                      Kdimensions.verticleSpacing,
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Kcolors.primary,
                          shape: Kdimensions.roundBorder,
                          minimumSize: const Size(160, 36),
                        ),
                        child: Text('Check'.toUpperCase()),
                      ),
                      Kdimensions.verticleSpacing,
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: Kdimensions.paddingAll,
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Kdimensions.verticleSpacing,
                  Scroll(
                    title: 'Sale',
                    description: 'Super summer sale',
                    products: loadProducts,
                  ),
                  Kdimensions.verticleSpacingLarge,
                  Scroll(
                    title: 'New',
                    description: 'New offers',
                    products: loadProducts,
                  ),
                  Kdimensions.verticleSpacingLarge,
                  Scroll(
                    title: 'Exclusive',
                    description: 'Exclusive for you',
                    products: loadProducts,
                  ),
                  Kdimensions.verticleSpacingLarge,
                  Scroll(
                    title: 'Classic',
                    description: 'Exclusive for you',
                    products: loadProducts,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
