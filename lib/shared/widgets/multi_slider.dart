import 'package:flutter/material.dart';
import 'package:flutter_multi_slider/flutter_multi_slider.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';

class KmultiSlider extends StatefulWidget {
  const KmultiSlider({
    Key? key,
    required this.min,
    required this.max,
    required this.range,
  }) : super(key: key);

  final double min;
  final double max;
  final List<double> range;

  @override
  State<KmultiSlider> createState() => _KmultiSliderState();
}

class _KmultiSliderState extends State<KmultiSlider> {
  late List<double> value;

  @override
  Widget build(BuildContext context) {
    value = widget.range;
    if (value.isEmpty) {
      value.add(widget.min);
      value.add(widget.max);
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$${value.first.toInt().toString()}'),
            Text('\$${value.last.toInt().toString()}'),
          ],
        ),
        MultiSlider(
          onChanged: (values) {
            setState(() {
              value[0] = values[0];
              value[1] = values[1];
            });
          },
          values: [value.first, value.last],
          min: widget.min,
          max: widget.max,
          color: Kcolors.primary,
          horizontalPadding: Kdimensions.paddingUnit - 6,
        ),
      ],
    );
  }
}
