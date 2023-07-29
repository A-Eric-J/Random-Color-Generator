import 'package:flutter/material.dart';
import 'package:test_application/ui/shared/colors.dart';
import 'package:test_application/ui/widgets/blog.dart';
import 'package:test_application/ui/widgets/button/button.dart';


class CustomTabBarView extends StatelessWidget {
  final String firstButton;
  final String secondButton;
  final bool isSecondButtonClicked;
  final VoidCallback onChanged;

  const CustomTabBarView(
      {Key? key,
      required this.firstButton,
      required this.secondButton,
      this.isSecondButtonClicked = false,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Stroke(
      borderWidth: 0,
      backgroundColor: outerTapBarColor,
      radius: width * 0.0266,
      width: width,
      child: Padding(
        padding: EdgeInsets.all(width * 0.0133),
        child: Row(
          children: [
            Expanded(
                child: RectAngleButton(
                  nameOfButton: firstButton,
                  textSize: 16,
                  textColor:
                  !isSecondButtonClicked ? primaryTextColor : primaryGray,
                  width: width,
                  height: width * 0.0986,
                  color: !isSecondButtonClicked ? white : outerTapBarColor,
                  onTap: onChanged,
                  radius: width * 0.0266,
                )),
            Expanded(
                child: RectAngleButton(
              nameOfButton: secondButton,
              textSize: 16,
              textColor: isSecondButtonClicked ? primaryTextColor : primaryGray,
              width: width,
              height: width * 0.0986,
              color: isSecondButtonClicked ? white : outerTapBarColor,
              onTap: onChanged,
              radius: width * 0.0266,
            )),
          ],
        ),
      ),
    );
  }
}
