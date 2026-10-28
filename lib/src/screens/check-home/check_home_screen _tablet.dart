import 'dart:async';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CheckColors {
  static Color primary = const Color(0xff896BCF);
  static Color second = const Color(0xffE6C9F7);
  static Color third = const Color(0xffD8EBFA);
  static Color fourth = const Color(0xffCBFFF5);
  static Color letterColor = const Color(0xff172C49);
  static Color dividerColor = const Color(0xffC5A7FA);
  static Color likeWitheColor = const Color(0xffFCFCFC);
  static Color witheColor = const Color(0xffFFFFFF);
}

class CheckHomeScreenTablet extends StatelessWidget {
  const CheckHomeScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body:
          // Stack(
          //   children: [
          //     Stack(
          //       children: [
          //         Container(
          //           // color: Colors.red,
          //         ),
          //         Positioned(
          //             top: -90,
          //             left: -90,
          //             child: Container(
          //               // color: Colors.amber,
          //               height: 320,
          //               child: Image.asset('assets/img/image2.jpeg'),
          //             )),
          //         Positioned(
          //             bottom: 220,
          //             right: -150,
          //             child: Container(
          //               height: 380,
          //               child: Image.asset('assets/img/image1.jpeg'),
          //             )),
          //              Positioned(
          //             bottom: -70,
          //             left: -50,
          //             child: Container(
          //               height: 240,
          //               child: Image.asset('assets/img/image3.jpeg'),
          //             )),
          //       ],
          //     ),
          //   ],
          // )
          SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            decoration: _backgroundDecorarion(),
            child: Column(
              children: [
                _Head(),
                _Body(),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _backgroundDecorarion() {
    return BoxDecoration(
        gradient: LinearGradient(
            // stops: [
            //   0.2,0.2,0.2,0.5
            // ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
          CheckColors.second,
          CheckColors.third,
          CheckColors.fourth,
          CheckColors.likeWitheColor,
          CheckColors.witheColor
        ]));
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _BodyContainer(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(child: _SummarySection()),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            height: 200, // o el alto que quieras
            child: VerticalDivider(color: CheckColors.dividerColor),
          ),
          const SizedBox(
            width: 20,
          ),
          const Expanded(child: _NextTaskSection())
        ],
      ),
    ));
  }
}

class _NextTaskSection extends StatelessWidget {
  const _NextTaskSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              text: 'Tu ',
              style: TextStyle(fontSize: 23, color: CheckColors.letterColor),
              children: const <TextSpan>[
                TextSpan(
                    text: 'siguiente tarea',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: ' empieza en:',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      )
                    ]),
              ],
            ),
          ),
        ),
       const SizedBox(
          height: 20,
        ),


        Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Limpieza de piso y juegos',
                  style: TextStyle(
                      color: CheckColors.letterColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      size: 16,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '12:24 pm',
                      style: TextStyle(
                        color: CheckColors.letterColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.share_location_sharp,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Área infantil',
                      style: TextStyle(
                        color: CheckColors.letterColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            )),
            const TimeProgress(duration: const Duration(hours: 2, minutes: 30))
          ],
        )
      ],
    );
  }
}

class _SummarySection extends StatelessWidget {
  const _SummarySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _TextSummaryDay(),
        const SizedBox(
          height: 20,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Hoy',
              style: TextStyle(
                color: CheckColors.letterColor,
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_CardChecklist(), _CardChecklist(), _CardChecklist()],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class _CardChecklist extends StatelessWidget {
  const _CardChecklist();

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xffF3F3F3),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // color de la sombra
              spreadRadius: 1, // expansión de la sombra
              blurRadius: 5, // desenfoque
              offset: const Offset(0, 5), // posición de la sombra (x, y)
            ),
          ]),
      height: 90,
      width: 105,
      child: Column(
        children: [
          Text(
            'Asignadas',
            style: TextStyle(color: CheckColors.letterColor),
          ),
          Text(
            '10',
            style: TextStyle(
                fontSize: 35,
                color: CheckColors.letterColor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class _TextSummaryDay extends StatelessWidget {
  const _TextSummaryDay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: 'Este es el resumen de ',
          style: TextStyle(fontSize: 23, color: CheckColors.letterColor),
          children: const <TextSpan>[
            TextSpan(
                text: 'tus tareas',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class _Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      // color: Colors.red,
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 65,
                ),
                Center(
                  child: SizedBox(
                    // color: Colors.blue,
                    width: 600,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://fastly.picsum.photos/id/22/4434/3729.jpg?hmac=fjZdkSMZJNFgsoDh8Qo5zdA_nSGUAWvKLyyqmEt2xs0')),
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Hola,',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: CheckColors.letterColor)),
                              Text(
                                maxLines: 1,
                                'Miguel Angel Cauich Caballero',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: CheckColors.letterColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const _LeftIcon(),
          const _RightOptions()
        ],
      ),
    );
  }
}

class _RightOptions extends StatelessWidget {
  const _RightOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 50,
        right: 25,
        child: Row(
          children: [
            _IconButtonCustom(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ),
            ),
            _IconButtonCustom(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
            )
          ],
        ));
  }
}

class _LeftIcon extends StatelessWidget {
  const _LeftIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 50,
      left: 25,
      child: SizedBox(
          width: 45,
          height: 45,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            child: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/img/logo_icon.jpeg')),
          )),
    );
  }
}

class _IconButtonCustom extends StatelessWidget {
  final Widget icon;
  final void Function() onPressed;

  const _IconButtonCustom({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
        ),
        onPressed: onPressed,
        icon: icon);
  }
}

class _BodyContainer extends StatelessWidget {
  final Widget child;
  const _BodyContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Container(
        // color: Colors.white,
        width: double.infinity,
        child: child,
      ),
    );
  }
}

class TimeProgress extends StatefulWidget {
  final Duration duration;
  const TimeProgress({super.key, required this.duration});

  @override
  State<TimeProgress> createState() => _TimeProgressState();
}

class _TimeProgressState extends State<TimeProgress> {
  late Duration _remaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remaining = widget.duration;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remaining.inSeconds <= 0) {
        timer.cancel();
      } else {
        setState(() {
          _remaining = _remaining - const Duration(seconds: 1);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hours = _remaining.inHours.toDouble();
    final minutes = (_remaining.inMinutes % 60).toDouble();

    return Row(
      children: [
        Column(
          children: [
            SizedBox(
              height: 110,
              width: 110,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    showLabels: false,
                    showTicks: false,
                    startAngle: 270,
                    endAngle: 270,
                    radiusFactor: 0.8,
                    axisLineStyle: const AxisLineStyle(
                      thickness: 0.05,
                      color: Color(0xffAAFAE1),
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: hours,
                        width: 0.05,
                        color: const Color.fromRGBO(3, 218, 198, 1),
                        sizeUnit: GaugeSizeUnit.factor,
                        enableAnimation: true,
                        animationDuration: 20,
                        animationType: AnimationType.linear,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Text(
                        hours.toStringAsFixed(0),
                        style: const TextStyle(
                            fontSize: 24,
                            color: Color.fromRGBO(3, 218, 198, 1)),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              'Horas',
              style: TextStyle(
                  color: CheckColors.letterColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 110,
              width: 110,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    showLabels: false,
                    showTicks: false,
                    startAngle: 270,
                    endAngle: 270,
                    radiusFactor: 0.8,
                    axisLineStyle: const AxisLineStyle(
                      thickness: 0.05,
                      color: Color(0xffAAFAE1),
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: minutes,
                        width: 0.05,
                        color: const Color.fromRGBO(3, 218, 198, 1),
                        sizeUnit: GaugeSizeUnit.factor,
                        enableAnimation: true,
                        animationDuration: 20,
                        animationType: AnimationType.linear,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Text(
                        minutes.toStringAsFixed(0),
                        style: const TextStyle(
                            fontSize: 24,
                            color: Color.fromRGBO(3, 218, 198, 1)),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              'Minutos',
              style: TextStyle(
                  color: CheckColors.letterColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }
}
