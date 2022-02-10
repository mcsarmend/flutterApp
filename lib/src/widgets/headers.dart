import 'package:flutter/material.dart';


class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0XFF615AAB),
    );
  }

}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0XFF615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}
class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz= Paint();
    // Propiedades 
    lapiz.color = const Color(0XFF615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2 ;
    final path = Path();

    //Dibujar con el path y el lapiz
    path.moveTo(0, size.height*0.35);
    path.lineTo(size.width, size.height*0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);


    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }


}

class HeaderBorder extends StatelessWidget {
  const HeaderBorder({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      
      decoration: const BoxDecoration(
        color: Color(0XFF615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70)
          )
      ),
    );
  }
}

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0XFF615AAB),
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}
class _HeaderTriangularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz= Paint();
    // Propiedades 
    lapiz.color = const Color(0XFF615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2 ;
    final path = Path();

    //Dibujar con el path y el lapiz
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);


    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }


}

class HeaderPico extends StatelessWidget {
  const HeaderPico({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0XFF615AAB),
      child: CustomPaint(
        painter: _HeaderpicoPainter(),
      ),
    );
  }
}
class _HeaderpicoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz= Paint();
    // Propiedades 
    lapiz.color = const Color(0XFF615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2 ;
    final path = Path();

    //Dibujar con el path y el lapiz
    path.lineTo(0, size.height*0.25);
    path.lineTo(size.width*0.5, size.height*0.30);
    path.lineTo(size.width, size.height*0.25);


    path.lineTo(size.width, 0);
    path.lineTo(0, 0);


    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }


}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0XFF615AAB),
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}
class _HeaderCurvoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz= Paint();
    // Propiedades 
    lapiz.color = const Color(0XFF615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 10 ;
    final path = Path();

    //Dibujar con el path y el lapiz
    path.lineTo(0, size.height*0.25);
    // path.lineTo(size.width, size.height*0.25);
    path.quadraticBezierTo(size.width*0.5, size.height*0.35, size.width, size.height*0.25);
    path.lineTo(size.width, 0);
    


    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }


}

class HeaderOla extends StatelessWidget {
  const HeaderOla({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0XFF615AAB),
      child: CustomPaint(
        painter: _HeaderOlaPainter(),
      ),
    );
  }
}
class _HeaderOlaPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz= Paint();
    // Propiedades 
    lapiz.color = const Color(0XFF615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 10 ;
    final path = Path();

    //Dibujar con el path y el lapiz
    path.lineTo(0, size.height*0.25);
    // path.lineTo(size.width, size.height*0.25);
    path.quadraticBezierTo(size.width*0.15, size.height*0.30, size.width*0.5, size.height*0.25);
    path.quadraticBezierTo(size.width*0.85, size.height*0.20, size.width, size.height*0.25);
    path.lineTo(size.width, 0);
    


    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }


}

class HeaderOlaGradiente extends StatelessWidget {
  const HeaderOlaGradiente({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0XFF615AAB),
      child: CustomPaint(
        painter: _HeaderOlaGradientePainter(),
      ),
    );
  }
}
class _HeaderOlaGradientePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(
      center: const Offset(0.0,55.0), 
      radius: 180
      );
    const Gradient gradiente =  LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter ,
      colors: <Color>[
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),

      ],
      stops: [0.2,0.5,1.0]
      );
    final lapiz= Paint()..shader = gradiente.createShader(rect) ;
    // Propiedades 
    //lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill;

    lapiz.strokeWidth = 10 ;
    final path = Path();

    //Dibujar con el path y el lapiz
    path.lineTo(0, size.height*0.25);
    // path.lineTo(size.width, size.height*0.25);
    path.quadraticBezierTo(size.width*0.15, size.height*0.30, size.width*0.5, size.height*0.25);
    path.quadraticBezierTo(size.width*0.85, size.height*0.20, size.width, size.height*0.25);
    path.lineTo(size.width, 0);
    


    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }


}

