import 'package:appvetnew/src/colors/colors_view.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // String correo = '';
  // ValueNotifier<String> contra = ValueNotifier('');
  // ValueNotifier<String> correo = ValueNotifier('');
  // String contra = '';
  bool _isObscure = true;
  // ValueNotifier<bool> obscure = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
          title: const Text('Iniciar sesión'),
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
                        'Inicia sesion con tu cuenta para continuar',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorSelect.txtBoSubHe,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgotPassword');
                      },
                      child: const Text(
                        '¿Has olvidado tu contraseña?',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: ColorSelect.paginatorNext),
                      ),
                    ),
                  ],
                ),

                Container(
                  margin: const EdgeInsets.only(top: 220),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Enviar solicitud',
                      style: TextStyle(fontSize: 20),
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
                      const Text('¿Todavía no tienes una cuenta?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text(
                          'Registrate',
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
