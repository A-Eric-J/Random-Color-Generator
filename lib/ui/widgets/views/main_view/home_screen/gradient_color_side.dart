import 'package:flutter/material.dart';
import 'package:test_application/const_values/assets.dart';
import 'package:test_application/models/gradient_color.dart';
import 'package:test_application/providers/color_provider.dart';
import 'package:test_application/ui/extensions/help_methods.dart';
import 'package:test_application/ui/shared/text.dart';
import 'package:test_application/ui/widgets/text/text_view.dart';

class GradientColorSide extends StatelessWidget {
  final ColorProvider colorProvider;
  const GradientColorSide({Key? key, required this.colorProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        var firstColor = getRandomHexColor();
        var secondColor = getRandomHexColor();
        var gradientColor = GradientColor(firstColor: firstColor, secondColor: secondColor);
        colorProvider.setGradientHexColor(gradientColor);
        colorProvider.addHexColorToGradientList(gradientColor);
      },
      child: Container(
        width: width,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ Color(int.parse(colorProvider.gradientHexColor?.firstColor ?? whiteHexColor)) , Color(int.parse(colorProvider.gradientHexColor?.secondColor ?? whiteHexColor))],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding:  EdgeInsets.all(width * 0.0213),
          child:  const TextView(text: tapToGenerateGradientColorText, size: 16),
        ),
      ),
    );
  }
}
