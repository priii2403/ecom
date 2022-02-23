import 'package:flutter/material.dart';
import 'package:my_app/components/Horizontellistview.dart';
import 'package:my_app/components/products.dart';
import 'package:my_app/pages/cart.dart';

class Homepage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.lightGreen[100],
        title: Text(
          'FoodApp',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new cart()));
              })
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //header
            new UserAccountsDrawerHeader(
              accountName: Text(
                'Priyanshi vastani',
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text(
                'priyanshi.megaminds@gmail.com',
                style: TextStyle(color: Colors.black),
              ),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                    )),
              ),
              decoration: new BoxDecoration(color: Colors.lightGreen[100]),
            ),

            // body

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home page'),
                leading: Icon(Icons.home),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My account'),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.grey,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('payments & refund'),
                leading: Icon(
                  Icons.payment,
                  color: Colors.grey,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('manage addresss'),
                leading: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('favourite'),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.grey,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new cart()));
              },
              child: ListTile(
                title: Text('shopping cart'),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.grey,
                ),
              ),
            ),
            Divider(),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text('Catagories'),
          ),
          Horizontallist(),
          new Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Text('Recent products'),
          ),
          //grid view
          Container(
            height: 500.0,
            child: products(),
          )
        ],
      ),
    );
  }
}
