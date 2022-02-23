import 'package:flutter/material.dart';

import 'package:my_app/pages/product_details.dart';

class products extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);

  // @override
  _productsState createState() => _productsState();
}

class _productsState extends State<products> {
  var product_list = [
    {
      "name": "Pure Veg",
      "picture": "assets/images/cat/pure veg.JPG",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Rolls and Sandwich",
      "picture": "assets/images/cat/rolls and sandwiches.JPG",
      "old_price": 199,
      "price": 150,
    },
    {
      "name": "Ice cream Shakes",
      "picture": "assets/images/cat/ice cream shakes.JPG",
      "old_price": 120,
      "price": 199,
    },
    {
      "name": "Kababas",
      "picture": "assets/images/cat/kababas.JPG",
      "old_price": 299,
      "price": 250,
    },
    {
      "name": "South indians",
      "picture": "assets/images/cat/south indian.JPG",
      "old_price": 450,
      "price": 399,
    },
    {
      "name": "Tea and Braverages",
      "picture": "assets/images/cat/tea AND Braverages.JPG",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Veg Biryani",
      "picture": "assets/images/cat/veg biryani.JPG",
      "old_price": 199,
      "price": 120,
    },
    {
      "name": "North Indians",
      "picture": "assets/images/cat/north indians.JPG",
      "old_price": 550,
      "price": 499,
    },
    {
      "name": "BURGER",
      "picture": "assets/images/cat/burger.JPG",
      "old_price": 150,
      "price": 120,
    },
    {
      "name": "COFFE",
      "picture": "assets/images/cat/st.JPG",
      "old_price": 1200,
      "price": 850,
    },
    {
      "name": "Gourmet burger",
      "picture": "assets/images/cat/gorment burger.JPG",
      "old_price": 250,
      "price": 200,
    },
    {
      "name": "CAKE",
      "picture": "assets/images/cat/Cake1.JPG",
      "old_price": 1000,
      "price": 999,
    },
    {
      "name": "DESERT",
      "picture": "assets/images/cat/desert.JPG",
      "old_price": 300,
      "price": 250,
    },
    {
      "name": "Ice-cream",
      "picture": "assets/images/cat/ice-cream.JPG",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Fries",
      "picture": "assets/images/cat/fries.JPG",
      "old_price": 70,
      "price": 50,
    },
    {
      "name": "Fry chicken",
      "picture": "assets/images/cat/fry chicken.JPG",
      "old_price": 550,
      "price": 499,
    },
    {
      "name": "Indians snackes",
      "picture": "assets/images/cat/indian snacks.JPG",
      "old_price": 400,
      "price": 350,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: single_products(
              product_name: product_list[index]['name'],
              product_picture: product_list[index]['picture'],
              product_oldprice: product_list[index]['old_price'],
              product_price: product_list[index]['price'],
            ),
          );
        });
  }
}

class single_products extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_oldprice;
  final product_price;
  single_products(
      {this.product_name,
      this.product_price,
      this.product_oldprice,
      this.product_picture});

  // const single_products({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Hero(
      tag: product_name,
      child: Material(
          child: InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
            //here we are passing value product to product details
            builder: (context) => new ProductDetails(
                  Product_details_name: product_name,
                  Product_details_newprice: product_price,
                  Product_details_oldprice: product_oldprice,
                  Product_details_picture: product_picture,
                ))),
        child: GridTile(
            footer: Container(
                color: Colors.white,
                child: new Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        product_name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    ),
                    new Text(
                      "\$${product_price}",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    )
                  ],
                )),
            child: Image.asset(
              product_picture, width: 282.0,
//             height: 282.0,
              fit: BoxFit.cover,
            )),
      )),
    ));
  }
}
