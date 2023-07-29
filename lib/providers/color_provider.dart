import 'package:flutter/material.dart';
import 'package:test_application/models/gradient_color.dart';

/// [ColorProvider] is a provider for Pure and Gradient Colors

class ColorProvider extends ChangeNotifier{

  /// Pure Colors
  String? _pureHexColor;

  void setPureHexColor(String newHexColor){
    _pureHexColor = newHexColor;
    notifyListeners();
  }

  String? get pureHexColor => _pureHexColor;

  final List<String> _pureHexColorList = [];

  void addHexColorToPureList(String newHexColor){
    _pureHexColorList.add(newHexColor);
    notifyListeners();
  }

  void removeHexColorFromPureList(String existedHexColor){
    _pureHexColorList.remove(existedHexColor);
    notifyListeners();
  }

  List<String> get pureHexColorList => _pureHexColorList;


  /// Gradient Colors

  GradientColor? _gradientHexColor;

  void setGradientHexColor(GradientColor newHexColor){
    _gradientHexColor = newHexColor;
    notifyListeners();
  }

  GradientColor? get gradientHexColor => _gradientHexColor;

  final List<GradientColor> _gradientHexColorList = [];

  void addHexColorToGradientList(GradientColor newHexColor){
    _gradientHexColorList.add(newHexColor);
    notifyListeners();
  }

  void removeHexColorFromGradientList(GradientColor existedHexColor){
    _gradientHexColorList.remove(existedHexColor);
    notifyListeners();
  }

  List<GradientColor> get gradientHexColorList => _gradientHexColorList;


  /// ColorScreen TabBar

  var _isSecondButtonColorChecked = false;

  void changingButtonColor(){
    _isSecondButtonColorChecked = !_isSecondButtonColorChecked;
    notifyListeners();
  }

  bool get isSecondButtonColorChecked => _isSecondButtonColorChecked;

}