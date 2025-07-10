import 'package:flutter/cupertino.dart';

class SplashViewModel extends ChangeNotifier {
  bool _isSplashDone = false;

  bool get isSplashDone => _isSplashDone;

  SplashViewModel() {
    _startSplashTimer();
  }

  void _startSplashTimer() async {
    await Future.delayed(const Duration(seconds: 5));
    _isSplashDone = true;
    notifyListeners();
  }
}
