import 'dart:math';

import 'package:test_application/const_values/assets.dart';
import 'package:test_application/ui/shared/colors.dart';
import 'package:test_application/ui/widgets/text/text_view.dart';
import 'package:flutter/material.dart';

/// help_methods contains methods that are helping us (it's like a toolbox Lol;) ) in Ui and Services

/// this method is for preCaching local images
void preCacheImages(BuildContext context) {
  precacheImage(const AssetImage(Assets.logo), context);
  precacheImage(const AssetImage(Assets.firstOnBoardingPage), context);
  precacheImage(const AssetImage(Assets.secondOnBoardingPage), context);
  precacheImage(const AssetImage(Assets.thirdOnBoardingPage), context);
  precacheImage(const AssetImage(Assets.placeHolder), context);

  /// you can add images here
}


/// you can use the snackBar as well
void snackBar(String text, context,
    {GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey, Color? textColor , Color? backgroundColor}) {
  if (scaffoldMessengerKey != null) {
    scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      backgroundColor: backgroundColor,
      duration: const Duration(milliseconds: 1500),
      content: TextView(
        text: text,
        color: textColor ?? white,
        size: 12,
      ),
    ));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: backgroundColor,
      duration: const Duration(milliseconds: 1500),
      content: TextView(
        text: text,
        color: textColor ?? white,
        size: 12,
      ),
    ));
  }
}

String getRandomHexColor() {
  Random random = Random();
  /// Generate three random numbers between 0 and 255 for each RGB channel
  int r = random.nextInt(256);
  int g = random.nextInt(256);
  int b = random.nextInt(256);

  /// Create a hex color string in the format "#RRGGBB"
  String hexColor = '0xFF${r.toRadixString(16).padLeft(2, '0')}'
      '${g.toRadixString(16).padLeft(2, '0')}'
      '${b.toRadixString(16).padLeft(2, '0')}';
  return hexColor;
}

bool isWhiteOrNearWhite(String hexColor, {int threshold = 240}) {
  /// Remove the '0xFF' symbol from the hex color if it exists
  hexColor = hexColor.replaceAll('0xFF', '');

  /// Convert the hex color to RGB values
  int r = int.parse(hexColor.substring(0, 2), radix: 16);
  int g = int.parse(hexColor.substring(2, 4), radix: 16);
  int b = int.parse(hexColor.substring(4, 6), radix: 16);


  /// Check if all RGB channels are above the threshold
  return r >= threshold && g >= threshold && b >= threshold;
}
