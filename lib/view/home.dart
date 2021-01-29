import 'package:flutter/material.dart';
import 'package:news_fresh/hepler/blog_tile.dart';
import 'package:news_fresh/hepler/category_tile.dart';
import 'package:news_fresh/hepler/data.dart';
import 'package:news_fresh/hepler/news.dart';
import 'package:news_fresh/models/articel_model.dart';
import 'package:news_fresh/models/category_model.dart';

bool _loading = true;

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
    getNewsData();
  }

  Future<void> getNewsData() async {
    News newsClass = News();
    await newsClass.getNews();
    articels = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              "Fresh",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    // Category Tile
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
                    // BlogTile
                    Container(
                      padding: EdgeInsets.only(top: 16.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: articels.length,
                        itemBuilder: (context, index) {
                          return BlogTile(
                            title: articels[index].title,
                            newsImage: articels[index].urlToImage,
                            descreption: articels[index].description,
                            url: articels[index].url,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
