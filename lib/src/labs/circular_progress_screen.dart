import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressScreen extends StatefulWidget {
  const CircularProgressScreen({
    super.key,
  });

  @override
  State<CircularProgressScreen> createState() => _CircularProgressScreenState();
}

class _CircularProgressScreenState extends State<CircularProgressScreen>
    with SingleTickerProviderStateMixin {
  double porcentaje = 0.0;
  late AnimationController controller;
  double newPorcentaje = 0.0;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    controller.addListener(() { 
      // print('valo controller ${controller.value}' );

      setState(() {
      porcentaje = lerpDouble(porcentaje, newPorcentaje, controller.value)!;
      });

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
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          // color: Colors.green,
          child: CustomPaint(
            painter: _RadiaProgressPainter(porcentaje: porcentaje),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          porcentaje = newPorcentaje;

          newPorcentaje += 10;
          if (newPorcentaje > 100) {
            newPorcentaje = 0;
            porcentaje = 0;
          }
          controller.forward(from: 0.0);

          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class _RadiaProgressPainter extends CustomPainter {
  final double porcentaje;
  _RadiaProgressPainter({required this.porcentaje});

  @override
  void paint(Canvas canvas, Size size) {
    //Circulo completado

    final paint = Paint();
    paint.strokeWidth = 4;
    paint.color = Colors.grey;
    paint.style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    //Arco

    final paintArco = Paint();
    paintArco.strokeWidth = 10;
    paintArco.color = Colors.blue;
    paintArco.style = PaintingStyle.stroke;

    //Parte que se deberá ir llenando

    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
