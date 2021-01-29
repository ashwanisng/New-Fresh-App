import 'package:flutter/material.dart';
import 'package:news_fresh/hepler/blog_tile.dart';
import 'package:news_fresh/hepler/category_news.dart';
import 'package:news_fresh/models/articel_model.dart';

class CategoryView extends StatefulWidget {
  final String category;
  CategoryView({this.category});
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ArticelModel> articels = List();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNewsData();
  }

  Future<void> getNewsData() async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getCategorysNews(widget.category);
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
                    Container(
                      child: Container(
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
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
