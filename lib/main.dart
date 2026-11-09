import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/theme.dart';
import 'core/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const RedLoopApp());
}

class RedLoopApp extends StatelessWidget {
  const RedLoopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RedLoop',
      debugShowCheckedModeBanner: false,
      theme: RedLoopTheme.light,
      initialRoute: Routes.home,
      routes: Routes.map,
    );
  }
}
