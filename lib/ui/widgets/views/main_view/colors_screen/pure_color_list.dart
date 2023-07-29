import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_application/providers/color_provider.dart';
import 'package:test_application/ui/extensions/help_methods.dart';
import 'package:test_application/ui/shared/colors.dart';
import 'package:test_application/ui/shared/text.dart';
import 'package:test_application/ui/widgets/blog.dart';
import 'package:test_application/ui/widgets/button/icon_button.dart';
import 'package:test_application/ui/widgets/text/text_view.dart';

class PureColorList extends StatelessWidget {
  final ColorProvider colorProvider;
  const PureColorList({Key? key, required this.colorProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: colorProvider.pureHexColorList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: width * 0.018),
          child: Stroke(
            radius: width * 0.0266,
            borderWidth: 5,
            backgroundColor:
            Color(int.parse(colorProvider.pureHexColorList[index])),
            boxShadow:  const BoxShadow(
              color: cardBackgroundButtonColor,
              spreadRadius: 1,
              blurRadius: 9,
              offset: Offset(1, 2),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: width * 0.03, horizontal: width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextView(
                      text:
                      '${index + 1}: ${colorProvider.pureHexColorList[index]}',
                      size: 14,
                      color: isWhiteOrNearWhite(
                          colorProvider.pureHexColorList[index])
                          ? primaryDark
                          : white,
                    ),
                  ),
                  Row(
                    children: [
                      AddToClipBoardIcon(
                        color: primaryDark,
                        onTap: () => Clipboard.setData(ClipboardData(
                            text: colorProvider
                                .pureHexColorList[index]))
                            .then((_) {
                          snackBar(
                              pureColorClipBoardText,
                              context,
                              backgroundColor: isWhiteOrNearWhite(colorProvider
                                  .pureHexColorList[index]) ? primaryDark :Color(int.parse(colorProvider
                                  .pureHexColorList[index])));
                        }),
                      ),
                      SizedBox(
                        width: width * 0.0213,
                      ),
                      DeleteIcon(
                        color: softRedColor,
                        onTap: () =>
                            colorProvider.removeHexColorFromPureList(
                                colorProvider.pureHexColorList[index]),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
