import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/animation_provider.dart';
import '../widgets/animated_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AnimationProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Staggered Animation Demo")),
      body: const Center(child: AnimatedBox()),
      floatingActionButton: FloatingActionButton(
        onPressed: provider.toggleAnimation,
        child: Icon(provider.play ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
