import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:explore_beauty/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          splashIconSize: MediaQuery.of(context).size.width / 2,
          splash: Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              AnimatedTextKit(animatedTexts: [
                TyperAnimatedText('KIGALI PIZZA COMPANY',
                    textStyle: GoogleFonts.exo2(
                        fontSize: 25, fontWeight: FontWeight.bold),
                    speed: const Duration(milliseconds: 290))
              ])
            ],
          ),
          splashTransition: SplashTransition.scaleTransition,
          pageTransitionType: PageTransitionType.leftToRightWithFade,
          duration: 5000,
          animationDuration: const Duration(seconds: 1),
          nextScreen: WelcomePage()),
    );
  }
}
