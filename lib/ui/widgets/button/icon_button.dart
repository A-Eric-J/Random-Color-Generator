import 'package:flutter/material.dart';
import 'package:test_application/ui/shared/colors.dart';

/// Collection of IconButtons  that are using in your app

class InfoIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isFill;
  final Color? color;
  final double? size;

  const InfoIcon(
      {Key? key, this.onTap, this.isFill = true, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        isFill ? Icons.info : Icons.info_outline,
        size: size ?? width * 0.0533,
        color: color ?? primaryDark,
      ),
    );
  }
}

class ArrowForwardIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final double? size;

  const ArrowForwardIcon({Key? key, this.onTap, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Icon(
        Icons.arrow_forward_ios,
        color: color ?? primaryDark,
        size: size ?? width * 0.032,
      ),
    );
  }
}

class ArrowBackIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final double? size;

  const ArrowBackIcon({Key? key, this.onTap, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.arrow_back_ios_sharp,
        color: color ?? primaryDark,
        size: size ?? width * 0.032,
      ),
    );
  }
}

class ClosingIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const ClosingIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.close,
        size: width * 0.0533,
        color: backingIconColor,
      ),
    );
  }
}