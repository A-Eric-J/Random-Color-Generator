import 'package:flutter/material.dart';
import 'package:test_application/const_values/route_paths.dart';
import 'package:test_application/locator.dart';
import 'package:test_application/services/navigation_service.dart';
import 'package:test_application/services/shared_preference_service/shared_preference.dart';
import 'package:test_application/ui/shared/colors.dart';
import 'package:test_application/ui/shared/text.dart';
import 'package:test_application/ui/widgets/button/icon_button.dart';
import 'package:test_application/ui/widgets/text/text_view.dart';

class Header extends StatelessWidget {
  final VoidCallback onBack;
  final int pageNumber;

  const Header({
    super.key,
    required this.onBack,
    required this.pageNumber,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ArrowBackIcon(
          color: black,
          size: width * 0.0533,
          onTap: onBack,
        ),
        pageNumber == 1
            ? SizedBox(
                height: width * 0.0533,
              )
            : TextView(
                text: skipText,
                color: brandMainColor,
                size: 14,
                onTap: () {
                  /// when we tap on skip it stores false to setHasOnBoardingPage that
                  /// it means we do not visit onBoardings
                  SharedPreference.setHasOnBoardingPage(false);
                  locator<NavigationService>()
                      .navigateTo(RoutePaths.mainViewPath, pushReplacement: true);
                },
              ),
      ],
    );
  }
}
