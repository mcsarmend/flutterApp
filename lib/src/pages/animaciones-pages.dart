// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'dart:math' show pi;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: CuadradoAnimacion(),
          ),
    );
  }
}

class CuadradoAnimacion extends StatefulWidget {
  const CuadradoAnimacion({Key? key}) : super(key: key);

  @override
   _CuadradoAnimadoState createState() =>_CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimacion> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> rotacion; 
  late Animation<double> opacidad; 
  late Animation<double> opacidadOut; 
  late Animation<double> moverDerecha; 
  late Animation<double> agrandar; 

  @override
  void initState() {
    
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000)
    );
    
    rotacion = Tween(begin: 0.0,end: 2.0 * pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
      );
    
    opacidad = Tween(begin: 0.1,end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0,0.5,curve: Curves.easeOut))
      );
    opacidadOut = Tween(begin: 0.0,end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.75,1,curve: Curves.easeOut))
      );
    
    moverDerecha = Tween(begin:0.1 ,end: 200.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
      );

    agrandar = Tween(begin:0.0 ,end: 2.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
      );


    controller.addListener(() {
      if (controller.status == AnimationStatus.completed){
        controller.repeat();

      }
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
    controller.forward();
    return AnimatedBuilder(
      child: _Rectangulo(),
      animation: controller,
      builder: (BuildContext context, Widget? childRectangulo) {
        return Transform.translate(
          offset: Offset(moverDerecha.value,0),
          child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity: opacidad.value-opacidadOut.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: childRectangulo),
            )
        
            ),
        );
      },
    );
  }
} 

class _Rectangulo extends StatelessWidget {
  @override
  Widget build( BuildContext context ) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.green
      ),
    );
  }
}