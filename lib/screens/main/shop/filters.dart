import 'package:ecommerce/net/brands.dart';
import 'package:ecommerce/shared/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/filters.dart';
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

class Filters extends StatelessWidget {
  Filters({Key? key}) : super(key: key);

  Map<String, dynamic> localFilters = {
    'range': <double>[],
    'colors': <int>[],
    'sizes': <String>[],
    'categories': <String>[],
    'brands': <String>[],
  };

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
        padding: Kdimensions.paddingBottomNavBar,
        child: Row(
          children: [
            Expanded(
              child: Kbutton(
                onPressed: () {
                  context.read<FilterCubit>().reset();
                },
                primary: Kcolors.background,
                text: 'Clear',
              ),
            ),
            Kdimensions.horizontalSpacing,
            Expanded(
              child: Kbutton(
                onPressed: () {
                  context.read<FilterCubit>().save(localFilters);
                  Navigator.of(context).pop();
                },
                primary: Kcolors.primary,
                text: 'Apply',
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<FilterCubit, FilterStates>(
        builder: (context, state) {
          localFilters = context.read<FilterCubit>().getFilters();

          return ListView(
            padding: Kdimensions.paddingAll,
            children: [
              Kdimensions.verticleSpacing,
              const Text(
                'Price range',
                style: KtextStyle.bodyText,
              ),
              Kdimensions.verticleSpacing,
              KmultiSlider(
                min: 0,
                max: 100,
                range: localFilters['range'],
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
                children: [
                  Kcolor(
                    color: Colors.black,
                    colors: localFilters['colors'],
                  ),
                  Kcolor(
                    color: Colors.white,
                    colors: localFilters['colors'],
                  ),
                  Kcolor(
                    color: Colors.orange,
                    colors: localFilters['colors'],
                  ),
                  Kcolor(
                    color: Colors.grey,
                    colors: localFilters['colors'],
                  ),
                  Kcolor(
                    color: Colors.green,
                    colors: localFilters['colors'],
                  ),
                  Kcolor(
                    color: Colors.lightBlue,
                    colors: localFilters['colors'],
                  ),
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
                children: [
                  KoutlinedButton(
                    text: 'XS',
                    selected: localFilters['sizes'],
                  ),
                  KoutlinedButton(
                    text: 'S',
                    selected: localFilters['sizes'],
                  ),
                  KoutlinedButton(
                    text: 'M',
                    selected: localFilters['sizes'],
                  ),
                  KoutlinedButton(
                    text: 'L',
                    selected: localFilters['sizes'],
                  ),
                  KoutlinedButton(
                    text: 'XL',
                    selected: localFilters['sizes'],
                  ),
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
                children: [
                  KoutlinedButton(
                    width: 100,
                    text: 'all',
                    selected: localFilters['categories'],
                  ),
                  KoutlinedButton(
                    width: 100,
                    text: 'men',
                    selected: localFilters['categories'],
                  ),
                  KoutlinedButton(
                    width: 100,
                    text: 'women',
                    selected: localFilters['categories'],
                  ),
                  KoutlinedButton(
                    width: 100,
                    text: 'boys',
                    selected: localFilters['categories'],
                  ),
                  KoutlinedButton(
                    width: 100,
                    text: 'girls',
                    selected: localFilters['categories'],
                  ),
                ],
              ),
              Kdimensions.verticleSpacing,
              const Divider(),
              StatefulBuilder(
                builder: (context, setBuilderState) => ListTile(
                  title: const Text('Brand'),
                  subtitle: (localFilters['brands'] as List).isEmpty
                      ? const Text('choose brand')
                      : Text(localFilters['brands'].join(', ')),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    final List<String> brands = [...localFilters['brands']];

                    KbottomSheet.show(
                      context: context,
                      text: 'Choose Brand',
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
                              onPressed: () {
                                localFilters['brands'] = [...brands];
                                setBuilderState(() {});
                                Navigator.of(context).pop();
                              },
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
                              children: [
                                Kdimensions.verticleSpacing,
                                ...getBrands()
                                    .map(
                                      (e) => KcheckBox(
                                        text: e,
                                        selected: brands,
                                      ),
                                    )
                                    .toList(),
                              ],
                            ),
                          ),
                          Kdimensions.verticleSpacing,
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
