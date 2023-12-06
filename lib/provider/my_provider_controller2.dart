import 'dart:math';

import 'package:flutter/foundation.dart';

class MyProviderController2 extends ChangeNotifier {
  final List<bool> items = [];
  void randomBool() {
    items.add(Random().nextBool());
    notifyListeners();
  }
}
