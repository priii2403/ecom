import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'package:my_app/pages/home.dart';


class ProductDetails extends StatefulWidget {
  final Product_details_name;
  final Product_details_newprice;
  final Product_details_oldprice;
  final Product_details_picture;

  ProductDetails(
      {this.Product_details_name,
      this.Product_details_newprice,
      this.Product_details_oldprice,
      this.Product_details_picture});
  // const ({ Key? key }) : super(key: key);

  // @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.lightGreen[100],
        title: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new Homepage()));
          },
          child: Text(
            'FoodApp',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {}),
          // new IconButton(
          //     icon: Icon(
          //       Icons.shopping_cart,
          //       color: Colors.black,
          //     ),
          //     onPressed: () {})
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white70,
                child: Image.asset(widget.Product_details_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.Product_details_name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: [
                      Expanded(
                          child: new Text(
                        "\$${widget.Product_details_oldprice}",
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      )),
                      Expanded(
                          child: new Text(
                        "\$${widget.Product_details_newprice}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),

          //====================the frist button========================
          Row(
            children: <Widget>[
              //===============the size button=====================

              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("items"),
                            content: new Text("choose the items"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Items")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              //===============the size button=====================

              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Variation"),
                            content: new Text("choose the size"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Variation")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //====================the secound button========================
          Row(
            children: <Widget>[
              //===============the size button=====================

              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.green[100],
                    textColor: Colors.black,
                    elevation: 0.2,
                    child: new Text("Buy now")),
              ),

              new IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                  onPressed: () {}),
              new IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.black,
                  onPressed: () {}),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Product Details"),
            subtitle: new Text(
                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "),
          ),
          Divider(),
          new Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product_Name:- ",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.Product_details_name),
              )
            ],
          ),

          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Similar_products"),
          ),

          //Similar products sections
          Container(
            height: 340.0,
            child: Similar_products(),
          )
        ],
      ),
    );
  }
}

class Similar_products extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);

  // @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  // @override
  // Widget build(BuildContext context) {
  // return Container(
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
        itemBuilder: (BuildContext comtext, int index) {
          return Similar_single_products(
            product_name: product_list[index]['name'],
            product_picture: product_list[index]['picture'],
            product_oldprice: product_list[index]['old_price'],
            prodct_price: product_list[index]['price'],
          );
        });
  }
}

class Similar_single_products extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_oldprice;
  final prodct_price;
  Similar_single_products(
      {this.product_name,
      this.prodct_price,
      this.product_oldprice,
      this.product_picture});

  get image => null;

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
                          Product_details_newprice: prodct_price,
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                            ),
                            new Text(
                              "\$${prodct_price}",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                    child: Image.asset(
                      product_picture,
                      width: 250.0,
//             height: 250.0,
                      fit: BoxFit.cover,
                    )),
              ),
            )));
  }
}
