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
  precacheImage(const AssetImage(Assets.defaultHero), context);
  precacheImage(const AssetImage(Assets.placeHolder), context);

  /// you can add images here
}


/// you can use the snackBar as well
void snackBar(String text, context,
    {GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey, Color? color}) {
  if (scaffoldMessengerKey != null) {
    scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 1500),
      content: TextView(
        text: text,
        color: color ?? white,
        size: 12,
      ),
    ));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 1500),
      content: TextView(
        text: text,
        color: color ?? white,
        size: 12,
      ),
    ));
  }
}
