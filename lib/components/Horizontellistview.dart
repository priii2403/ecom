import 'package:flutter/material.dart';

class Horizontallist extends StatelessWidget {
  // const Horizontallist({ Key? key }) : super(key: key);

  // @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'assets/images/products/mcd.JPG',
            image_caption: 'mcd',
          ),
          Category(
            image_location: 'assets/images/products/lapinoz.JPG',
            image_caption: 'lapinoz',
          ),
          Category(
            image_location: 'assets/images/products/starbucks.JPG',
            image_caption: 'Starbucks',
          ),
          Category(
            image_location: 'assets/images/products/gangour.JPG',
            image_caption: 'gangor',
          ),
          Category(
            image_location: 'assets/images/products/99 pancake.JPG',
            image_caption: '99 pancake',
          ),
          Category(
            image_location: 'assets/images/products/trishiv chiness.JPG',
            image_caption: 'trishiv chinese',
          ),
          Category(
            image_location: 'assets/images/products/sweet truth cake.JPG',
            image_caption: 'sweet truth cake',
          ),
          Category(
            image_location: 'assets/images/products/baskin robbins.JPG',
            image_caption: 'baskin robbins',
          ),
          Category(
            image_location: 'assets/images/products/kfc_logo.png',
            image_caption: 'KFC',
          ),
          Category(
            image_location: 'assets/images/products/the good bowl.JPG',
            image_caption: 'THE GOOD BOWL',
          ),
          Category(
            image_location: 'assets/images/products/behrus biryani.JPG',
            image_caption: 'BEHRUS BIRYANI',
          ),
          Category(
            image_location: 'assets/images/products/kailash.JPG',
            image_caption: 'kailash sweet',
          ),
          Category(
            image_location: 'assets/images/products/belgium waffels.JPG',
            image_caption: 'Belgium waffels',
          ),
          Category(
            image_location: 'assets/images/products/fassos.JPG',
            image_caption: 'fassos',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_caption, this.image_location});
  // const Category({ Key? key }) : super(key: key);

  // @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 50.0,
          child: ListTile(
              title: Image.asset(
                image_location,
                // image_location,
                width: 40.0,
                height: 40.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  image_caption,
                  style: new TextStyle(fontSize: 12.0),
                ),
              )),
        ),
      ),
    );
  }
}
