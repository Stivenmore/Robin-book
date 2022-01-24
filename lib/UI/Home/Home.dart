// ignore_for_file: file_names

import 'package:books/Logic/Models/Standart/ModelSearch.dart';
import 'package:books/Logic/Provider/BookProvider.dart';
import 'package:books/UI/Details/Details.dart';
import 'package:books/UI/Search/Search.dart';
import 'package:books/UI/Utils/Animations/Sample/FadeAnimation.dart';
import 'package:books/UI/Utils/Colors.dart';
import 'package:books/UI/Utils/Responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textController = TextEditingController();
  int des = 0;
  int rec = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookProvider>(context, listen: false);
    Responsive responsive = Responsive(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25, top: 3, bottom: 3),
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
                  "it's time to\nreading!",
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
                          controller: textController,
                          cursorColor: BookColor.orangered,
                          onChanged: (value) {
                            provider.getStreamSearch(value);
                            setState(() {});
                          },
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
                child: textController.text == ''
                    ? SizedBox(
                        height: responsive.height,
                        child: CustomScrollView(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          slivers: [
                            SliverToBoxAdapter(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Text(
                                      'Featured books',
                                      style: GoogleFonts.abhayaLibre(
                                        textStyle:
                                            const TextStyle(fontSize: 20),
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
                                                SliverChildBuilderDelegate(
                                                    (context, index) {
                                          return GestureDetector(
                                            onTap: () async {
                                              setState(() {
                                                des = index;
                                              });
                                              final detailbook = await provider
                                                  .getSearchForApiGoogle(
                                                q: provider
                                                    .modelsubjectlover[index]
                                                    .title!,
                                              );
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) => Details(
                                                          description:
                                                              detailbook[
                                                                  "Description"],
                                                          urlImage: detailbook[
                                                              "MapImage"],
                                                          modelSearch: ModelSearch(
                                                              key: '',
                                                              title: provider
                                                                  .modelsubjectlover[
                                                                      index]
                                                                  .title!,
                                                              editioncount: 0,
                                                              firtspublicyear: 0,
                                                              numberofpagemediam: 0,
                                                              contributor: [],
                                                              author: [
                                                                provider
                                                                    .modelsubjectlover[
                                                                        index]
                                                                    .authors![0]
                                                                    .name
                                                              ],
                                                              time: [
                                                                ''
                                                              ]))));
                                            },
                                            child: FadeAnimation(
                                              (100 * index),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12),
                                                child: CardDestacados(
                                                    des: des,
                                                    provider: provider,
                                                    index: index),
                                              ),
                                            ),
                                          );
                                        },
                                                    childCount: provider
                                                        .modelsubjectlover
                                                        .length))
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
                                      'Recommendations',
                                      style: GoogleFonts.abhayaLibre(
                                        textStyle:
                                            const TextStyle(fontSize: 20),
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
                                                SliverChildBuilderDelegate(
                                                    (context, index) {
                                          return GestureDetector(
                                            onTap: () async {
                                              setState(() {
                                                des = index;
                                              });
                                              final detailbook = await provider
                                                  .getSearchForApiGoogle(
                                                q: provider
                                                    .modelsubjectaction[index]
                                                    .title!,
                                              );
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) => Details(
                                                          description:
                                                              detailbook[
                                                                  "Description"],
                                                          urlImage: detailbook[
                                                              "MapImage"],
                                                          modelSearch: ModelSearch(
                                                              key: '',
                                                              title: provider
                                                                  .modelsubjectaction[
                                                                      index]
                                                                  .title!,
                                                              editioncount: 0,
                                                              firtspublicyear: 0,
                                                              numberofpagemediam: 0,
                                                              contributor: [],
                                                              author: [
                                                                provider
                                                                    .modelsubjectaction[
                                                                        index]
                                                                    .authors![0]
                                                                    .name
                                                              ],
                                                              time: [
                                                                ''
                                                              ]))));
                                            },
                                            child: FadeAnimation(
                                              (100 * index),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12),
                                                child: CardRecomendations(
                                                  des: des,
                                                  provider: provider,
                                                  index: index,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                                    childCount: provider
                                                        .modelsubjectaction
                                                        .length))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : Search())
          ],
        ),
      ),
    );
  }
}

class CardDestacados extends StatelessWidget {
  const CardDestacados(
      {Key? key,
      required this.des,
      required this.provider,
      required this.index})
      : super(key: key);
  final int index;
  final int des;
  final BookProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 160,
      decoration: BoxDecoration(
          color: des == index
              ? BookColor.orangered
              : BookColor.gray2.withOpacity(0.2),
          borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 170,
            width: 160,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: Image.asset(
                  provider.modelsubjectlover[index].img!,
                  fit: BoxFit.cover,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
            child: Text(
              provider.modelsubjectlover[index].title!,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.abhayaLibre(
                  textStyle: TextStyle(
                      color: des == index ? BookColor.gray1 : BookColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18)),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Text(
              provider.modelsubjectlover[index].authors![0].name!,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.abhayaLibre(
                  textStyle: TextStyle(
                      color: des == index ? BookColor.gray1 : BookColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18)),
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}

class CardRecomendations extends StatelessWidget {
  const CardRecomendations(
      {Key? key,
      required this.des,
      required this.provider,
      required this.index})
      : super(key: key);
  final int index;
  final int des;
  final BookProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 160,
      decoration: BoxDecoration(
          color: BookColor.orangered, borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 170,
            width: 160,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: Image.asset(
                  provider.modelsubjectaction[index].img!,
                  fit: BoxFit.cover,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
            child: Text(
              provider.modelsubjectaction[index].title!,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.abhayaLibre(
                  textStyle: TextStyle(
                      color: BookColor.gray1,
                      fontWeight: FontWeight.w700,
                      fontSize: 18)),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Text(
              provider.modelsubjectaction[index].authors![0].name!,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.abhayaLibre(
                  textStyle: TextStyle(
                      color: BookColor.gray1,
                      fontWeight: FontWeight.w700,
                      fontSize: 18)),
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
