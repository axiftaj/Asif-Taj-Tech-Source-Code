import 'package:bazar_updated/view/utilz/colors.dart';
import 'package:bazar_updated/view/utilz/route_name.dart';
import 'package:bazar_updated/view/utilz/routers.dart';
import 'package:bazar_updated/view/utilz/theme.dart';
import 'package:bazar_updated/viewmodel/auth_provider/auth_provider.dart';
import 'package:bazar_updated/viewmodel/auth_provider/show_spinner_provider.dart';
import 'package:bazar_updated/viewmodel/localization/locale_constant.dart';
import 'package:bazar_updated/viewmodel/localization/localizations_delegate.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   Locale? _locale;
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),

        //provider to show all of the spinner across the app
        ChangeNotifierProvider(create: (_) => ShowSpinner()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: MyColors.navy,
          scaffoldBackgroundColor: const Color(0xffF8F9FA),

          appBarTheme: const  AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                  color: Colors.black
              ),
              backgroundColor:  Color(0xffF8F9FA) ,
              titleTextStyle:  TextStyle(
                  fontSize: 18, color: MyColors.primaryTextTextColor,
                  fontFamily: 'Avenir Heavy')
          ),
          fontFamily: 'SF_Pro_Display',
          textTheme: const TextTheme(
              headline1: TextStyle( fontSize: 32, fontFamily: 'Avenir Heavy' , color: Color(0xff8F92A1)),
              headline2:  TextStyle(fontSize: 17),
              headline3: TextStyle(fontSize: 16),
              headline4: TextStyle(fontSize: 14),
              headline5: TextStyle(fontSize: 12),
              headline6: TextStyle( fontSize: 16, fontFamily: 'Avenir Roman' , color: MyColors.secondaryTextColor ),

              bodyText1: TextStyle( fontSize: 16, fontFamily: 'Avenir Heavy' , color: MyColors.secondaryTextColor ),
              bodyText2: TextStyle( fontSize: 14, fontFamily: 'Avenir Roman' , color: MyColors.secondaryTextColor ),

              subtitle1: TextStyle( fontSize: 18, fontFamily: 'Avenir Heavy' , color: MyColors.primaryTextTextColor ),
              subtitle2: TextStyle( fontSize: 14, fontFamily: 'Avenir Medium' , color: MyColors.primaryTextTextColor ),

              caption: TextStyle(fontSize: 9.5)),
        ),
        initialRoute: RouteName.splashScreen,
        onGenerateRoute: Routers.generateRoute,
        locale: _locale,
        supportedLocales: const [
          Locale('en', ''),
          Locale('es', '')
        ],
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode &&
                supportedLocale.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },

      ),
    );
  }
}

