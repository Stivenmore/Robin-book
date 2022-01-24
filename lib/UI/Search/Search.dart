// ignore_for_file: file_names

import 'package:books/Logic/Models/Standart/ModelSearch.dart';
import 'package:books/Logic/Provider/BookProvider.dart';
import 'package:books/UI/Utils/Colors.dart';
import 'package:books/UI/Utils/Responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    final provider = Provider.of<BookProvider>(context);
    return StreamBuilder(
        stream: provider.suggestionStream,
        builder: (context, AsyncSnapshot<List<ModelSearch>?> snap) {
          if (snap.hasData) {
            return SizedBox(
              height: responsive.height,
              width: responsive.width,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snap.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
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
                                        child: Image.asset(
                                          'assets/RobinBook.png',
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        snap.data![index].title!,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        snap.data![index].author![0]!,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  child: Text(
                                    '1ra Ediction',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    snap.data![index].firtspublicyear
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );
          } else if (snap.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: responsive.hp(50),
              width: responsive.width,
              child: SizedBox(
                height: 200,
                width: 200,
                child: Lottie.asset(
                  "assets/lottie/loading.json",
                  reverse: true,
                ),
              ),
            );
          } else {
            return const Text('Aun no tengo data');
          }
        });
  }
}
