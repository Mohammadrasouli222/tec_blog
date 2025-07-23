import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tec_blog/my_colors.dart';
import 'package:tec_blog/view/main_screen.dart';
import 'package:tec_blog/view/my_cats.dart';
import 'package:tec_blog/view/register_intro.dart';
import 'package:tec_blog/view/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // farsi
      ],

      theme: ThemeData(

           inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(width: 2),
            ),
            filled: true,
            fillColor: Colors.white
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return textTheme.headlineLarge;
              }
              return textTheme.headlineSmall;
            }),

            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return SolidColors.seeMore;
              }
              return SolidColors.primaryColor;
            }),
          ),
        ),
        
        fontFamily: 'dana',
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'dana',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: SolidColors.posterTitle,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
          headlineSmall: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: SolidColors.seeMore,
            fontWeight: FontWeight.w700,
          ),
          titleSmall: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: SolidColors.posterSubTitle,
          ),
           titleMedium: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: SolidColors.hintText,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'dana',
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: SolidColors.textTitle,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: Color.fromARGB(255, 70, 70, 70),
            fontWeight: FontWeight.w700,
          ),
          bodySmall: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: Colors.green,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      //home: SplashScreen(),
      //: RegisterIntro(),
      home: MyCats(),
    );
  }
}
