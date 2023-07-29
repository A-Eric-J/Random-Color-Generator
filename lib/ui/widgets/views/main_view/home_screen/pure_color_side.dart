import 'package:flutter/material.dart';
import 'package:test_application/const_values/assets.dart';
import 'package:test_application/providers/color_provider.dart';
import 'package:test_application/ui/extensions/help_methods.dart';
import 'package:test_application/ui/shared/text.dart';
import 'package:test_application/ui/widgets/text/text_view.dart';

class PureColorSide extends StatelessWidget {
  final ColorProvider colorProvider;

  const PureColorSide({Key? key, required this.colorProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        var color = getRandomHexColor();
        colorProvider.setPureHexColor(color);
        colorProvider.addHexColorToPureList(color);
      },
      child: Container(
        width: width,
        alignment: Alignment.topCenter,
        color: Color(int.parse(colorProvider.pureHexColor ?? whiteHexColor)),
        child: Padding(
          padding: EdgeInsets.all(width * 0.0213),
          child: const TextView(text: tapToGeneratePureColorText, size: 16),
        ),
      ),
    );
  }
}
