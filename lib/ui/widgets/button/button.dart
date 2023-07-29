import 'package:flutter/material.dart';
import 'package:test_application/ui/shared/colors.dart';
import 'package:test_application/ui/widgets/text/text_view.dart';

/// [RectAngleButton] is a custom button that we are using in your app
class RectAngleButton extends StatelessWidget {
  final String nameOfButton;
  final Color? color;
  final Color? borderColor;
  final Color? shadowColor;
  final double? height;
  final double? width;
  final double? radius;
  final VoidCallback? onTap;
  final Color? textColor;
  final double? textSize;

  const RectAngleButton({
    Key? key,
    required this.nameOfButton,
    this.color,
    this.height,
    this.width,
    required this.onTap,
    this.radius,
    this.borderColor,
    this.shadowColor,
    this.textColor,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
          height: height ?? width * 0.1466,
          width: this.width,
          decoration: BoxDecoration(
            color: color ?? brandMainColor,
            borderRadius: BorderRadius.circular(radius ?? width * 0.032),
            border: Border.all(color: borderColor ?? Colors.transparent),
            boxShadow: [
              BoxShadow(
                color: shadowColor ?? Colors.transparent,
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: TextView(
              text: nameOfButton,
              color: textColor ?? white,
              size: textSize ?? 15,
            ),
          )),
    );
  }
}

