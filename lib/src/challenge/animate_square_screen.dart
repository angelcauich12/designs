import 'package:flutter/material.dart';

class AnimateSquareScreen extends StatelessWidget {
  const AnimateSquareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: _SquareAnimated()),
    );
  }
}

class _SquareAnimated extends StatefulWidget {
  const _SquareAnimated({super.key});

  @override
  State<_SquareAnimated> createState() => _SquareAnimatedState();
}

class _SquareAnimatedState extends State<_SquareAnimated> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> moveRight;
  late Animation<double> moveLeft;
  late Animation<double> moveTop;
  late Animation<double> moveBottom;

  @override
  void initState() {

    controller = AnimationController(vsync: this, duration: const Duration(milliseconds:  4500));
    moveRight = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0, 0.25, curve: Curves.bounceOut)));
    moveTop = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.25, 0.50, curve: Curves.bounceOut)));
    moveLeft = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.50, 0.75, curve: Curves.bounceOut)));
    moveBottom = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward();
    
    return AnimatedBuilder(
      animation: controller, builder: (context, child) {
      return Transform.translate(
        offset: Offset(moveRight.value + moveLeft.value, moveTop.value + moveBottom.value ),
        child: child);
    },
      child: const _Cuadrado(),);
  }
}

class _Cuadrado extends StatelessWidget {
  const _Cuadrado();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
