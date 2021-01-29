import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_fresh/hepler/data.dart';
import 'package:news_fresh/hepler/news.dart';
import 'package:news_fresh/models/articel_model.dart';
import 'package:news_fresh/models/category_model.dart';
import 'package:news_fresh/utilities/constant.dart';

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
            child: CachedNetworkImage(
              imageUrl: imageUrl,
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
  BlogTile(
      {@required this.title,
      @required this.newsImage,
      @required this.descreption});
  final title;
  final newsImage;
  final descreption;
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
