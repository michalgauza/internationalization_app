import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:internationalization_app/home/quote_provider.dart';
import 'package:internationalization_app/net/api_repo.dart';
import 'package:internationalization_app/utils/app_language_provider.dart';
import 'package:internationalization_app/utils/app_localizations.dart';
import 'package:internationalization_app/utils/colors.dart';
import 'package:internationalization_app/home/ui/home_page.dart';
import 'package:provider/provider.dart';

const List<Locale> supportedLocales = [
  const Locale("en", "US"),
  const Locale("pl", "PL"),
  const Locale("de", "DE"),
  const Locale("fr", "FR"),
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguageProvider appLanguageProvider = AppLanguageProvider();
  await appLanguageProvider.fetchLocale();
  ApiRepo apiRepo = ApiRepo();
  runApp(App(
    appLanguageProvider: appLanguageProvider,
    apiRepo: apiRepo,
  ));
}

class App extends StatelessWidget {
  final AppLanguageProvider appLanguageProvider;
  final ApiRepo apiRepo;

  const App({@required this.appLanguageProvider, @required this.apiRepo})
      : assert(appLanguageProvider != null),
        assert(apiRepo != null);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: appLanguageProvider),
        ChangeNotifierProvider(
          create: (_) => QuoteProvider(apiRepo),
        ),
      ],
      child: Consumer<AppLanguageProvider>(
        builder: (BuildContext context, appLanguageProvider, Widget child) {
          return MaterialApp(
            locale: appLanguageProvider.appLocale,
            supportedLocales: supportedLocales,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            title: 'internationalization app',
            theme: ThemeData(
              primarySwatch: AppColors.materialGrey,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              accentColor: Colors.white,
            ),
            home: HomePage(),
          );
        },
      ),
    );
  }
}
