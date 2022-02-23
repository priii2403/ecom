import 'package:flutter/material.dart';

class cart_products extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);

  // @override
  _cart_productsState createState() => _cart_productsState();
}

class _cart_productsState extends State<cart_products> {
  var Product_on_the_cart = [
    {
      "name": "Gourmet burger",
      "picture": "assets/images/cat/gorment burger.JPG",
      "price": 200,
      "item": 1,
      "variation": "l"
    },
    {
      "name": "CAKE",
      "picture": "assets/images/cat/Cake1.JPG",
      "item": 1,
      "variation": "m",
      "price": 999
    },
    {
      "name": "DESERT",
      "picture": "assets/images/cat/desert.JPG",
      "item": 1,
      "variation": "l",
      "price": 250
    },
    {
      "name": "Ice-cream",
      "picture": "assets/images/cat/ice-cream.JPG",
      "item": 1,
      "variation": "m",
      "price": 85
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Product_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_product_name: Product_on_the_cart[index]["name"],
            cart_product_price: Product_on_the_cart[index]["price"],
            cart_product_picture: Product_on_the_cart[index]["picture"],
            cart_product_item: Product_on_the_cart[index]["item"],
            cart_product_variation: Product_on_the_cart[index]["variation"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_product_name;
  final cart_product_picture;
  final cart_product_price;
  final cart_product_item;
  final cart_product_variation;
  Single_cart_product(
      {this.cart_product_name,
      this.cart_product_price,
      this.cart_product_picture,
      this.cart_product_item,
      this.cart_product_variation});

  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: new Image.asset(cart_product_picture),
        title: new Text(cart_product_name),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text("VARIATION:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_product_variation,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$${cart_product_price}",
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )
          ],
        ),
        trailing: new Column(
          children: [
            new IconButton(onPressed: () {}, icon: Icon(Icons.arrow_drop_down)),
            new IconButton(onPressed: () {}, icon: Icon(Icons.arrow_drop_up))
          ],
        ),
      ),
    );
  }
}
