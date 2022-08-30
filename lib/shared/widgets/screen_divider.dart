import 'package:ecommerce/shared/constants/text_styles.dart';
import 'package:flutter/material.dart';

class ScreenDivider extends StatelessWidget {
  const ScreenDivider({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 4, indent: 8, endIndent: 8)),
        Text(text, style: KtextStyle.bodyText),
        const Expanded(child: Divider(thickness: 4, indent: 8, endIndent: 8)),
      ],
    );
  }
}
