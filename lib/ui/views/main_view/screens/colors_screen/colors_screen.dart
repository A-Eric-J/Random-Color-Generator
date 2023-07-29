import 'package:provider/provider.dart';
import 'package:test_application/providers/color_provider.dart';
import 'package:test_application/ui/shared/text.dart';
import 'package:test_application/ui/widgets/custom_tap_bar_view.dart';
import 'package:test_application/ui/widgets/emptiness_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:test_application/ui/widgets/views/main_view/colors_screen/gradient_color_list.dart';
import 'package:test_application/ui/widgets/views/main_view/colors_screen/pure_color_list.dart';

class ColorsScreen extends StatefulWidget {
  const ColorsScreen({super.key});

  @override
  State<ColorsScreen> createState() => _ColorsScreenState();
}

class _ColorsScreenState extends State<ColorsScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer<ColorProvider>(builder: (context, colorProvider, child) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          children: [
            CustomTabBarView(
              firstButton: pureColorText,
              secondButton: gradientColorText,
              isSecondButtonClicked: colorProvider.isSecondButtonColorChecked,
              onChanged: () => colorProvider.changingButtonColor(),
            ),
            SizedBox(
              height: width * 0.0213,
            ),
            !colorProvider.isSecondButtonColorChecked
                ? Expanded(
                    child: colorProvider.pureHexColorList.isEmpty
                        ? const EmptinessPlaceholder(
                            text: pureColorListIsEmptyText,
                          )
                        : PureColorList(
                            colorProvider: colorProvider,
                          ),
                  )
                : Expanded(
                    child: colorProvider.gradientHexColorList.isEmpty
                        ? const EmptinessPlaceholder(
                            text: gradientColorListIsEmptyText,
                          )
                        : GradientColorList(
                            colorProvider: colorProvider,
                          ),
                  )
          ],
        ),
      );
    });
  }
}
