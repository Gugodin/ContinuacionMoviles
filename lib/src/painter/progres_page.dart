import 'dart:async';
import 'dart:math';

import 'package:appvetnew/src/colors/colors_view.dart';
import 'package:flutter/material.dart';

class Progresview extends StatefulWidget {
  const Progresview({Key? key}) : super(key: key);

  @override
  State<Progresview> createState() => _ProgresviewState();
}

class _ProgresviewState extends State<Progresview> {
  int tiempo = 0;

  @override
  void initState() {
    Timer.periodic(Duration(milliseconds: 100), (__) {
      // print("entre");
      setState(() {
        if (tiempo < 100) {
          tiempo = tiempo + 5;
        } else {
          Navigator.restorablePopAndPushNamed(context, '/homePage');
          // print('Canceló');
          __.cancel();
        }
      });
    });
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 150,
          height: 150,
          child: CustomPaint(
            painter: ProgressCustom(valorCarga: tiempo),
          ),
        ),
      ),
    );
  }
}

class ProgressCustom extends CustomPainter {
  final int valorCarga;

  ProgressCustom({required this.valorCarga});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    final Paint paint2 = Paint();

    final Offset ofsset = Offset(size.width * 0.50, size.height * 0.50);

    paint.style = PaintingStyle.stroke;
    paint2.style = PaintingStyle.stroke;
    paint.strokeWidth = 6;
    paint2.strokeWidth = 8;
    paint2.color = ColorSelect.progressColor;

    canvas.drawCircle(ofsset, size.width / 2, paint);

    canvas.drawArc(Rect.fromCircle(center: ofsset, radius: size.height / 2),
        (-pi / 2), (pi * 2 * valorCarga) / 100, false, paint2);

    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return true;
  }
}
