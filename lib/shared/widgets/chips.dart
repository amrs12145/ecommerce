import 'package:flutter/material.dart';
import '../../core/string_extension.dart';
import '../constants/dimensions.dart';

class Chips extends StatelessWidget {
  const Chips({
    Key? key,
    required this.chips,
  }) : super(key: key);

  final List<String> chips;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: chips.length,
      separatorBuilder: (context, index) => Kdimensions.horizontalSpacing,
      itemBuilder: (context, i) => Chip(
        labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        backgroundColor: Colors.white,
        label: Text(
          chips[i].capitalize(),
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
