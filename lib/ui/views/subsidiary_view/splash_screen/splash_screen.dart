import 'package:flutter/material.dart';
import 'package:test_application/const_values/assets.dart';
import 'package:test_application/const_values/route_paths.dart';
import 'package:test_application/locator.dart';
import 'package:test_application/models/debouncer.dart';
import 'package:test_application/services/navigation_service.dart';
import 'package:test_application/services/shared_preference_service/shared_preference.dart';
import 'package:test_application/ui/shared/colors.dart';
import 'package:test_application/ui/shared/text.dart';
import 'package:test_application/ui/widgets/blog.dart';
import 'package:test_application/ui/widgets/text/text_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// This means that the [SplashScreen] waits for 2 seconds
  static final DeBouncer splashDeBouncer = DeBouncer(milliseconds: 2000);

  @override
  void initState() {
    super.initState();
    navigateTo();
  }

  void navigateTo() {
    splashDeBouncer.run(() {
      /// checking that we should visit onBoarding or not
      SharedPreference.hasOnBoardingPage()
          ? locator<NavigationService>().navigateTo(
              RoutePaths.onBoardingPath,
              pushReplacement: true,
            )
          :
         locator<NavigationService>().navigateTo(
                  RoutePaths.mainViewPath,
                  pushReplacement: true,
                );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              SizedBox(
                width: width,
                height: height,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                        ImageAndIconFill(
                          path: Assets.logo,
                          width: width * 0.3093,
                          height: width * 0.3413,
                        ),
                        SizedBox(
                          height: width * 0.0533,
                        ),
                        const TextView(
                          text: welcomeToTheAppText,
                          size: 20,
                          color: primaryDark,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      Padding(
                        padding: EdgeInsets.all(width * 0.04),
                        child: const TextView(
                          text: currentAppVersion,
                          size: 12,
                          color: primaryGray,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
