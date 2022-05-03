import 'package:appvetnew/src/colors/colors_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(color: ColorSelect.btnBackgroundBo1),
          child: Column(
            children: [
              // Primer widget la imagen
              Container(
                padding: const EdgeInsets.only(top: 140),
                width: 150,
                child: Image.asset('lib/assets/pet.png'),
              ),

              Container(
                margin: const EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  onPressed: () => {},
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      FaIcon(FontAwesomeIcons.google),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Text(
                        'Continuar con google',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 48),
                      primary: ColorSelect.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () => {},
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      FaIcon(
                        FontAwesomeIcons.facebookSquare,
                        size: 30,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Text(
                        'Continuar con facebook',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 48),
                      primary: ColorSelect.blueDarker,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () => {Navigator.pushNamed(context, '/register')},
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Icon(
                        Icons.mail_rounded,
                        color: ColorSelect.txtBoSubHe,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Text(
                        'Registrarse con e-mail',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorSelect.txtBoSubHe),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        width: 1,
                        color: Color(0xff64686f),
                      ),
                      minimumSize: const Size(300, 48),
                      primary: ColorSelect.btnBackgroundBo1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 48),
                width: 300,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Entrar como invitado',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: ColorSelect.paginatorNext),
                          )),
                    ),
                    SizedBox(
                      height: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Entrar como vendedor',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: ColorSelect.btnBackgroundBo2),
                          )),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '¿Ya tienes cuenta?',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
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
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
