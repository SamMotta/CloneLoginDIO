import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Primeira página importada YAY :D
// import 'pages/home_page.dart';
import 'pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const bgTheme = Color.fromARGB(255, 30, 25, 44);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(        
        cardColor: bgTheme,
        dialogTheme: const DialogTheme(
          backgroundColor: bgTheme,
          iconColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: bgTheme),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.white,
          textColor: Colors.white,
          style: ListTileStyle.drawer,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        drawerTheme: const DrawerThemeData(backgroundColor: bgTheme),
        dividerTheme: const DividerThemeData(color: Colors.white, thickness: 1),
        primarySwatch:
            MaterialColor(Colors.lightBlue.shade900.value, <int, Color>{
          50: Color(Colors.lightBlue.shade50.value),
          100: Color(Colors.lightBlue.shade100.value),
          200: Color(Colors.lightBlue.shade200.value),
          300: Color(Colors.lightBlue.shade300.value),
          400: Color(Colors.lightBlue.shade400.value),
          500: Color(Colors.lightBlue.shade500.value),
          600: Color(Colors.lightBlue.shade600.value),
          700: Color(Colors.lightBlue.shade700.value),
          800: Color(Colors.lightBlue.shade800.value),
          900: Color(Colors.lightBlue.shade900.value)
        }),
        scaffoldBackgroundColor: bgTheme,
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.only(bottom: 14),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 141, 79, 151),
              width: 1.2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 141, 79, 151),
              width: 1.2,
            ),
          ),
          hintStyle: TextStyle(
            color: Colors.white54,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        textTheme: GoogleFonts.latoTextTheme(
          const TextTheme(
            subtitle1: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            bodyText1: TextStyle(
              color: Colors.white,
            ),
            bodyText2: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
