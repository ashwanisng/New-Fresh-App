import 'package:flutter/material.dart';
import 'package:news_fresh/hepler/data.dart';
import 'package:news_fresh/models/articel_model.dart';
import 'package:news_fresh/models/category_model.dart';
import 'package:news_fresh/utilities/constant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> catrgories = List();
  List<ArticelModel> articels = List();
  @override
  void initState() {
    super.initState();

    catrgories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Container(
              height: 70.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: catrgories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    categoryName: catrgories[index].categoryName,
                    imageUrl: catrgories[index].imageUrl,
                  );
                },
              ),
            ),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BlogTile();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  CategoryTile({this.categoryName, this.imageUrl});
  final imageUrl;
  final categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Image.network(
              imageUrl,
              width: 120.0,
              height: 60.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Text(
              categoryName,
              style: kTextCategoryName,
            ),
          )
        ],
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  BlogTile({this.title, this.newsImage, this.descreption});
  final title;
  final newsImage;
  final descreption;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(newsImage),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'fonts/Livvic-Regular',
              fontSize: 20.0,
            ),
          ),
          Text(
            descreption,
            style: TextStyle(
              fontFamily: 'fonts/Livvic-Light',
              fontSize: 16.0,
            ),
          )
        ],
      ),
    );
  }
}
