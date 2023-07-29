import 'package:provider/provider.dart';
import 'package:test_application/providers/color_provider.dart';
import 'package:test_application/ui/shared/colors.dart';
import 'package:test_application/ui/shared/text.dart';
import 'package:test_application/ui/widgets/blog.dart';
import 'package:test_application/ui/widgets/text/text_view.dart';
import 'package:flutter/material.dart';
import 'package:test_application/ui/widgets/views/main_view/home_screen/gradient_color_side.dart';
import 'package:test_application/ui/widgets/views/main_view/home_screen/pure_color_side.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer<ColorProvider>(builder: (context, colorProvider, child) {
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            children: [
              Expanded(
                  child: PureColorSide(
                colorProvider: colorProvider,
              )),
              SizedBox(
                  width: width,
                  height: 1,
                  child: const Divider(
                    thickness: 1,
                    color: primaryGray,
                  )),
              Expanded(
                child: GradientColorSide(colorProvider: colorProvider),
              ),
            ],
          ),
          Stroke(
              radius: width * 0.0213,
              backgroundColor: white,
              child: Padding(
                padding: EdgeInsets.all(width * 0.0213),
                child: const TextView(
                  text: helloThereText,
                  size: 20,
                  color: primaryDark,
                ),
              )),
        ],
      );
    });
  }
}
