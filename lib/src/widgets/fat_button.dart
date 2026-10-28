import 'package:flutter/material.dart';

class FatButton extends StatelessWidget {

  final IconData? icon;
  final String text;
  final Color? color1;
  final Color? color2;
  final void Function() onPress;


  const FatButton({super.key, 
  this.icon = Icons.question_mark_sharp, required this.text, 
  this.color1 = Colors.grey, 
  this.color2 = Colors.blueGrey , required this.onPress});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        _BackgroundFatButton(color1: color1!, color2: color2!, icon: icon!,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 140, width: 40,),
            Icon(
             icon,
              color: Colors.white,
              size: 40,
            ),
              const SizedBox(width: 20,),
           
            Expanded(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
           
            const Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.white,
              size: 40,
            ),

               const SizedBox(width: 40,),
          ],
        )
      ],
    );
  }
}

class _BackgroundFatButton extends StatelessWidget {
final Color color1;
final Color color2;
final IconData icon;
  
  const _BackgroundFatButton({
    super.key, required this.color1, required this.color2, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(4, 6),
                blurRadius: 10),
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: [color1, color2])),
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
                right: -20,
                top: -20,
                child: Icon(
                 icon,
                  size: 150,
                  color: Colors.white.withOpacity(0.2),
                ))
          ],
        ),
      ),
    );
  }
}
