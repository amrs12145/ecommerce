import 'package:flutter/material.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/constants/dimensions.dart';
import '../../../shared/constants/text_styles.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Image(
                  image: AssetImage("assets/images/HomeImg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 20,
                bottom: 0,
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
                      child: const Text('Check'),
                    ),
                    Kdimensions.verticleSpacing,
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
