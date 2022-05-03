import 'package:flutter/material.dart';

import '../colors/colors_view.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isObscure = true;
  bool _checkBox = false;

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
          title: const Text('Régistrate'),
          backgroundColor: ColorSelect.primaryColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //PRIMER TEXTO
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 40),
                      // padding: const EdgeInsets.only(right: 10),
                      child: const Text(
                        'Crea una cuenta para empezar a usar la app',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorSelect.txtBoSubHe,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.5,
                          // fontFamily: ''
                        ),
                      ),
                    ),
                  ],
                ),
                //LABEL CORREO

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Nombre',
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
                    hintText: 'Nombre completo',
                    border: OutlineInputBorder(
                        // borderSide: BorderSide(width: 10),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Contraseña',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        // fontFamily: ''
                      ),
                    ),
                  ],
                ),
                //TEXT FIELD CONTRA
                TextField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            // print('a');
                            // print(_isObscure);
                            _isObscure = !_isObscure;
                            // print(_isObscure);
                          });
                          // print('a');
                        },
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    // labelText: 'Correo electrónico',
                    hintText: 'Password',

                    border: const OutlineInputBorder(
                        // borderSide: BorderSide(width: 10),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),


                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: const Text(
                      'La contraseña debe de contener caracteres, numeros y simbolos con un minimo de 6 caracteres',
                      style: TextStyle(color: ColorSelect.txtBoSubHe)),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 15),
                  // color: Colors.amber,
                  child: Row(
                    children: [
                      Checkbox(
                        value: _checkBox,
                        onChanged: (a) {
                          setState(() {
                            _checkBox = a!;
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Container(
                        child: const Text(
                            'Al registrarme acepto terminos y \ncondiciones y la politica de privacidad'),
                      )
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Ver terminos y condiciones',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: ColorSelect.paginatorNext),
                        ))
                  ],
                ),

                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Crear cuenta',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        // color: ColorSelect.paginatorNext
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 48),
                        primary: ColorSelect.btnBackgroundBo2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Row(
                    children: [
                      const Text('¿Ya tienes una cuenta?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          'Iniciar sesion',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: ColorSelect.paginatorNext),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
