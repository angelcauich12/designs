import 'package:designs/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesScreen extends StatefulWidget {
  const GraficasCircularesScreen({super.key});

  @override
  State<GraficasCircularesScreen> createState() => _GraficasCircularesScreenState();
}

class _GraficasCircularesScreenState extends State<GraficasCircularesScreen> {

  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        porcentaje += 10;

        if(porcentaje > 100){
          porcentaje = 0;
        }
        setState(() {
          
        });
      },
      child: const Icon(Icons.refresh),
      ),
      body:  Center(
        child:
       SizedBox(
        width: 300,
        height: 300,
        child: RadialProgress(porcentaje: porcentaje))),);
  }
}
