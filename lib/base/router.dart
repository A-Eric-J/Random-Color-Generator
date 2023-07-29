import 'package:test_application/const_values/route_paths.dart';
import 'package:test_application/ui/views/main_view.dart';
import 'package:test_application/ui/views/subsidiary_view/onboarding_screen/onboarding.dart';
import 'package:test_application/ui/widgets/text/text_view.dart';
import 'package:flutter/material.dart';

/// All the Routes for navigating are placed here
class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.onBoardingPath:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case RoutePaths.mainViewPath:
        return MaterialPageRoute(builder: (_) => const MainView());

      /// this commented code is for when we need to pass data to our destination path and
      /// getting the data from settings.arguments
      // case RoutePaths.testScreenPath:
      //   var test = settings.arguments as TestModel;
      //   return MaterialPageRoute(builder: (_) => TestScreen(test: test,));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: TextView(
                      text: 'No route defined for ${settings.name}',
                      size: 16,
                    ),
                  ),
                ));
    }
  }
}
