import 'package:flutter/material.dart';
import '../net/api_response.dart';
import '../net/api_repo.dart';


class QuoteProvider with ChangeNotifier {
  final ApiRepo _apiRepo;
  String quote;
  String author;
  bool loadingQuote = false;
  bool error = false;

  QuoteProvider(this._apiRepo);

  Future<void> fetchQuote() async {
    error = false;
    loadingQuote = true;
    notifyListeners();
    try {
      ApiResponse response = await _apiRepo.fetchQuote();
      quote = response.quote;
      author = response.author;
    } catch (e) {
      error = true;
    }
    loadingQuote = false;
    notifyListeners();
  }
}
