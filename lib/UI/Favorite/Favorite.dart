// ignore_for_file: file_names
import 'package:books/Logic/Models/Hive/HiveBook.dart';
import 'package:books/Logic/Models/Standart/ModelSearch.dart';
import 'package:books/UI/Details/Details.dart';
import 'package:books/UI/Utils/Colors.dart';
import 'package:books/UI/Utils/Responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class Favoritos extends StatelessWidget {
  Favoritos({Key? key}) : super(key: key);

  final listbox = Hive.box<HiveBook>('HiveBook');
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
        centerTitle: true,
        title: Text(
          'Favorite',
          style: GoogleFonts.abhayaLibre(
              textStyle: TextStyle(
                  color: BookColor.orangebold,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: SizedBox(
          height: responsive.height,
          width: responsive.width,
          child: listbox.length > 0
              ? ListView.builder(
                  itemCount: listbox.length,
                  itemBuilder: (context, index) {
                    final books = listbox.get(index) as HiveBook;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                    description: books.description!,
                                    urlImage: books.urlImg!,
                                    modelSearch: ModelSearch(
                                        author: books.author,
                                        contributor: books.contributor,
                                        key: '',
                                        time: books.time,
                                        title: books.title,
                                        numberofpagemediam:
                                            books.numberofpagemediam,
                                        firtspublicyear: books.firtspublicyear,
                                        editioncount: books.editioncount))));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: responsive.width,
                          decoration: BoxDecoration(
                              color: BookColor.gray2.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: SizedBox(
                                      height: 100,
                                      width: 130,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: SizedBox(
                                          height: 280,
                                          width: 160,
                                          child: FadeInImage.assetNetwork(
                                            placeholder: 'assets/RobinBook.png',
                                            image: books.urlImg!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          books.title!,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          books.author![0]!,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    child: Text(
                                      'Edicción',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      books.firtspublicyear == 0
                                          ? ''
                                          : books.firtspublicyear.toString(),
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : Container(
                  child: Center(
                    child: Text(
                      'You have no books added :(',
                      style: GoogleFonts.abhayaLibre(
                          textStyle: TextStyle(
                              color: BookColor.orangebold, fontSize: 20)),
                    ),
                  ),
                )),
    );
  }
}
