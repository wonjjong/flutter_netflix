import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix/model/model_movie.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;
  CarouselImage({required this.movies});
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  late List<Movie> movies;
  late List<Widget> images;
  late List<String> keywords;
  late List<bool> likes;
  int _currentPage = 0;
  late String _currentKeyword;

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies.map((e) => Image.asset('./images/${e.poster}')).toList();
    keywords = movies.map((e) => e.keyword).toList();
    likes = movies.map((e) => e.like).toList();
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(padding: EdgeInsets.all(20)),
        CarouselSlider(
          items: images,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
                _currentKeyword = keywords[index];
              });
            },
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
          child: Text(_currentKeyword, style: TextStyle(fontSize: 11)),
        ),
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                likes[_currentPage]
                    ? IconButton(icon: Icon(Icons.check), onPressed: () {})
                    : IconButton(icon: Icon(Icons.add), onPressed: () {}),
                Text('내가 찜한 콘텐츠', style: TextStyle(fontSize: 11)),
              ],
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    Colors.white,
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Icon(Icons.play_arrow, color: Colors.black),
                    Padding(padding: EdgeInsets.all(3)),
                    Text('재생', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
