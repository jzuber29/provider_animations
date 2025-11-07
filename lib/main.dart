import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/animation_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AnimationProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Staggered Animation + Provider",
      home: const HomeScreen(),
    );
  }
}
