import 'package:flutter/material.dart';
import 'package:test_application/ui/shared/colors.dart';
import 'package:test_application/ui/widgets/blog.dart';

/// Collection of IconButtons that are using in your app

class DeleteIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isFill;
  final Color? color;
  final double? size;

  const DeleteIcon(
      {Key? key, this.onTap, this.isFill = true, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Stroke(
      radius: width * 0.06,
      backgroundColor: white,
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.all(width * 0.0213),
        child: Icon(
          isFill ? Icons.delete : Icons.delete_outline_outlined,
          size: size ?? width * 0.0533,
          color: color ?? primaryDark,
        ),
      ),
    );
  }
}

class AddToClipBoardIcon extends StatelessWidget {
final VoidCallback? onTap;
final Color? color;
final double? size;

const AddToClipBoardIcon(
    {Key? key, this.onTap, this.color, this.size})
    : super(key: key);

@override
Widget build(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  return Stroke(
    radius: width * 0.06,
    backgroundColor: white,
    onTap: onTap,
    child: Padding(
      padding:  EdgeInsets.all(width * 0.0213),
      child: Icon(
        Icons.copy,
        size: size ?? width * 0.0533,
        color: color ?? primaryDark,
      ),
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
