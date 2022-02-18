
import 'package:flutter/material.dart';

class PinterestButton {
  final VoidCallback  onPressed;
  final IconData icon;

  PinterestButton({
      required this.onPressed, 
      required this.icon
  });
}



class PinterestMenu extends StatelessWidget {
  
  final List<PinterestButton> items = [
    PinterestButton(icon: Icons.pie_chart,onPressed: (){print("Icon pie_chart");}) ,
    PinterestButton(icon: Icons.search,onPressed: (){print("Icon search");}) ,
    PinterestButton(icon: Icons.notifications,onPressed: (){print("Icon notifications");}) ,
    PinterestButton(icon: Icons.supervised_user_circle,onPressed: (){print("Icon supervised_user_circle");}) ,
  ];



  @override
  Widget build(BuildContext context) {
    return Center(
      child: _PinterestMenuBackgorund(
        child: _MenuItems(items),
      ),
    );
  }
}

class _PinterestMenuBackgorund extends StatelessWidget {


  final Widget child;
  const _PinterestMenuBackgorund({required this.child}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
          child: child,
          width: 250,
          height: 60,
          decoration: const BoxDecoration(
            color: Color(0xFFE1F5FE),
            borderRadius: BorderRadius.all(Radius.circular(100)),
            boxShadow: <BoxShadow>[
               BoxShadow(
                 color: Colors.black38,
                 //offset: Offset(10,10),
                 blurRadius: 10,
                 spreadRadius: 0
               )
            ]
          ),
          
    );
  }
}

class _MenuItems extends StatelessWidget {
  
   final List<PinterestButton> menuItems;
   _MenuItems(this.menuItems);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (i) => _PinterestMenuButton(i,menuItems[i]))
      
    );
  }
}


class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;
  _PinterestMenuButton(
    this.index, this.item
  );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onPressed,
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: 25,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado=0;
  int get itemSeleccionado => _itemSeleccionado;
  set itemSeleccionado(int index){
    _itemSeleccionado = index;
    notifyListeners();
  }

  
}