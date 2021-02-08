import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

typedef SwipeCallback = void Function(Map<String, dynamic>);

class CardBatch extends StatefulWidget {
  final List<Map<String, dynamic>> books;
  final SwipeCallback onSwipeRight;
  final SwipeCallback onSwipeLeft;
  final CardController controller;

  const CardBatch(
      {Key key,
      @required this.books,
      this.onSwipeRight,
      this.onSwipeLeft,
      this.controller})
      : super(key: key);
  @override
  _CardBatchState createState() => _CardBatchState(
        books: books,
        onSwipeRight: onSwipeRight,
        onSwipeLeft: onSwipeLeft,
        controller: controller,
      );
}

class _CardBatchState extends State<CardBatch> {
  final List<Map<String, dynamic>> books;
  final SwipeCallback onSwipeRight;
  final SwipeCallback onSwipeLeft;

  final CardController controller;

  _CardBatchState(
      {@required this.books,
      this.onSwipeRight,
      this.onSwipeLeft,
      this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
      child: TinderSwapCard(
        swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
          if (orientation == CardSwipeOrientation.RIGHT)
            onSwipeRight?.call(books[index]);
          if (orientation == CardSwipeOrientation.LEFT)
            onSwipeLeft?.call(books[index]);
        },
        animDuration: 150,
        cardBuilder: (context, index) => buildCard(
          imageUrl: this.books[index]['imageUrl'],
          authorName: this.books[index]['author'],
          bookName: this.books[index]['name'],
        ),
        totalNum: books.length,
        cardController: controller,
        stackNum: 2,
        maxWidth: 312,
        maxHeight: 464,
        minWidth: 280,
        minHeight: 432,
        orientation: AmassOrientation.BOTTOM,
        allowVerticalMovement: false,
      ),
    );
  }

  Card buildCard({String imageUrl, String authorName, String bookName}) {
    return Card(
      elevation: 2,
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 1,
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Container(
                width: double.infinity,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookName,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      authorName,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF707070)),
                    ),
                  ],
                )),
          )
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}