import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier{

  String? _hexColor;

  void setHexColor(String newHexColor){
    _hexColor = newHexColor;
    notifyListeners();
  }

  String? get hexColor => _hexColor;

  final List<String> _hexColorList = [];

  void addHexColorToList(String newHexColor){
    _hexColorList.add(newHexColor);
    notifyListeners();
  }

  void removeHexColorFromList(String existedHexColor){
    _hexColorList.remove(existedHexColor);
    notifyListeners();
  }

  List<String> get hexColorList => _hexColorList;

}