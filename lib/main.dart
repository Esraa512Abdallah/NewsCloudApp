import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloudnewsapp/ViewModels/lang_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Models/app_local.dart';
import 'Views/home_view.dart';

void main() async {
  LangViewModel Translate = LangViewModel();

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString("lang", "en");
  Locale locale = Locale(sharedPreferences.getString("lang")!, " ");

  runApp(MyApp(locale));
}

class MyApp extends StatefulWidget {
  final Locale? locale;

  MyApp(this.locale);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LangViewModel Translate = Get.put(LangViewModel());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        AppLocal.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', ''),
        Locale('en', ''),
        Locale('fr', ''),
      ],
      locale: widget.locale,
      localeResolutionCallback: (currentLocale, supportedLocales) {
        if (currentLocale != null) {
          for (Locale locale in supportedLocales) {
            if (currentLocale.languageCode == locale.languageCode) {
              return currentLocale;
            }
          }
        }
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splashIconSize: 250,
        duration: 3000,
        splash: Image.asset("assets/splash/splash.jpg"),
        nextScreen: HomeView(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.black,
      ),
    );
  }
}
