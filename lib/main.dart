import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:internationalization_app/app_language_provider.dart';
import 'package:internationalization_app/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguageProvider appLanguageProvider = AppLanguageProvider();
  await appLanguageProvider.fetchLocale();
  runApp(App(
    appLanguageProvider: appLanguageProvider,
  ));
}

class App extends StatelessWidget {
  final AppLanguageProvider appLanguageProvider;

  const App({@required this.appLanguageProvider})
      : assert(appLanguageProvider != null);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: appLanguageProvider),
      ],
      child: Consumer<AppLanguageProvider>(
        builder: (BuildContext context, value, Widget child) {
          return MaterialApp(
            locale: value.appLocale,
            supportedLocales: [
              Locale("en", "US"),
              Locale("pl", "PL"),
              Locale("de", "DE"),
              Locale("fr", "FR"),
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            title: 'internationalization app',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: HomePage(title: 'internationalization app'),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    print('HomePage build');
    AppLanguageProvider appLanguageProvider =
        Provider.of<AppLanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(AppLocalizations.of(context).translate("title"), style: TextStyle(fontSize: 32),),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              appLanguageProvider.changeLanguage(Locale("pl"));
            },
            tooltip: 'PL',
            child: Text("PL"),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            onPressed: () {
              appLanguageProvider.changeLanguage(Locale("en"));
            },
            tooltip: 'EN',
            child: Text("EN"),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            onPressed: () {
              appLanguageProvider.changeLanguage(Locale("de"));
            },
            tooltip: 'DE',
            child: Text("DE"),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            onPressed: () {
              appLanguageProvider.changeLanguage(Locale("fr"));
            },
            tooltip: 'FR',
            child: Text("FR"),
          ),
        ],
      ),
    );
  }
}
