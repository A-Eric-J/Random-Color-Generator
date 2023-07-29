import 'package:flutter/material.dart';
import 'package:test_application/const_values/assets.dart';
import 'package:test_application/ui/widgets/blog.dart';
import 'package:test_application/ui/widgets/text/text_view.dart';

class EmptinessPlaceholder extends StatelessWidget {
  final String? text;
  const EmptinessPlaceholder({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        const ImageAndIconFill(path: Assets.placeHolder),
        SizedBox(height: width * 0.0213,),
        if(text != null && text!.isNotEmpty)
         TextView(text: text!, size: 14),
      ],
    );
  }
}
