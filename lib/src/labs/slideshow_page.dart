import 'package:disenos_app/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (_)=> SliderModel(),
      child: Scaffold(
        body: Center(
         child:Column(
           children: const <Widget>[
             Expanded(
               child: _Slides()
               ),
            _Dots()
           ],
         )
         // child: Text("Hola mundo")
        ),
      ),
    );
  }
}
//SvgPicture.asset('assets/svgs/slide-1.svg')

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  _Dot (this.index);

  @override
  Widget build(BuildContext context) {

    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration (milliseconds: 500) ,
      width: 12,
      height: 12,
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index -0.5  && pageViewIndex < index + 0.5 )
        ? Colors.blue : Colors.grey,
        shape: BoxShape.circle
      ),
    );
  }
}



class _Slides extends StatefulWidget {
  const _Slides({ Key? key }) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final pageViewController = PageController();
  
  @override
  void initState() {
    pageViewController.addListener(() {
      //print("Pagina actual ${ pageViewController.page }");
      Provider.of<SliderModel>(context,listen: false).currentPage = pageViewController.page! ;
    });
    super.initState();
  }


  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: PageView(
        controller:  pageViewController,
        children: <Widget>[
          _Slide('assets/svgs/slide-1.svg'),
          _Slide('assets/svgs/slide-2.svg'),
          _Slide('assets/svgs/slide-3.svg'),

        ],
      ),
      
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;
  _Slide(this.svg);
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}