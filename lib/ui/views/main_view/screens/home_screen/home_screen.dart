import 'package:test_application/enums/gradient_type.dart';
import 'package:test_application/ui/shared/text.dart';
import 'package:test_application/ui/widgets/gradient.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      requestToServer();
    });
  }

  void requestToServer({bool isRefresh = false}) async {
    /// put your own api service request here
  }

  @override
  Widget build(BuildContext context) {
    return const MainGradient(
      gradientType: GradientType.homeScreen,
      child: Center(
        child: TextView(text: homeScreenText, size: 20),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
