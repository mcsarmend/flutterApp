import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({ Key? key }) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  double porcentaje = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: (){
          porcentaje += 10 ;
          if (porcentaje > 100){
            porcentaje = 0;
          }
          setState(() {});
        }
        ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          //color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress(porcentaje),
          ),
        ),
      ),
      
    );
  }
}

class _MiRadialProgress extends CustomPainter{
  
  // ignore: prefer_typing_uninitialized_variables
  final  porcentaje;
  _MiRadialProgress(this.porcentaje);
  
  
  @override
  void paint(Canvas canvas, Size size) {
    


    // Circulo Completado
    final paint = Paint()
    ..strokeWidth=5
    ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final center =  Offset(size.width * 0.5, size.height * 0.5 );
    final radio = min(size.width * 0.5, size.height * 0.5 );

      canvas.drawCircle(center, radio , paint);

        // Arco
    final paintArco = Paint()
    ..strokeWidth=10
    ..color = Colors.pink
    ..style = PaintingStyle.stroke;

    double arAngle = 2 * pi * ( porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio), 
      - pi / 2, 
      arAngle , 
      false, 
      paintArco );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}