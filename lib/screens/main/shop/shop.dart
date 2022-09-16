import 'package:ecommerce/core/sized_box.dart';
import 'package:ecommerce/core/string_extension.dart';
import 'package:ecommerce/models/main/shop/category.dart';
import 'package:ecommerce/net/product.dart';
import 'package:ecommerce/net/tag.dart';
import 'package:ecommerce/screens/main/home/product.dart';
import 'package:ecommerce/shared/constants/colors.dart';
import 'package:ecommerce/shared/constants/dimensions.dart';
import 'package:ecommerce/shared/constants/text_styles.dart';
import 'package:ecommerce/shared/widgets/bottom_sheet.dart';
import 'package:ecommerce/shared/widgets/price.dart';
import 'package:ecommerce/shared/widgets/stars.dart';
import 'package:flutter/material.dart';

import '../../../models/main/shop/sort_by.dart';
import '../../../models/main/shop/tag.dart';
import '../../../shared/widgets/chips.dart';

class Shop extends StatefulWidget {
  final CategoryEnum category;
  final Tag tag;

  const Shop({
    Key? key,
    required this.category,
    required this.tag,
  }) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  bool _switchScreenView = true;
  SortBy? _sortBy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kcolors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              expandedHeight: 120,
              centerTitle: true,
              pinned: true,
              backgroundColor: Kcolors.background,
              // floating: true,
              // snap: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  '${widget.category.name} \'s ${widget.tag.name}'
                      .capitalize()
                      .replace_(),
                  textAlign: TextAlign.center,
                  style: KtextStyle.bodyText,
                ),
                centerTitle: true,
              ),
              actions: [
                Icon(Icons.search),
              ],
            ),
            SliverAppBar(
              elevation: 0,
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: Kcolors.background,
              toolbarHeight: 33,
              title: SizedBox(
                height: 33,
                child: Chips(
                  chips: getTag(category: widget.category)
                      .map((e) => e.name.replace_())
                      .toList(),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Kdimensions.verticleSpacing,
            ),
            SliverAppBar(
              elevation: 0,
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: Kcolors.background,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                    ),
                    icon: const Icon(Icons.filter_list),
                    label: const Text('Filters'),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      KbottomSheet.show(
                        context: context,
                        text: 'Sort by',
                        height: 500,
                        child: ListView.separated(
                          itemCount: SortBy.values.length,
                          separatorBuilder: (_, __) => const Divider(),
                          itemBuilder: (context, i) => TextButton(
                            onPressed: () {
                              setState(() {
                                _sortBy == SortBy.values[i]
                                    ? _sortBy = null
                                    : _sortBy = SortBy.values[i];
                                Navigator.of(context).pop();
                              });
                            },
                            style: TextButton.styleFrom(
                              // TODO:To use the background color instead of primary(late)
                              primary: _sortBy == SortBy.values[i]
                                  ? Kcolors.primary
                                  : Colors.white,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              '${SortBy.values[i].name.capitalize().replaceAll('_', ' ')}   ${_sortBy == SortBy.values[i] ? 'x' : ''}',
                            ),
                          ),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                    ),
                    icon: const Icon(Icons.sort),
                    label: const Text('Price: lowest to high'),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _switchScreenView = !_switchScreenView;
                      });
                    },
                    icon: const Icon(Icons.view_compact),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: Kdimensions.paddingAll,
              sliver: _switchScreenView
                  ? SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 264,
                        mainAxisSpacing: Kdimensions.verticleSpacingLarge.unit,
                        crossAxisSpacing: 16,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        childCount: loadProducts.length,
                        (context, i) {
                          return ProductItem(
                            width: 164,
                            product: loadProducts[i],
                          );
                        },
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        ((context, i) => Container(
                              height: 100,
                              margin: const EdgeInsets.only(
                                bottom: Kdimensions.marginUnit,
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Kcolors.dark,
                                  shape: Kdimensions.roundBorder,
                                  padding: EdgeInsets.zero,
                                ),
                                clipBehavior: Clip.none,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(
                                            Kdimensions.borderUnit,
                                          ),
                                        ),
                                        child: Image.network(
                                          loadProducts[i].mainImgUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: Kdimensions.paddingAll / 2.0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              loadProducts[i].title,
                                              style: KtextStyle.bodyText,
                                            ),
                                            Kdimensions.verticleSpacingSmall,
                                            Text(
                                              loadProducts[i].description ?? '',
                                              style: KtextStyle.subtitle,
                                            ),
                                            Kdimensions.verticleSpacingSmall,
                                            Kdimensions.verticleSpacingSmall,
                                            Stars(
                                              rating: loadProducts[i].rating,
                                              numOfRating:
                                                  loadProducts[i].numOfRating,
                                            ),
                                            Kdimensions.verticleSpacingSmall,
                                            Kdimensions.verticleSpacingSmall,
                                            PriceTag(
                                              newPrice:
                                                  loadProducts[i].newPrice,
                                              oldPrice:
                                                  loadProducts[i].oldPrice,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        childCount: loadProducts.length,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
