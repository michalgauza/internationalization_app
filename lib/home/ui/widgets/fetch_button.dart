import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_localizations.dart';
import '../../quote_provider.dart';

class FetchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
        side: BorderSide(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          AppLocalizations.of(context).translate("fetch_button").toUpperCase(),
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      onPressed: () => context.read<QuoteProvider>().fetchQuote(),
    );
  }
}
