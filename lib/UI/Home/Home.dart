// ignore_for_file: file_names

import 'package:books/UI/Utils/Animations/Sample/FadeAnimation.dart';
import 'package:books/UI/Utils/Colors.dart';
import 'package:books/UI/Utils/Responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25, top: 6),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: BookColor.orangered,
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  )),
            ),
          )
        ],
      ),
      body: SizedBox(
        height: responsive.height,
        width: responsive.width,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Text(
                  'Es hora de \nleer!',
                  style: GoogleFonts.abhayaLibre(
                      textStyle: const TextStyle(
                          fontSize: 38, fontWeight: FontWeight.w800)),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 70,
                  width: responsive.wp(90),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: responsive.wp(70),
                        decoration: BoxDecoration(
                            color: BookColor.gray1,
                            borderRadius: BorderRadius.circular(8)),
                        child: TextFormField(
                          cursorColor: BookColor.orangered,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Icon(
                                Icons.search,
                                color: BookColor.gray2,
                              ),
                            ),
                            hintText: 'Buscar',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: BookColor.gray1),
                                gapPadding: 0.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: BookColor.gray1),
                                gapPadding: 0.0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: BookColor.gray1),
                                gapPadding: 0.0),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: BookColor.orangered),
                          child: const Icon(
                            Icons.gesture,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Text(
                      'Libros de amor',
                      style: GoogleFonts.abhayaLibre(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    width: responsive.width,
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      slivers: [
                        SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                          return FadeAnimation(
                            (100 * index),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Container(
                                height: 250,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: BookColor.orangered,
                                    borderRadius: BorderRadius.circular(16)),
                              ),
                            ),
                          );
                        }, childCount: 10))
                      ],
                    ),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Text(
                      'Recomendaciones',
                      style: GoogleFonts.abhayaLibre(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    width: responsive.width,
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      slivers: [
                        SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                          return FadeAnimation(
                            (100 * index),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Container(
                                height: 250,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: BookColor.orangered,
                                    borderRadius: BorderRadius.circular(16)),
                              ),
                            ),
                          );
                        }, childCount: 10))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
