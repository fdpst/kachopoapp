import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Responsive.dart';

class Tab3Page extends StatelessWidget {
  const Tab3Page({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {

    Size screenSize() {
    return MediaQuery.of(context).size;
    }

    return SafeArea(
      child: Scaffold(
          
          backgroundColor: Colors.grey[850],
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
                padding: const EdgeInsets.only(top: 15),
                //height: 80,
                
                width: Responsive.width(100, context),
                height: Responsive.width(21, context),
                
                //color: Colors.red,
                child: Text(
                      'CONTACTO',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.oswald(textStyle: 
                      const TextStyle(color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 50.0)),
                      ),
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
    return Stack(
      
      children: <Widget>[
      
        Image.asset(
              "assets/images/FONDO_P.jpg",
              color: Colors.grey.withOpacity(1),
              colorBlendMode: BlendMode.modulate, 
              //height: MediaQuery.of(context).size.height - 176,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.90,
              //height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
              //filterQuality: FilterQuality.low,
            ),
      
      
       Column(
         
           
         children: [ 
           Container(
              
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    //padding: EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25,),
                    child: Text(
                      'Dudas, recomendaciones, problemas...\nSea lo que sea,\n¡Estamos siempre para servirte!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.oswald(textStyle: 
                      const TextStyle(color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 26.0)),
                          
                      ),
                    ),
      
                    /*const Padding(
                      
                padding: EdgeInsets.symmetric(horizontal: 60), 
                child: Image(
              image: AssetImage('assets/images/corazon.png'),
              width: 50,
              height: 20,
              ),
                )*/
      
      
                ],
              ),
              
              ),
      
              //SizedBox(height: 10),
      
          ImageIcon(const AssetImage('assets/images/whatsapp.png'), ('¡Escribenos un WhastApp!'), context, ('whts')),
      
          //ImageIcon(const AssetImage('assets/images/llamada.png'), ('¿Te urge la respuesta? ¡Llámanos!'), context, ('call')),
      
          ImageIcon(const AssetImage('assets/images/mail.png'), ('Mándanos un email'), context, ('mail')),   
      
         
            ]
          ),
        ]
      );
    }

  ImageIcon(AssetImage assetImage, String textIcon, BuildContext context, String tipoAccion) {

   return Container(
              
              alignment: Alignment.center,
              child: Column(
                
                children: [
                  GestureDetector(
                    onTap: () {
                      
                     if (tipoAccion=='whts'){
                     openwhatsapp(context);
                     }

                     if (tipoAccion=='call'){
                     //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: new Text("LLAMAR"), backgroundColor: Colors.red,));
                     sendToCall();
                     
                     }

                     if (tipoAccion=='mail'){
                     //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: new Text("ENVIAR EMAIL")));
                     sendEmail();
                     }


                    },
                  
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Image(
                  image: assetImage,
                  width: 130,
                  height: 80,
                  ),

             )),

             Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 30),
                child: Text(
                  textIcon,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oswald(textStyle: 
                  const TextStyle(color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 20.0)),
                  ),
                )

              ],
                  
            ),
              
           );
  }

  openwhatsapp(BuildContext buildContext) async{
    
  var whatsapp ="+34635389111";
  var whatsappURlAndroid = "whatsapp://send?phone="+whatsapp+"&text=";
  //var whatsappURlAndroid = "https://google.com";
  var whatappURLIos ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
  if(Platform.isIOS){
    // for iOS phone only
    if( await canLaunch(whatappURLIos)){
       await launch(whatappURLIos, forceSafariVC: false);
    }else{
      ScaffoldMessenger.of(buildContext).showSnackBar(
          SnackBar(content: new Text("whatsapp iOS no installed")));

    }

  }else{
    // android , web
    if( await canLaunch(whatsappURlAndroid)){
      await launch(whatsappURlAndroid);
    }else{
      ScaffoldMessenger.of(buildContext).showSnackBar(
          SnackBar(content: new Text("whatsapp android no installed")));

    }


  }

}

  sendEmail() async {

    final Email send_email = Email(
  body: '',
  subject: '',
  recipients: ['info@kachopoking.es'],
  /*cc: ['example_cc@ex.com'],
  bcc: ['example_bcc@ex.com'],
  attachmentPaths: ['/path/to/email_attachment.zip'],*/
  isHTML: false,
  );

  await FlutterEmailSender.send(send_email);

 }

  void sendToCall() async {
    const url = "tel:+34635389111";   
    if (await canLaunch(url)) {
       await launch(url);
    } else {
      throw 'Could not launch $url';
    }   

  }

}