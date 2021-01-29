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
      child: Stack(
        children: [
          Image.network(
            imageUrl,
            width: 120.0,
            height: 60.0,
            fit: BoxFit.cover,
          ),
          Container(
            child: Text(
              categoryName,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
