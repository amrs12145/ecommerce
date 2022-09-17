// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce/core/sized_box.dart';
import 'package:ecommerce/core/string_extension.dart';
import 'package:ecommerce/models/main/shop/category.dart';
import 'package:ecommerce/net/product.dart';
import 'package:ecommerce/net/tag.dart';
import 'package:ecommerce/screens/main/home/product.dart';
import 'package:ecommerce/shared/constants/colors.dart';
import 'package:ecommerce/shared/constants/dimensions.dart';
import 'package:ecommerce/shared/constants/text_styles.dart';
import 'package:ecommerce/shared/widgets/price.dart';
import 'package:ecommerce/shared/widgets/stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/main/shop/tag.dart';
import '../../../shared/widgets/chips.dart';
import '../../../shared/widgets/navbar/Bloc/cubit.dart';
import '../../../shared/widgets/navbar/Bloc/states.dart';

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
  bool _switch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocConsumer<NavbarCubit, NavbarStates>(
        listener: (context, state) => {},
        builder: (context, state) {
          NavbarCubit cubit = NavbarCubit.get(context);

          return BottomNavigationBar(
            backgroundColor: Kcolors.dark,
            elevation: 11,
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex,
            selectedItemColor: Kcolors.primary,
            items: [
              BottomNavigationBarItem(
                icon: cubit.currentIndex == 0
                    ? SvgPicture.asset("assets/icons/Selected_bot_home.svg")
                    : SvgPicture.asset("assets/icons/Bot_bar_home.svg"),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: cubit.currentIndex == 1
                    ? SvgPicture.asset("assets/icons/Selected_bot_shop.svg")
                    : SvgPicture.asset("assets/icons/Bot_bar_Shop.svg"),
                label: "Shop",
              ),
              BottomNavigationBarItem(
                icon: cubit.currentIndex == 2
                    ? SvgPicture.asset("assets/icons/Selected_bot_cart.svg")
                    : SvgPicture.asset("assets/icons/Bot_bar_cart.svg"),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: cubit.currentIndex == 3
                    ? SvgPicture.asset("assets/icons/Selected_bot_heart.svg")
                    : SvgPicture.asset("assets/icons/Bot_bar_heart.svg"),
                label: "Favorites",
              ),
              BottomNavigationBarItem(
                icon: cubit.currentIndex == 4
                    ? SvgPicture.asset("assets/icons/Selected_bot_profile.svg")
                    : SvgPicture.asset("assets/icons/Bot_bar_profile.svg"),
                label: "Profile",
              ),
            ],
            onTap: (index) {
              cubit.changeNavbarState(index);

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return cubit.screens[cubit.currentIndex];
              //     },
              //   ),
              // );
            },
          );
        },
      ),
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
            SliverToBoxAdapter(
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
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.filter_list),
                    label: Text('Filters'),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                    ),
                    icon: Icon(Icons.sort),
                    label: Text('Price: lowest to high'),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _switch = !_switch;
                      });
                    },
                    icon: Icon(Icons.view_compact),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: Kdimensions.paddingAll,
              sliver: _switch
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
