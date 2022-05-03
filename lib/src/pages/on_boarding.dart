import 'package:flutter/material.dart';

import '../colors/colors_view.dart';
import '../widget/ContentBoarding.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int pages = 0;

  PageController controller = PageController(initialPage: 0);

  List<Map<String, String>> dataOnbording = [
    {
      'text': 'ESPARCIMIENTO',
      'text1': 'Brindamos todos los servicios para consentir',
      'image': 'lib/assets/B1.png',
    },
    {
      'text': 'ADOPCION',
      'text1': 'Brindamos todos los servicios para consentir',
      'image': 'lib/assets/B2.png',
    },
    {
      'text': 'HOSPITALIDAD',
      'text1': 'Brindamos todos los servicios para consentir',
      'image': 'lib/assets/B3.png',
    },
    {
      'text': 'VETERINARIA',
      'text1': 'Brindamos todos los servicios para consentir',
      'image': 'lib/assets/B4.png',
    },
    {
      'text': 'TIENDA',
      'text1': 'Brindamos todos los servicios para consentir',
      'image': 'lib/assets/B5.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            // LAS CARD

            Expanded(
                flex: 4,
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      pages = value;
                    });
                  },
                  itemCount: dataOnbording.length,
                  itemBuilder: (context, index) {
                    return ContentBoarding(
                        text: dataOnbording[index]['text'],
                        text2: dataOnbording[index]['text1'],
                        image: dataOnbording[index]['image']);
                  },
                )),

            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      dataOnbording.length,
                      (index) => newMethod(index: index),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 180)),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: pages == dataOnbording.length - 1
                          ? () {
                              Navigator.pushReplacementNamed(
                                  context, '/progressIndicator');
                            }
                          : () {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 150),
                                  curve: Curves.easeIn);
                            }
                      
                      ,
                      
                      child: Text(
                        pages == dataOnbording.length - 1
                            ? 'Continuar'
                            : 'Siguiente',
                        style: TextStyle(
                            color: pages == dataOnbording.length - 1
                                ? ColorSelect.btnBackgroundBo1
                                : ColorSelect.txtBoSubHe,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25), // <-- Radius
                        ),
                        side: BorderSide(
                          width: 3.0,
                          color: pages == dataOnbording.length - 1
                              ? ColorSelect.btnBackgroundBo2
                              : ColorSelect.txtBoSubHe,
                        ),
                        primary: pages == dataOnbording.length - 1
                            ? ColorSelect.btnBackgroundBo2
                            : ColorSelect.btnBackgroundBo1,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  AnimatedContainer newMethod({required int index}) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color:
            pages == index ? ColorSelect.paginatorNext : ColorSelect.txtBoSubHe,
      ),
      duration: kThemeAnimationDuration,
      height: 5,
      width: pages == index ? 20 : 15,
    );
  }
}
