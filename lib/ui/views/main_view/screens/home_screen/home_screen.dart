import 'package:provider/provider.dart';
import 'package:test_application/const_values/assets.dart';
import 'package:test_application/providers/color_provider.dart';
import 'package:test_application/ui/extensions/help_methods.dart';
import 'package:test_application/ui/shared/colors.dart';
import 'package:test_application/ui/shared/text.dart';
import 'package:test_application/ui/widgets/text/text_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<ColorProvider>(
      builder: (context, colorProvider ,child) {
        return InkWell(
          onTap: (){
            var color = getRandomHexColor();
            colorProvider.setHexColor(color);
            colorProvider.addHexColorToList(color);
          },
          child: Container(
            color: Color(int.parse(colorProvider.hexColor ?? whiteHexColor)),
            child: Center(
              /// here I'm using isWhiteOrNearWhite to know that if the background color is white or near white,
              /// change the TextView color to primaryDark, else change it to white
              child: TextView(text: helloThereText, size: 20 , color: isWhiteOrNearWhite(colorProvider.hexColor ?? whiteHexColor) ? primaryDark : white,),
            ),
          ),
        );
      }
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

}
