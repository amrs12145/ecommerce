import 'package:flutter/material.dart';
import 'package:flutter_multi_slider/flutter_multi_slider.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';

class KmultiSlider extends StatefulWidget {
  const KmultiSlider({
    Key? key,
    required this.min,
    required this.max,
  }) : super(key: key);

  final double min;
  final double max;

  @override
  State<KmultiSlider> createState() => _KmultiSliderState();
}

class _KmultiSliderState extends State<KmultiSlider> {
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
            setState(() => _values = values);
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
