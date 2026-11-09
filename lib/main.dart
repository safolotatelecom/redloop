import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'core/routes.dart';

void main() {
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
