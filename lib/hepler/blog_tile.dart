import 'package:flutter/material.dart';
import 'package:news_fresh/view/articel_view.dart';

class BlogTile extends StatelessWidget {
  BlogTile(
      {@required this.title,
      @required this.newsImage,
      @required this.descreption,
      @required this.url});
  final title;
  final newsImage;
  final descreption;
  final url;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ArticelView(
                urlImage: url,
              );
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            ClipRRect(
              child: Image.network(newsImage),
              borderRadius: BorderRadius.circular(6.0),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontFamily: 'Livvic',
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              descreption,
              style: TextStyle(
                color: Colors.white70,
                fontFamily: 'Livvic',
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
