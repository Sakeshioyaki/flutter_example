import 'dart:math';

import 'package:flutter/foundation.dart';

class MyProviderController extends ChangeNotifier {
  final List<int> items = [];
  void add() {
    items.add(Random().nextInt(100));
    notifyListeners();
  }

  void removeAll() {
    items.clear();
    notifyListeners();
  }
}
