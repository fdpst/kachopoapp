import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Responsive.dart';

class Tab4Page extends StatelessWidget {
  const Tab4Page({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {

    Size screenSize() {
    return MediaQuery.of(context).size;
    }

    return SafeArea(
      child: Scaffold(
          
          //backgroundColor: Colors.grey[850],
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
          
            //width: Responsive.width(100, context),
            //height: Responsive.width(50, context)
            
            //mainAxisSize: MainAxisSize.values(10),
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              
              Container(
                
                color: Colors.black,
                padding: const EdgeInsets.all(10),
                //height: 80,
                
                width: Responsive.width(65, context),
                height: Responsive.height(21, context),
                
                //color: Colors.red,
                child: const Image(
                  fit: BoxFit.cover,
              image: AssetImage('assets/images/LOGO.png')),
              ),
              
              
              
              ImagenPpal(),
              
              
              
              
              
            ],
                  ),
          )),
    );
       
  }

  
}





class ImagenPpal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Stack(
          
          children: <Widget>[
          
            Image.asset(
                  "assets/images/FONDO_P.jpg",
                  color: Colors.grey.withOpacity(1),
                  colorBlendMode: BlendMode.modulate, 
                  //height: MediaQuery.of(context).size.height - 176,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.85,
                  //height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                  //filterQuality: FilterQuality.low,
                ),
          
          
           Column(
             
               
             children: [ 
               Container(
              
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  '¡BIENVENIDO/A,\nKACHOPO KING\nEXCLUSIVO!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.yellow.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0),
                  ),
                ),
              
              ),

          
                  //SizedBox(height: 10),
          
              Container(
              
              alignment: Alignment.center,
              child: const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Image(
              image: AssetImage('assets/images/ICON_MEDALLA.png'),
              width: 170,
              height: 130,
              ),
                ),
              
              )
          
             
                ]
              ),
            ]
          ),
      ),
    );
  }



}