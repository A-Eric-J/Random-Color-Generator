import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_application/ui/shared/colors.dart';
import 'package:test_application/ui/widgets/text/text_view.dart';

class BottomNavigationItem extends StatelessWidget {
  final String label;
  final IconData iconData;
  final bool activated;

  const BottomNavigationItem(
      {Key? key,
      required this.label,
      required this.activated,
      required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (kIsWeb)
          SizedBox(
            height: width * 0.0266,
          ),
        Icon(
          iconData,
          color: activated ? brandMainColor : mainViewUnSelectedItemColor,
          size: width * 0.0426,
        ),
        TextView(
          text: label,
          size: 10,
          color: activated ? brandMainColor : mainViewUnSelectedItemColor,
        )
      ],
    );
  }
}
