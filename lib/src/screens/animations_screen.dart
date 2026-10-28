import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsScreen extends StatelessWidget {
  const AnimationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CuadradoAnimado()),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({super.key});

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {
  late Animation<double> rotation;
  late AnimationController controller;
  
  late Animation<double> opacity;
  late Animation<double> opacityOut;
  
  late Animation<double> moveRight;
  late Animation<double> bigger;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000));

    rotation = Tween(begin: 0.0, end: 4  * Math.pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInCubic)
    );

    opacity = Tween(begin: 0.1 , end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0,0.25, curve: Curves.easeOut)));
      
    opacityOut = Tween(begin: 0.0 , end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.75,1.0, curve: Curves.easeOut)));
    moveRight = Tween(begin: 0.0, end: 200.0).animate(controller);  

  
    bigger = Tween(begin: 0.0, end: 2.0).animate(controller);  

    controller.addListener(() {
    
    // print('status: ${controller.status}');

    if(controller.status == AnimationStatus.completed){
      controller.reverse();
    }

     });


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
      animation: controller, 
      builder: (context, _) => Transform.translate(
        offset: Offset(moveRight.value, 0),
        child: Transform.rotate(
          angle: rotation.value,
          child: Opacity(
            opacity: opacity.value - opacityOut.value,
            child: Transform.scale(
              scale: bigger.value,
              child: const _Cuadrado()))),
      ),
      );
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
