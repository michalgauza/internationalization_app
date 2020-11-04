import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_language_provider.dart';
import '../../../main.dart';

class ButtonsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: supportedLocales
          .map(
            (locale) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                width: 60,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white)),
                  onPressed: () => context
                      .read<AppLanguageProvider>()
                      .changeLanguage(locale),
                  child: Text(
                    locale.languageCode.toUpperCase(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
