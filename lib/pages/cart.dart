import 'package:flutter/material.dart';
//my imports
import 'package:my_app/components/cart_products.dart';

class cart extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);

  // @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.lightGreen[100],
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
      ),
      body: new cart_products(),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
              title: new Text("TOTAL: "),
              subtitle: new Text("\$230"),
            )),
            Expanded(
              child: new MaterialButton(
                onPressed: () {},
                child: new Text(
                  "Check out",
                  style: TextStyle(color: Colors.black),
                ),
                color: Colors.green[100],
              ),
            )
          ],
        ),
      ),
    );
  }
}
