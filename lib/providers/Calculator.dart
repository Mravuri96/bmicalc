import 'package:flutter/widgets.dart';

class Calculator with ChangeNotifier {
  static num _heightFT = 5,
      _heightIN = 7,
      _heightCM = 180,
      _weightLB = 170,
      _weightKG = 70;

  static bool _isMale = true, _isMetric = true;
  static List<bool> _unitMeasurement = <bool>[true, false];

  num get feet => _heightFT;

  num get inches => _heightIN;

  num get centimeters => _heightCM;

  num get kg => _weightKG;

  num get lb => _weightLB;

  bool get isMale => _isMale;

  bool get isMetric => _isMetric;

  List<bool> get units => _unitMeasurement;

  updateFeet(num x) {
    _heightFT = x;
    notifyListeners();
  }

  updateInches(num x) {
    _heightIN = x;
    notifyListeners();
  }

  updateCentimeters(num x) {
    _heightCM = x;
    notifyListeners();
  }

  updateKg(num x) {
    _weightKG = x;
    notifyListeners();
  }

  updateLB(num x) {
    _weightLB = x;
    notifyListeners();
  }

  updateIsMale(bool x) {
    _isMale = x;
    notifyListeners();
  }

  updateIsMetric(bool x) {
    _isMetric = x;
    notifyListeners();
  }

  updateUnitMeasuremensts(List<bool> x) {
    _unitMeasurement = x;
    notifyListeners();
  }

  double cmToMeters(int cm) => cm * .01;

  double calculateKgBmi() =>
      _weightKG / (cmToMeters(_heightCM) * cmToMeters(_heightCM));

  double calculateLbBmi() {
    final int _inches = (_heightFT * 12) + _heightIN;
    return (_weightLB / (_inches * _inches)) * 703;
  }
}
