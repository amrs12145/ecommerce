import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  const Stars({
    Key? key,
    this.rating,
    this.numOfRating,
  }) : super(key: key);

  final double? rating;
  final int? numOfRating;

  // TODO:to handle the rating logic

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Color(0xffFFBA49),
          size: 16,
        ),
        const Icon(
          Icons.star,
          color: Color(0xffFFBA49),
          size: 16,
        ),
        const Icon(
          Icons.star,
          color: Color(0xffFFBA49),
          size: 16,
        ),
        const Icon(
          Icons.star,
          color: Color(0xffFFBA49),
          size: 16,
        ),
        const Icon(
          Icons.star,
          color: Color(0xffFFBA49),
          size: 16,
        ),
        Text(
          ' (${numOfRating ?? 0})',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
