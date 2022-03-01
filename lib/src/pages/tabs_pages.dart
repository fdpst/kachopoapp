import 'package:flutter/material.dart';
import 'package:kachoking/src/pages/tab3_pages.dart';
import 'package:kachoking/src/pages/tab2_pages.dart';
import 'package:provider/provider.dart';

import 'tabs4_pages.dart';


class TabsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        //backgroundColor: Colors.grey[200],
        backgroundColor: Colors.black,
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
       ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      //showUnselectedLabels: true,
      backgroundColor: Colors.grey[850],
      selectedItemColor: Colors.yellow.shade300,
      unselectedItemColor: Colors.yellow.shade300,
      //unselectedItemColor: Colors.grey,
      currentIndex: navegacionModel.paginaActual,
      //onTap: (i) => print('$i'),
      onTap: (i) => navegacionModel.paginaActual = i,
      items: [ 
      
         
           BottomNavigationBarItem(
           
           icon: 
           
           Padding(
             padding: const EdgeInsets.all(2.0),
             child: Image.asset("assets/images/PROMOICON.png", 
             height: 31, width: 30, 
             //color: Colors.grey),
              ),
           ),
           
              
           label: ('PROMOCIONES')
           
           ),
           
           
           
           BottomNavigationBarItem(
             icon: Padding(
             padding: const EdgeInsets.all(2.0),
             child: Image.asset("assets/images/ICON_PEDIDOS.png", 
             height: 31, width: 30,  
             //color: Colors.grey),
              ),
           ),
              
           label: ('HAZ TU PEDIDO')
             
             ),

             BottomNavigationBarItem(
              icon: Padding(
             padding: const EdgeInsets.all(2.0),
             child: Image.asset("assets/images/ICON_CONTACTO.png", 
             height: 31, width: 30,  
             //color: Colors.grey),
              ),
           ),
              
           label: ('CONTACTO')
             
             ),
      
        ],
      );
  }
}

class _Paginas extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);


    return PageView(
      controller: navegacionModel.pageController,
      //physics: const BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: <Widget> [

        Container(
          color: Colors.white,
        ),

        Tab2Page(), //WEBVIEW
        
        Tab3Page(), //CONTACTO

        Tab4Page(),
        /*Container(
          color: Colors.green,
        )*/
        
        
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {

  int _paginaActual = 0;
  
  final PageController _pageController = PageController(initialPage: 4);

  int get paginaActual => _paginaActual;

  set paginaActual (int valor) {

    _paginaActual = valor;

    _pageController.animateToPage(valor, duration: Duration(milliseconds: 5), curve: Curves.bounceInOut);
    
    notifyListeners();

  }

  PageController get pageController => _pageController;

}