import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../quote_provider.dart';
import 'fetch_button.dart';

class QuotesForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("QuotesForm build");
    return Consumer<QuoteProvider>(
      builder: (BuildContext context, quoteProvider, Widget child) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: quoteProvider.loadingQuote
                    ? SizedBox()
                    : ListView(
                        children: quoteProvider.error
                            ? onErrorWidgets()
                            : onSuccessWidgets(
                                quoteProvider.quote, quoteProvider.author),
                      ),
              ),
            ),
            const SizedBox(height: 64),
            FetchButton(),
          ]),
        );
      },
    );
  }

  List<Widget> onSuccessWidgets(String quote, String author) {
    return [
      Text(
        quote ?? "",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
      const SizedBox(height: 8),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          author == null ? "" : "~ $author",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    ];
  }

  List<Widget> onErrorWidgets() {
    return [
      Text(
        "Ups... Something went wrong.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
      const SizedBox(height: 8),
      Text(
        "~ This app creator",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    ];
  }
}
