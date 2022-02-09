import 'package:flutter/material.dart';

class ShowSpinner with ChangeNotifier {

  bool _showLoginSpinner = false ;
  bool get showLoginSpinner => _showLoginSpinner;

  void setSpinner(bool spinner) {
    _showLoginSpinner = spinner ;
    notifyListeners();
  }


}