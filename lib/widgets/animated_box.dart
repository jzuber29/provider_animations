import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/animation_provider.dart';

class AnimatedBox extends StatefulWidget {
  const AnimatedBox({super.key});

  @override
  State<AnimatedBox> createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnim;
  late Animation<Color?> colorAnim;
  late Animation<Offset> slideAnim;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    scaleAnim = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    colorAnim = ColorTween(begin: Colors.blue, end: Colors.red).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.3, 0.7, curve: Curves.easeInOut),
      ),
    );

    slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: const Offset(0, -0.3),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final play = context.watch<AnimationProvider>().play;
    play ? controller.forward() : controller.reverse();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        return Transform.scale(
          scale: scaleAnim.value,
          child: SlideTransition(
            position: slideAnim,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: colorAnim.value,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        );
      },
    );
  }
}
