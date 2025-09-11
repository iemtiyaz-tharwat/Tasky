import 'package:flutter/material.dart';

class MotivationQuoteProvider extends ChangeNotifier {
  String motivationQuote = "One task at a time. One step closer.";
  String get _motivationQuote => motivationQuote;
  void setQuote(String newQuote) {
    motivationQuote = newQuote.isNotEmpty ? newQuote : motivationQuote;
    notifyListeners();
  }
}