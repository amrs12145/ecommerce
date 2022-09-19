import 'package:ecommerce/shared/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../../core/sized_box.dart';
import '../../../shared/constants/dimensions.dart';
import '../../../shared/constants/text_styles.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/check_box.dart';
import '../../../shared/widgets/form_field.dart';
import '../../../shared/widgets/multi_slider.dart';
import '../../../shared/widgets/color.dart';
import '../../../shared/widgets/outlined_button.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kcolors.background,
      appBar: AppBar(
        title: const Text('Filters'),
        centerTitle: true,
        backgroundColor: Kcolors.background,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Kdimensions.verticleSpacingLarge.unit,
          horizontal: Kdimensions.paddingUnit,
        ),
        child: Row(
          children: [
            Expanded(
              child: Kbutton(
                onPressed: () {
                  setState(() {});
                },
                primary: Kcolors.background,
                text: 'Discard',
              ),
            ),
            Kdimensions.horizontalSpacing,
            Expanded(
              child: Kbutton(
                onPressed: () {},
                primary: Kcolors.primary,
                text: 'Apply',
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: Kdimensions.paddingAll,
        children: [
          Kdimensions.verticleSpacing,
          const Text(
            'Price range',
            style: KtextStyle.bodyText,
          ),
          Kdimensions.verticleSpacing,
          const KmultiSlider(
            min: 0,
            max: 100,
          ),
          Kdimensions.verticleSpacing,
          const Divider(),
          const Text(
            'Colors',
            style: KtextStyle.bodyText,
          ),
          Kdimensions.verticleSpacing,
          Wrap(
            spacing: 16,
            runSpacing: Kdimensions.verticleSpacingSmall.unit,
            children: const [
              Kcolor(color: Colors.black),
              Kcolor(color: Colors.white),
              Kcolor(color: Colors.orange),
              Kcolor(color: Colors.grey),
              Kcolor(color: Colors.green),
              Kcolor(color: Colors.lightBlue),
            ],
          ),
          Kdimensions.verticleSpacing,
          const Divider(),
          const Text(
            'Sizes',
            style: KtextStyle.bodyText,
          ),
          Kdimensions.verticleSpacing,
          Wrap(
            spacing: 16,
            runSpacing: Kdimensions.verticleSpacingSmall.unit,
            children: const [
              KoutlinedButton(text: 'XS'),
              KoutlinedButton(text: 'S'),
              KoutlinedButton(text: 'M'),
              KoutlinedButton(text: 'L'),
              KoutlinedButton(text: 'XL'),
            ],
          ),
          Kdimensions.verticleSpacing,
          const Divider(),
          const Text(
            'Category',
            style: KtextStyle.bodyText,
          ),
          Kdimensions.verticleSpacing,
          Wrap(
            spacing: 16,
            runSpacing: Kdimensions.verticleSpacingSmall.unit,
            children: const [
              KoutlinedButton(text: 'all', width: 100),
              KoutlinedButton(text: 'men', width: 100),
              KoutlinedButton(text: 'women', width: 100),
              KoutlinedButton(text: 'boys', width: 100),
              KoutlinedButton(text: 'girls', width: 100),
            ],
          ),
          Kdimensions.verticleSpacing,
          const Divider(),
          ListTile(
            onTap: () {
              KbottomSheet.show(
                context: context,
                text: 'Brand',
                buttons: Row(
                  children: [
                    Expanded(
                      child: Kbutton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        primary: Kcolors.background,
                        text: 'Cancel',
                      ),
                    ),
                    Kdimensions.horizontalSpacing,
                    Expanded(
                      child: Kbutton(
                        onPressed: () {},
                        primary: Kcolors.primary,
                        text: 'Apply',
                      ),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const KformField(
                      padding: EdgeInsets.zero,
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search, size: 20),
                      fillColor: Kcolors.dark,
                      border: OutlineInputBorder(
                        borderRadius: Kdimensions.borderAll,
                        borderSide: BorderSide.none,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: const [
                          Kdimensions.verticleSpacing,
                          KcheckBox(text: 'adidas'),
                          KcheckBox(text: 'adidas'),
                          KcheckBox(text: 'adidas'),
                          KcheckBox(text: 'adidas'),
                          KcheckBox(text: 'adidas'),
                        ],
                      ),
                    ),
                    Kdimensions.verticleSpacing,
                  ],
                ),
              );
            },
            title: const Text('Brand'),
            subtitle: const Text('adidas Originals, Jack & Jones, s.Oliver'),
            trailing: const Icon((Icons.arrow_forward_ios)),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
