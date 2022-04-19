import 'package:flutter/material.dart';
import 'package:kachoking/src/pages/tab1_pages.dart';
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
        appBar: LocalAppbar(),
        //backgroundColor: Colors.grey[200],
        backgroundColor: Colors.black,
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

AppBar LocalAppbar() {
  return AppBar(
    backgroundColor: Colors.grey[850],
    leading: Consumer<_NavegacionModel>(
        builder: ((context, value, child) => value.paginaActual != 3
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  print(value._pageController.positions.length);
                  value.paginaActual = 3;
                },
              )
            : Container())),
    title: Consumer<_NavegacionModel>(
        builder: ((context, value, child) => Text(value.title))),
  );
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<_NavegacionModel>(
        builder: ((context, value, child) => BottomNavigationBar(
              //showUnselectedLabels: true,
              backgroundColor: Colors.grey[850],
              selectedItemColor: Colors.yellow.shade300,
              unselectedItemColor: Colors.yellow.shade300,
              //unselectedItemColor: Colors.grey,
              currentIndex: value._paginaFooter,
              //onTap: (i) => print('$i'),
              onTap: (i) => value.paginaActual = i,
              items: [
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.asset(
                        "assets/images/PROMOICON.png",
                        height: 31, width: 30,
                        //color: Colors.grey),
                      ),
                    ),
                    label: ('PROMOCIONES')),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.asset(
                        "assets/images/ICON_PEDIDOS.png",
                        height: 31, width: 30,
                        //color: Colors.grey),
                      ),
                    ),
                    label: ('HAZ TU PEDIDO')),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.asset(
                        "assets/images/ICON_CONTACTO.png",
                        height: 31, width: 30,
                        //color: Colors.grey),
                      ),
                    ),
                    label: ('CONTACTO')),
              ],
            )));
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<_NavegacionModel>(
      builder: ((context, value, child) => PageView(
            controller: value.pageController,
            //physics: const BouncingScrollPhysics(),
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Tab1Page(),

              Tab2Page(), //WEBVIEW

              Tab3Page(), //CONTACTO

              Tab4Page(),
              /*Container(
          color: Colors.green,
        )*/
            ],
          )),
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 3;
  int _paginaFooter = 0;
  List<String> _titles = ['Promociones', 'Haz tu Pedido', 'Contacto', 'Inicio'];
  final PageController _pageController = PageController(initialPage: 3);
  String get title => _titles[_paginaActual];
  int get paginaActual => _paginaActual;
  int get paginaFooter => _paginaFooter;

  set paginaActual(int valor) {
    _paginaActual = valor;
    if (valor > 2) {
      _paginaFooter = 0;
    } else {
      _paginaFooter = valor;
    }
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 5), curve: Curves.bounceInOut);

    notifyListeners();
  }

  PageController get pageController => _pageController;
}
