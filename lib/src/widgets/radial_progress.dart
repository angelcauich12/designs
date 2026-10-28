import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;

   const RadialProgress({super.key, required this.porcentaje});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>  with SingleTickerProviderStateMixin{

 late AnimationController controller;
 late double porcentajeAnterior;

 @override
  void initState() {
   
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));




    super.initState();
  }
  @override
  void dispose() {
   controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;

    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(animation: controller, builder: (context, _) {
      return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(painter: _RadiaProgressPainter(porcentaje: (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value)),) ,
    );
    },);


    // return 
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
