import 'package:cv/view/homepage.dart';
import 'package:cv/view/providers/education_add.dart';
import 'package:cv/view/providers/exp_works.dart';
import 'package:cv/view/providers/exprience_add.dart';
import 'package:cv/view/providers/language.dart';
import 'package:cv/view/providers/skills.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Educ(),
        ),
        ChangeNotifierProvider(create: (_) => Langu()),
        ChangeNotifierProvider(create: (_) => Skill()),
        ChangeNotifierProvider(create: (_) => Exprience()),
        ChangeNotifierProvider(create: (_) => ExpWorks())
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.red, primarySwatch: Colors.red),
        home: const HomePage(),
      ),
    );
  }
}
