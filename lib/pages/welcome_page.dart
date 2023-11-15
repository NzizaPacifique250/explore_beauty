// ignore_for_file: sort_child_properties_last

import 'package:explore_beauty/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});
  final PageController _controller = PageController();
  List<String> images = [
    'assets/images/explore1.svg',
    'assets/images/explore2.svg'
  ];
  List<String> message = [
    'Feeling lost on where to vacation?  Let us guide you to your perfect getaway!',
    ' Explore endless possibilities with our app!'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: _controller,
          children: List.generate(
            images.length,
            (index) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 280),
                  child: Column(
                    children: [
                      SvgPicture.asset(images[index]),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          message[index],
                          style: GoogleFonts.roboto(fontSize: 40),
                        ),
                      )),
                    ],
                  ),
                ),
                index == 1
                    ? Container(
                        padding: const EdgeInsets.only(top: 20, bottom: 50),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: RawMaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          elevation: 2.0,
                          fillColor: const Color(0xFF257DEE),
                          hoverColor: const Color(0xFF1357A9),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 18.0, horizontal: 24.0),
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                              ),
                            ),
                          ),
                          shape: const StadiumBorder(),
                        ),
                      )
                    : Container()
              ],
            ),
          )),
    );
  }
}
