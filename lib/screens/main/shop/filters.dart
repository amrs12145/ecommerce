import 'package:ecommerce/core/sized_box.dart';
import 'package:ecommerce/shared/constants/dimensions.dart';
import 'package:ecommerce/shared/constants/text_styles.dart';
import 'package:ecommerce/shared/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_slider/flutter_multi_slider.dart';

import '../../../shared/constants/colors.dart';

class Filters extends StatelessWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kcolors.background,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Kdimensions.verticleSpacingLarge.unit,
          horizontal: Kdimensions.paddingUnit,
        ),
        child: Row(
          children: [
            Expanded(
              child: Kbutton(
                onPressed: () {},
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
      appBar: AppBar(
        title: const Text('Filters'),
        centerTitle: true,
        backgroundColor: Kcolors.background,
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
          const NewWidget(min: 0, max: 100),
          Kdimensions.verticleSpacing,
          const Divider(),
          const Text(
            'Colors',
            style: KtextStyle.bodyText,
          ),
          Kdimensions.verticleSpacing,
          Wrap(
            spacing: 16,
            runSpacing: Kdimensions.verticleSpacing.unit,
            children: const [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 26,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 26,
              ),
              CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 26,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 26,
              ),
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 26,
              ),
              CircleAvatar(
                backgroundColor: Colors.cyan,
                radius: 26,
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
            runSpacing: Kdimensions.verticleSpacing.unit,
            children: [
              OutlinedButton(
                onPressed: () {},
                child: Text('XS'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  shape: Kdimensions.roundBorderSmall,
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('S'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  shape: Kdimensions.roundBorderSmall,
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('M'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  shape: Kdimensions.roundBorderSmall,
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('L'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  shape: Kdimensions.roundBorderSmall,
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('XL'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  shape: Kdimensions.roundBorderSmall,
                ),
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
            runSpacing: Kdimensions.verticleSpacing.unit,
            children: [
              OutlinedButton(
                onPressed: () {},
                child: Text('All'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  shape: Kdimensions.roundBorderSmall,
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('Men'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  shape: Kdimensions.roundBorderSmall,
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('Women'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  shape: Kdimensions.roundBorderSmall,
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('Boys'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  shape: Kdimensions.roundBorderSmall,
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('Girls'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  shape: Kdimensions.roundBorderSmall,
                ),
              ),
            ],
          ),
          Kdimensions.verticleSpacing,
          const Divider(),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Brand\n',
                        style: KtextStyle.bodyText,
                      ),
                      TextSpan(
                        text: 'adidas Originals, Jack & Jones, s.Oliver',
                        style: KtextStyle.subtitle,
                      ),
                    ],
                  ),
                ),
                const Icon((Icons.arrow_forward_ios)),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class NewWidget extends StatefulWidget {
  const NewWidget({
    Key? key,
    required this.min,
    required this.max,
  }) : super(key: key);

  final double min;
  final double max;

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  List<double>? _values;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: (_values == null)
              ? [
                  Text('\$${widget.min.toInt().toString()}'),
                  Text('\$${widget.max.toInt().toString()}'),
                ]
              : [
                  Text('\$${_values!.first.toInt().toString()}'),
                  Text('\$${_values!.last.toInt().toString()}'),
                ],
        ),
        MultiSlider(
          onChanged: (values) {
            setState(() {
              print(_values);
              _values = values;
            });
          },
          values: _values ?? [widget.min, widget.max],
          min: widget.min,
          max: widget.max,
          color: Kcolors.primary,
          horizontalPadding: Kdimensions.paddingUnit,
        ),
      ],
    );
  }
}
