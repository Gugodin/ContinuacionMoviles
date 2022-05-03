// import 'package:aurora_app/src/models/user.dart';
// import 'package:aurora_app/src/providers/GmailAndPasswordRegister.dart';
// import 'package:aurora_app/src/utils/constants.dart';
// import 'package:aurora_app/src/utils/modal_datePicker.dart';
// import 'package:aurora_app/src/widgets/check_box.dart';
// import 'package:aurora_app/src/widgets/choice_box.dart';
// import 'package:aurora_app/src/widgets/date_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   ValueNotifier<String> name = ValueNotifier('');
//   ValueNotifier<String> gmail = ValueNotifier('');
//   ValueNotifier<String> password = ValueNotifier('');
//   ValueNotifier<DateTime> age = ValueNotifier(DateTime.now());
//   ValueNotifier<int> gender = ValueNotifier(5);
//   ValueNotifier<bool> termsAndConditions = ValueNotifier(false);
//   ValueNotifier<String> cadena = ValueNotifier('Fecha de Nto');

//   ValueNotifier<String> messageErrorEmail = ValueNotifier('');
//   ValueNotifier<String> messageErrorPassword = ValueNotifier('');

//   void initState() {
//     verifyUser();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(
//                       top: size.height * 0.05,
//                       left: size.width * 0.08,
//                       bottom: size.height * 0.05),
//                   child: Text(
//                     'REGISTRARSE',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.purple,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             //InputsText, datePicker, choiceBox
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: createInputs(size, context),
//               ),
//             ),
//             //CheckBox terms and conditions
//             Container(
//               margin: EdgeInsets.only(top: 30, left: size.width * 0.05),
//               child: CheckBoxDynamic(
//                 hinText: 'Acepto los términos y condiciones',
//                 getValue: (value) {
//                   termsAndConditions.value = value;
//                 },
//               ),
//             ),
//             //Button register
//             Container(
//               //Here we have the listener to know when the checkbox of terms and conditions is clicked
//               child: SizedBox(
//                 width: size.width * 0.5,
//                 child: ValueListenableBuilder<bool>(
//                   valueListenable: termsAndConditions,
//                   builder: (context, value, child) {
//                     return ElevatedButton(
//                       style: ButtonStyle(
//                           textStyle: MaterialStateProperty.all(TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15,
//                               color: Colors.white)),
//                           backgroundColor: (termsAndConditions.value &&
//                                   name.value != '' &&
//                                   gmail.value != '' &&
//                                   password.value != '' &&
//                                   age.value != DateTime.now() &&
//                                   gender.value != 5)
//                               ? MaterialStateProperty.all(Color(0xff881C67))
//                               : MaterialStateProperty.all(Color(0xffB36896))),
//                       child: Text(
//                         'REGISTRARSE',
//                       ),
//                       onPressed: (termsAndConditions.value &&
//                               name.value != '' &&
//                               gmail.value != '' &&
//                               password.value != '' &&
//                               age.value != DateTime.now() &&
//                               gender.value != 5)
//                           ? () {
//                               //REGISTER
//                               UserModel user = new UserModel(
//                                   name: name.value,
//                                   email: gmail.value,
//                                   password: password.value,
//                                   age: getAge(age.value),
//                                   favs: [],
//                                   sex: gender.value,
//                                   statusNotifications: true);

//                               GmailAndPaswordRegister register =
//                                   GmailAndPaswordRegister();
//                               register
//                                   .registerEmailPassword(user)
//                                   .then((value) {
//                                 if (value != null) {
//                                   if (value.code == 'email-already-in-use') {
//                                     messageErrorEmail.value =
//                                         'Correo electronico ya registrado';
//                                   } else if (value.code == 'weak-password') {
//                                     messageErrorPassword.value =
//                                         'Contraseña muy corta';
//                                   }
//                                 } else {
//                                   showModalRegistered(context);
//                                   verifyUser();
//                                 }
//                               });
//                             }
//                           : null,
//                     );
//                   },
//                 ),
//               ),
//             ),
//             Divider(
//               color: Colors.black,
//               thickness: 2,
//               indent: 100,
//               endIndent: 100,
//             ),
//             Text(
//               'O entra con',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 10),
//               padding: EdgeInsets.only(bottom: 30),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(left: 50, right: 50),
//                     width: 70,
//                     height: 70,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       color: Color(4287175783),
//                     ),
//                     child: IconButton(
//                         onPressed: () {},
//                         icon: FaIcon(
//                           FontAwesomeIcons.google,
//                           color: Colors.white,
//                           size: 40,
//                         )),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(right: 50),
//                     width: 70,
//                     height: 70,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       color: Color(4287175783),
//                     ),
//                     child: IconButton(
//                         onPressed: () {},
//                         icon: FaIcon(
//                           FontAwesomeIcons.apple,
//                           color: Colors.white,
//                           size: 50,
//                         )),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   List<Widget> createInputs(Size size, BuildContext context) {
//     List<String> genders = ['Mujer', 'Hombre', 'Prefiero no decirlo'];
//     return [
//       Container(
//         margin: EdgeInsets.only(bottom: 20),
//         width: size.width * 0.85,
//         child: TextField(
//           decoration: InputDecoration(
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
//             enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.purple, width: 2)),
//             hintText: 'Nombre',
//             labelText: 'Nombre',
//             suffixIcon: Icon(Icons.account_circle),
//           ),
//           onChanged: (value) {
//             name.value = value;
//           },
//         ),
//       ),
//       Container(
//         margin: EdgeInsets.only(bottom: 20),
//         width: size.width * 0.85,
//         child: ValueListenableBuilder<String>(
//           valueListenable: messageErrorEmail,
//           builder: (context, value, child) {
//             return TextField(
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(
//                 errorText: messageErrorEmail.value == ''
//                     ? null
//                     : messageErrorEmail.value,
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.purple, width: 2)),
//                 hintText: 'Correo Electrónico',
//                 labelText: 'Correo Electrónico',
//                 suffixIcon: Icon(Icons.email),
//               ),
//               onChanged: (value) {
//                 if (RegExp(EMAIL_REGEX).hasMatch(value)) {
//                   gmail.value = value;
//                   messageErrorEmail.value = '';
//                 } else {
//                   messageErrorEmail.value = 'Introduzca un correo valido';
//                 }
//               },
//             );
//           },
//         ),
//       ),
//       Container(
//         margin: EdgeInsets.only(bottom: 20),
//         width: size.width * 0.85,
//         child: ValueListenableBuilder(
//           valueListenable: messageErrorPassword,
//           builder: (context, value, child) {
//             return TextField(
//               obscureText: true,
//               decoration: InputDecoration(
//                 errorText: messageErrorPassword.value == ''
//                     ? null
//                     : messageErrorPassword.value,
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.purple, width: 2)),
//                 hintText: 'Contraseña',
//                 labelText: 'Contraseña',
//                 suffixIcon: Icon(Icons.lock),
//               ),
//               onChanged: (value) {
//                 password.value = value;
//               },
//             );
//           },
//         ),
//       ),
//       //DatePicker with a listener to know when the dateTime has change
//       Container(
//         width: size.width * 0.85,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               width: size.width * 0.4,
//               child: ValueListenableBuilder<String>(
//                 valueListenable: cadena,
//                 builder: (context, value, child) {
//                   return TextField(
//                       readOnly: true,
//                       decoration: InputDecoration(
//                         hintText: value,
//                         enabledBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: Colors.purple, width: 2)),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                       ),
//                       onTap: () {
//                         ModalDatePicker.showSheet(context, child: DatePicker(
//                           getDateTime: (value) {
//                             cadena.value =
//                                 '  ${value.day} / ${value.month} / ${value.year}';
//                             age.value = value;
//                           },
//                         ));
//                       });
//                 },
//               ),
//             ),
//             //Choise box
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.purple, width: 2),
//                   borderRadius: BorderRadius.circular(5)),
//               height: 55,
//               width: size.width * 0.4,
//               child: ChoiceBox(
//                 list: genders,
//                 hint: 'Sexo',
//                 getSelection: (selection) {
//                   gender.value = genders.indexOf(selection);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(top: 10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               '*Aurora es para mayores de edad',
//               textAlign: TextAlign.start,
//               style: TextStyle(color: Colors.purple, fontSize: 12),
//             ),
//           ],
//         ),
//       ),
//     ];
//   }

//   int getAge(DateTime birthday) {
//     Duration dur = DateTime.now().difference(birthday);
//     int differenceInYears = (dur.inDays / 365).floor();

//     return differenceInYears;
//   }

//   void showModalRegistered(BuildContext context) {
//     showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: Colors.pink[900],
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//           content: Container(
//             child: Column(mainAxisSize: MainAxisSize.min, children: [
//               Container(
//                 width: 200.0,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(100.0),
//                   color: Color(0xFF9A2073),
//                 ),
//                 child: Container(
//                     margin: EdgeInsets.all(25.0),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(80.0),
//                       color: Color(0xFFAA247E),
//                     ),
//                     child: Container(
//                         margin: EdgeInsets.all(25.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50.0),
//                           color: Color(0xFFA5176E),
//                         ),
//                         child: Icon(
//                           Icons.check,
//                           size: 100.0,
//                           color: Colors.white,
//                         ))),
//               ),
//               SizedBox(height: 15.0),
//               Container(
//                 child: Text(
//                   "REGISTRO EXITOSO",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ]),
//           ),
//         );
//       },
//     );
//   }

//   void verifyUser() {
//     if (FirebaseAuth.instance.currentUser?.uid != null) {
//       Navigator.of(context).pushNamedAndRemoveUntil(
//           'roomsAvailableScreen', (Route<dynamic> route) => false);
//     }
//   }
// }
