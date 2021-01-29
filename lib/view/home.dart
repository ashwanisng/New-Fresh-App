import 'package:flutter/material.dart';
import 'package:news_fresh/hepler/data.dart';
import 'package:news_fresh/models/category_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> catrgories = List();
  @override
  void initState() {
    super.initState();

    catrgories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          )
        ],
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
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Livvic-Regular'),
            ),
          )
        ],
      ),
    );
  }
}
