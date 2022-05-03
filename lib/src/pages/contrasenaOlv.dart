import 'package:flutter/material.dart';

import '../colors/colors_view.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: ColorSelect.paginatorNext),
          actions: [
            Container(
                width: 100.00,
                // height: 10.00,
                decoration: const BoxDecoration(
                  // color: Colors.amber,
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/pet.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ))
            // Image.asset('lib/assets/pet.png')
          ],
          title: const Text('Recuperar contraseña'),
          backgroundColor: ColorSelect.primaryColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //PRIMER TEXTO
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  // padding: const EdgeInsets.only(right: 10),
                  child: const Text(
                    'Ingresa tu email para restablecer tu contraseña',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: ColorSelect.txtBoSubHe,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      // fontFamily: ''
                    ),
                  ),
                ),
                //LABEL CORREO
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Correo electrónico',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        // fontFamily: ''
                      ),
                    ),
                  ],
                ),
                //TEXT FIELD CORREO
                TextField(
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    // labelText: 'Correo electrónico',
                    hintText: 'Email address',
                    border: OutlineInputBorder(
                        // borderSide: BorderSide(width: 10),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),

                const Padding(padding: EdgeInsets.only(top: 20)),
                //LABEL CONTRA
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Ingrese su correo electrónico registrado y le enviaremos un correo electrónico que contiene un enlace para restablecer su contraseña',
                    style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: ColorSelect.txtBoSubHe),
                  ),
                ),
                //TEXT FIELD CONTRA

                Container(
                  margin: const EdgeInsets.only(top: 340),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Enviar solicitud',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 48),
                        primary: ColorSelect.btnBackgroundBo2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
