
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:test_application/providers/main_screen_provider.dart';

/// provider_setup initializes the providers that are using in your app
List<SingleChildWidget> providers = [
  ...independentServices,
  /// if you had another SingleChildWidget List you can add here
];

/// you should add your providers here to use
List<SingleChildWidget> independentServices = [
  ListenableProvider.value(value: MainScreenProvider()),

];

