import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';
import 'button.dart';
import 'screen_divider.dart';

class KbottomSheet {
  static Future show({
    required BuildContext context,
    required String text,
    required Widget child,
    Widget? buttons,
    double? height,
  }) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: height ?? MediaQuery.of(context).size.height * .80,
          padding: Kdimensions.paddingAll,
          decoration: const BoxDecoration(
            color: Kcolors.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Column(
            children: [
              Kdimensions.verticleSpacing,
              ScreenDivider(text: text),
              Kdimensions.verticleSpacing,
              Expanded(
                child: Padding(
                  padding: Kdimensions.paddingAll,
                  child: child,
                ),
              ),
              buttons ??
                  Kbutton(
                    text: 'Cancel',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    primary: Kcolors.cancel,
                  ),
              Kdimensions.verticleSpacing,
            ],
          ),
        );
      },
    );
  }
}
