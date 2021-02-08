import 'package:bookburn/components/card_batch.dart';
import 'package:bookburn/pages/scan_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class BookMatchingPage extends StatefulWidget {
  static String routeName = '/matching';
  @override
  _BookMatchingPageState createState() => _BookMatchingPageState();
}

class _BookMatchingPageState extends State<BookMatchingPage> {
  CardController _controller;
  List<Map<String, String>> _books;

  @override
  void initState() {
    super.initState();
    _controller = CardController();
    _books = [
      {
        'imageUrl':
            'https://media.tenor.com/images/9770d9c99bf00ae01a35cc7ff12fe060/tenor.gif',
        'author': 'Чел,',
        'name': 'Ты...'
      },
      {
        'imageUrl':
            'https://media.tenor.com/images/d139e96072bae377be522258f7128881/tenor.gif',
        'author': 'А может быть',
        'name': 'Ты?'
      },
      {
        'imageUrl': 'https://data.whicdn.com/images/175265932/original.gif',
        'author': 'Нет',
        'name': 'Ты'
      },
      {
        'imageUrl':
            'https://media1.tenor.com/images/788831460d1d5f9aad96c44d5918189f/tenor.gif',
        'author': 'А может быть',
        'name': 'Ты?'
      },
      {
        'imageUrl':
            'https://i.pinimg.com/originals/01/42/47/0142477965b08cfdcf1994ea7ebc7330.gif',
        'author': 'Нет',
        'name': 'Ты'
      },
      {
        'imageUrl':
            'https://i.pinimg.com/originals/01/42/47/0142477965b08cfdcf1994ea7ebc7330.gif',
        'author': 'Да да',
        'name': 'Я'
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          brightness: Brightness.light,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, ScanPage.routeName),
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Container(
                      width: 224,
                      height: 56,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFF2F2F2)),
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/book.svg"),
                            Spacer(),
                            Text(
                              "Добавить книгу",
                              style: TextStyle(
                                fontFamily: 'Anonymous Pro',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: Color(0xFF595959),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFF2F2F2)),
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset("assets/icons/bookshelf.svg"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CardBatch(
              books: _books,
              controller: _controller,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => _controller.triggerLeft(),
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Container(
                      width: 126,
                      height: 56,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFF2F2F2)),
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/fire.svg"),
                            Spacer(),
                            Text(
                              "Сжечь",
                              style: TextStyle(
                                fontFamily: 'Anonymous Pro',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: Color(0xFFF35C3A),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => _controller.triggerRight(),
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Container(
                      width: 170,
                      height: 56,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFF2F2F2)),
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        child: Row(
                          children: [
                            Spacer(),
                            Text(
                              "Сохранить",
                              style: TextStyle(
                                fontFamily: 'Anonymous Pro',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: Color(0xFF4FD484),
                              ),
                            ),
                            Spacer(),
                            SvgPicture.asset(
                                "assets/icons/bookmark_border.svg"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
