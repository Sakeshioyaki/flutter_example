import 'dart:math';

import 'package:flutter/foundation.dart';

class MyProviderController2 extends ChangeNotifier {
  final List<bool> items = [];
  int countCheck = 0;
  void randomBool() {
    items.add(Random().nextBool());
    notifyListeners();
  }

  void addCount() {
    countCheck += 1;
    notifyListeners();
  }
}
