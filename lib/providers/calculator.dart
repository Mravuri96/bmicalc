import 'package:flutter/widgets.dart' show ChangeNotifier;

class Calculator extends ChangeNotifier {
  double _heightFT = 5,
      _heightIN = 7,
      _heightCM = 180,
      _weightLB = 170,
      _weightKG = 70;

  bool _isMale = true, _isMetric = true;
  List<bool> _unitMeasurement = <bool>[true, false];

  double get feet => _heightFT;

  double get inches => _heightIN;

  double get centimeters => _heightCM;

  double get kg => _weightKG;

  double get lb => _weightLB;

  bool get isMale => _isMale;

  bool get isMetric => _isMetric;

  List<bool> get units => _unitMeasurement;

  void updateFeet(double x) {
    _heightFT = x;
    notifyListeners();
  }

  void updateInches(double x) {
    _heightIN = x;
    notifyListeners();
  }

  void updateCentimeters(double x) {
    _heightCM = x;
    notifyListeners();
  }

  void updateKg(double x) {
    _weightKG = x;
    notifyListeners();
  }

  void updateLB(double x) {
    _weightLB = x;
    notifyListeners();
  }

  void updateIsMale({bool x}) {
    _isMale = x;
    notifyListeners();
  }

  void updateIsMetric({bool x}) {
    _isMetric = x;
    notifyListeners();
  }

  void updateUnitMeasuremensts(List<bool> x) {
    _unitMeasurement = x;
    notifyListeners();
  }

  double cmToMeters(double cm) => cm * .01;

  double calculateKgBmi() =>
      _weightKG / (cmToMeters(_heightCM) * cmToMeters(_heightCM));

  double calculateLbBmi() {
    final _inches = (_heightFT * 12) + _heightIN;
    return (_weightLB / (_inches * _inches)) * 703;
  }
}
