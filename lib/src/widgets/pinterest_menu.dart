import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final void Function() onPressed;
  final IconData icon;

  PinterestButton({required this.icon, required this.onPressed});
}

class PinterestMenu extends StatelessWidget 
{
  final bool show;
  const PinterestMenu({super.key, this.show = true});

  @override
  Widget build(BuildContext context) {
    List<PinterestButton> items = [
      PinterestButton(icon: Icons.pie_chart, onPressed: () {debugPrint('Icon pie_chart');}),
      PinterestButton(icon: Icons.search, onPressed: () {debugPrint('Icon search');}),
      PinterestButton(icon: Icons.notifications, onPressed: () {debugPrint('Icon notifications');}),
      PinterestButton(icon: Icons.supervised_user_circle, onPressed: () {debugPrint('Icon supervised');})
    ];

    return ChangeNotifierProvider(
      create: (_) => _MenuProvider(),
      child:  AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: show ? 1 :0,
        child: _PinterestMenuBackground(
          child: _MenuItems(menuItems: items))),
      );
  }
}

class _PinterestMenuBackground extends StatelessWidget {

  final Widget child;


  const _PinterestMenuBackground({required this.child});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: -5,
            blurRadius: 10,
            // offset: Offset(10, 10),
            color: Colors.black38)
        ]
        ),
      child: child,
     
    );
  }
}

class _MenuItems extends StatelessWidget {

  final  List<PinterestButton> menuItems;
  const _MenuItems({required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (i) => _PinterestMenuButton(index: i, item:menuItems[i])) 
      
      );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;
  const _PinterestMenuButton({ required this.index, required this.item});

  @override
  Widget build(BuildContext context) {

    final selectedItem = Provider.of<_MenuProvider>(context).selectedItem;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
       Provider.of<_MenuProvider>(context, listen: false).selectedItem = index;
       item.onPressed();
      },
      child: Icon(item.icon, size: 25, color: selectedItem ==index ? 
      Colors.black
      : Colors.blueGrey,));
  }
}


class _MenuProvider extends ChangeNotifier {

  int _selectedItem = 0;

  int get selectedItem => _selectedItem;

  set selectedItem(int value){
    _selectedItem = value;
    notifyListeners();
  }
}