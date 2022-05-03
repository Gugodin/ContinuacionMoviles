import 'package:flutter/material.dart';

import '../colors/colors_view.dart';

class ContentBoarding extends StatelessWidget {

  
  const ContentBoarding({
    required  this.text,
    required this.text2,
    required  this.image,
    Key? key}) : super(key: key);

  final String? text,text2,image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Image.asset(image!,width: 290,height: 290,),

        Text(text!,
        style: const TextStyle(
          color: ColorSelect.txtBoHe,
          fontSize: 21,
          fontWeight: FontWeight.bold
        ),),

        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(text2!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            color: ColorSelect.txtBoSubHe
          ),),
        ),


      ],
    );
  }
}