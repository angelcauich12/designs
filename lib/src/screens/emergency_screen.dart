import 'package:designs/src/widgets/fat_button.dart';
import 'package:designs/src/widgets/headers.dart';
import 'package:flutter/material.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const _HeaderScreen(),
          FatButton(
            icon: Icons.motorcycle,
            onPress: () {},
            text: 'Texto dsdaiosd',
            color1: Colors.green,
            color2: Colors.blue,
          
            ),
            FatButton(
            icon: Icons.motorcycle,
            onPress: () {},
            text: 'Texto dsdaiosd',
            color1: Colors.red,
            color2: Colors.blue,
            ),
        ],
      ),
    );
  }
}

class _HeaderScreen extends StatelessWidget {
  const _HeaderScreen();

  @override
  Widget build(BuildContext context) {
    return const IconHeader(icon: Icons.add, title: 'Asistencia médica', subtitle: 'Haz solicitado', color1: Colors.red);
  }
}