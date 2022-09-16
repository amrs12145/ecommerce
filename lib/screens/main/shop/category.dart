import 'package:ecommerce/screens/main/shop/shop.dart';
import 'package:flutter/material.dart';

import '/core/string_extension.dart';
import '/net/departments.dart';
import '/net/tag.dart';
import '/models/main/shop/category.dart';
import '/shared/widgets/bottom_sheet.dart';
import '/shared/constants/colors.dart';
import '/shared/constants/dimensions.dart';
import '/shared/constants/text_styles.dart';
import '/shared/widgets/button.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: CategoryEnum.values.length,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Kcolors.background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          // leading: Icon(Icons.arrow_back_ios),
          automaticallyImplyLeading: false,
          title: const Text('Categories'),
          actions: const [
            Icon(Icons.search),
          ],
          bottom: TabBar(
            indicatorColor: Kcolors.primary,
            tabs: CategoryEnum.values
                .map(
                  (e) => Tab(
                    child: Text(
                      e.name.capitalize(),
                      style: KtextStyle.bodyText,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        body: Padding(
          padding: Kdimensions.paddingAll,
          child: TabBarView(
            children: CategoryEnum.values
                .map(
                  (category) => SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 90,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Kcolors.primary,
                              borderRadius: Kdimensions.borderAll,
                            ),
                            child: Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Summer Sale\n'.toUpperCase(),
                                      style: KtextStyle.headline.copyWith(
                                        fontSize: 24,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: 'Up to 50% off',
                                      style: KtextStyle.bodyText,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Kdimensions.verticleSpacing,
                        ...getDepartment(category: category)
                            .map(
                              (department) => Container(
                                height: 100,
                                margin: const EdgeInsets.only(
                                  bottom: Kdimensions.marginUnit,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Kcolors.dark,
                                    shape: Kdimensions.roundBorder,
                                    padding: const EdgeInsets.only(
                                      left: 26.0,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          department.name.capitalize(),
                                          style: KtextStyle.bodyText,
                                        ),
                                      ),
                                      Expanded(
                                        child: Image.network(
                                          department.imgUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        Kbutton(
                          onPressed: () {
                            final tags = getTag(category: category);

                            KbottomSheet.show(
                              context: context,
                              text: 'Choose Category',
                              child: ListView.separated(
                                itemCount: tags.length,
                                separatorBuilder: (_, __) => const Divider(),
                                itemBuilder: (context, i) => TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Shop(
                                          category: category,
                                          tag: tags[i],
                                        ),
                                      ),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Text(
                                    tags[i].name.capitalize().replace_(),
                                  ),
                                ),
                              ),
                            );
                          },
                          text: 'View all items',
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
