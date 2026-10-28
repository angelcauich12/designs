import 'package:designs/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';


class PinterestScreen extends StatelessWidget {
  const PinterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return ChangeNotifierProvider(

      create: (_) => _MenuProvider(),
      child: const Scaffold(
        // body: PinterestMenu(),
        body: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  const _PinterestMenuLocation(
  
);



  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final show =  Provider.of<_MenuProvider>(context).show;



    return Positioned(
        bottom: 30,
        child: SizedBox(
          // color: Colors.red ,
          width: size.width,
          child: Align(child: PinterestMenu(show: show)),
        ));
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(50, (i) => i);

  ScrollController controller = ScrollController();

  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      // debugPrint('scroll lister ${controller.offset}');

      if (controller.offset > scrollAnterior && controller.offset > 150) {

        Provider.of<_MenuProvider>(context, listen:false).show = false;

      } else {
        Provider.of<_MenuProvider>(context, listen: false).show = true;
      }

      scrollAnterior = controller.offset;
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
    return GridView.custom(
      physics: const BouncingScrollPhysics(),
      controller: controller,
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 2,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(2, 2),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 2),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        childCount: items.length,
        (context, index) => Title(
            color: Colors.blue,
            child: Container(
              color: Colors.green,
              child: Center(
                  child: CircleAvatar(
                      backgroundColor: Colors.white, child: Text('$index'))),
            )),
      ),
    );
  }
}

class _MenuProvider extends ChangeNotifier {
  bool _show = true;

  bool get show => _show;

  set show(bool value) {
    _show = value;
    notifyListeners();
  }
}
