// ignore_for_file: file_names

import 'package:books/UI/Home/Home.dart';
import 'package:books/UI/Utils/Animations/Sample/FadeAnimation.dart';
import 'package:books/UI/Utils/Colors.dart';
import 'package:books/UI/Utils/Responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    intothehome(context);
  }

  void intothehome(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => const Home()), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      body: SizedBox(
        height: responsive.height,
        width: responsive.width,
        child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 900),
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (context, value, child) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Transform.translate(
                      offset: Offset(0, responsive.hp(18) * value),
                      child: FadeAnimation(
                        700,
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Lottie.asset(
                            "assets/lottie/loading.json",
                            reverse: true,
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, responsive.hp(19) * value),
                      child: FadeAnimation(
                        750,
                        Text(
                          'ROBIN BOOK',
                          style: GoogleFonts.abhayaLibre(
                              textStyle: const TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, responsive.hp(21) * value),
                      child: FadeAnimation(
                        800,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Tu biblioteca favorita, al alcanze de la mano.',
                            style: GoogleFonts.abhayaLibre(
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, responsive.hp(25) * value),
                      child: FadeAnimation(
                        850,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Comparte con nosotros un mundo de imaginación e historias fantásticas y disfruta de un buen libro.',
                            style: GoogleFonts.abhayaLibre(
                              textStyle: const TextStyle(
                                  fontSize: 20, fontStyle: FontStyle.italic),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0.0, responsive.height * (1.4 - value)),
                      child: FadeAnimation(
                        900,
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CircularProgressIndicator(
                              color: BookColor.pinkred,
                            )),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
