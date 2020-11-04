import 'package:flutter/material.dart';
import 'widgets/buttons_form.dart';
import 'widgets/quotes_form.dart';
import '../../utils/app_localizations.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('HomePage build');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const SizedBox(height: 16),
              SizedBox(
                height: 100,
                child: Text(
                  AppLocalizations.of(context).translate("title"),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
              const SizedBox(height: 32),
              QuotesForm(),
              ButtonsForm(),
            ],
          ),
        ),
      ),
    );
  }
}
