import 'package:flutter/material.dart';
import 'package:tuktuk/src/config/routes/routes.dart';
import 'package:tuktuk/src/utils/constant/tt_colors.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0x00130F28),
          background: TtColors.ttPrimaryColor.shade800,
          error: TtColors.dangerMaterialColor,
          onPrimary: TtColors.ttPrimaryColor,
        ),
        fontFamily: 'LilitaOne',
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}
