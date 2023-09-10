import 'dart:io';
import 'package:flutter/material.dart';
import 'feature/routes/app_pages.dart';
import 'servise_locator.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}




// Функция автоматического обновление ssl сертификата
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}