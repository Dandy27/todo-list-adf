
import 'package:flutter/material.dart';

class TotoListNavigator {
  TotoListNavigator._();
  static final navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState get to => navigatorKey.currentState!;
}
