// ignore_for_file: file_names

import 'package:books/Logic/Models/Hive/HiveBook.dart';
import 'package:books/Logic/Models/Standart/ModelSearch.dart';
import 'package:books/UI/Utils/Colors.dart';
import 'package:books/UI/Utils/Responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class Details extends StatefulWidget {
  final String description;
  final String urlImage;
  final ModelSearch modelSearch;
  const Details(
      {Key? key,
      required this.description,
      required this.urlImage,
      required this.modelSearch})
      : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Icon(
                Icons.arrow_back_ios,
                color: BookColor.orangebold,
                size: 28,
              ),
            )),
      ),
      body: SizedBox(
        height: responsive.height,
        width: responsive.width,
        child: Stack(
          children: [
            SizedBox(
                height: responsive.hp(50),
                width: responsive.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                        height: 280,
                        width: 160,
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/RobinBook.png',
                          image: widget.urlImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Number pages',
                                style: GoogleFonts.abhayaLibre(),
                              ),
                              Text(widget.modelSearch.numberofpagemediam!
                                          .toString() ==
                                      '0'
                                  ? ''
                                  : widget.modelSearch.numberofpagemediam!
                                      .toString())
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 3),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: BookColor.orangebold),
                              child: IconButton(
                                  onPressed: () async {
                                    final box = Hive.box<HiveBook>('HiveBook');
                                    if (box.length > 0) {
                                      bool validate = false;
                                      box.values.forEach((element) {
                                        if (element.title ==
                                            widget.modelSearch.title) {
                                          setState(() {
                                            validate = true;
                                          });
                                        }
                                      });
                                      if (validate == true) {
                                        ScaffoldMessenger.of(context)
                                            .showMaterialBanner(MaterialBanner(
                                                content: Text(
                                                  'This book already exists in favorites',
                                                  style:
                                                      GoogleFonts.abhayaLibre(),
                                                ),
                                                actions: [
                                              IconButton(
                                                  onPressed: () {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentMaterialBanner();
                                                  },
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: BookColor.orangebold,
                                                  ))
                                            ]));
                                      } else {
                                        HiveBook hiveBook = HiveBook(
                                            author: widget.modelSearch.author,
                                            contributor:
                                                widget.modelSearch.contributor,
                                            description: widget.description,
                                            editioncount:
                                                widget.modelSearch.editioncount,
                                            firtspublicyear: widget
                                                .modelSearch.firtspublicyear,
                                            numberofpagemediam: widget
                                                .modelSearch.numberofpagemediam,
                                            time: widget.modelSearch.time,
                                            title: widget.modelSearch.title,
                                            urlImg: widget.urlImage);
                                        box.add(hiveBook);
                                      }
                                    } else {
                                      HiveBook hiveBook = HiveBook(
                                          author: widget.modelSearch.author,
                                          contributor:
                                              widget.modelSearch.contributor,
                                          description: widget.description,
                                          editioncount:
                                              widget.modelSearch.editioncount,
                                          firtspublicyear: widget
                                              .modelSearch.firtspublicyear,
                                          numberofpagemediam: widget
                                              .modelSearch.numberofpagemediam,
                                          time: widget.modelSearch.time,
                                          title: widget.modelSearch.title,
                                          urlImg: widget.urlImage);
                                      box.add(hiveBook);
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'First Editions',
                                style: GoogleFonts.abhayaLibre(),
                              ),
                              Text(widget.modelSearch.firtspublicyear!
                                          .toString() ==
                                      '0'
                                  ? ''
                                  : widget.modelSearch.firtspublicyear!
                                      .toString())
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: responsive.hp(42),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 7), // changes position of shadow
                        ),
                      ]),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Text(
                              widget.modelSearch.title!,
                              style: GoogleFonts.abhayaLibre(
                                  textStyle: const TextStyle(fontSize: 24)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Text(
                              widget.modelSearch.author![0]!,
                              style: GoogleFonts.abhayaLibre(
                                  textStyle: const TextStyle(fontSize: 24)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              widget.description,
                              style: GoogleFonts.abhayaLibre(
                                  textStyle: const TextStyle(fontSize: 18)),
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
