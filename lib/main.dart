import 'package:flutter/material.dart';
import 'feature/routes/app_pages.dart';
import 'package:hive_flutter/adapters.dart';
import 'servise_locator.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Hive.initFlutter();
  runApp(const MyApp());
}

