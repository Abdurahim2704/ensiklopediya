import 'package:easy_localization/easy_localization.dart';
import 'package:ensiklopediya/app.dart';
import 'package:flutter/material.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(supportedLocales: const [
      Locale("uz", "UZ"),
      Locale("ru", "RU"),
      Locale("en", "US"),
    ], path: "assets/translation", fallbackLocale: const Locale("en", "US"),child: MyApp(),)
  );
}