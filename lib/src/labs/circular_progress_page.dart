import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({ Key? key }) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {
  
  late AnimationController controller;

  
  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration :const Duration(milliseconds: 800));
    
    controller.addListener(() { 
      //print("Valor Controller ${controller.value}");
      
      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value)!;  
      });
    });

    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: (){
          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje += 10 ;
          if (nuevoPorcentaje> 100){
            nuevoPorcentaje = 0;
          }
          controller.forward(from : 0.0);

          setState(() {});
        }
        ),
      body: Center(
        child: SizedBox(
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