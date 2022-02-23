// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: Homepage(),
//   ));
// }

// class Homepage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<Homepage> {
//   @override
//   Widget build(BuildContext context) {
//     final List<String> imagesList = [
//       'https://cdn.pixabay.com/photo/2017/12/10/14/47/piza-3010062_1280.jpg',
//       'https://cdn.pixabay.com/photo/2016/06/07/01/49/ice-cream-1440830_1280.jpg',
//       'https://cdn.pixabay.com/photo/2017/12/27/07/07/brownie-3042106_1280.jpg',
//       'https://cdn.pixabay.com/photo/2018/02/25/07/15/food-3179853_1280.jpg',
//       'https://cdn.pixabay.com/photo/2015/10/26/11/10/honey-1006972_1280.jpg',
//     ];

//     @override
//     Widget build(BuildContext context) {
//       Widget carouselSlider = CarouselSlider(
//         options: CarouselOptions(
//           autoPlay: true,
//           height: 300.0,
//           enlargeCenterPage: true,
//           aspectRatio: 1 / 10,
//           autoPlayCurve: Curves.fastOutSlowIn,
//           enableInfiniteScroll: true,
//           autoPlayAnimationDuration: Duration(milliseconds: 800),
//           viewportFraction: 0.8,
//         ),
//         items: imagesList
//             .map(
//               (item) => Center(
//                 child: Image.network(
//                   item,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             )
//             .toList(),
//       );
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Carousel View',
//             style: TextStyle(color: Colors.black),
//           ),
//         ),
//         body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[carouselSlider]),
//       );
//     }

//     Scaffold newMethod() {
//       var carouselSlider = CarouselSlider;
//       return Scaffold(
//         appBar: new AppBar(
//           elevation: 0.1,
//           backgroundColor: Colors.lightGreen[100],
//           title: Text(
//             'FoodApp',
//             style: TextStyle(color: Colors.black),
//           ),
//           actions: <Widget>[
//             new IconButton(
//                 icon: Icon(
//                   Icons.search,
//                   color: Colors.black,
//                 ),
//                 onPressed: () {}),
//             new IconButton(
//                 icon: Icon(
//                   Icons.shopping_cart,
//                   color: Colors.black,
//                 ),
//                 onPressed: () {})
//           ],
//         ),
//         drawer: new Drawer(
//           child: new ListView(
//             children: <Widget>[
//               //header
//               new UserAccountsDrawerHeader(
//                 accountName: Text(
//                   'Priyanshi vastani',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 accountEmail: Text(
//                   'priyanshi.megaminds@gmail.com',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 currentAccountPicture: GestureDetector(
//                   child: new CircleAvatar(
//                       backgroundColor: Colors.grey,
//                       child: Icon(
//                         Icons.person,
//                         color: Colors.black,
//                       )),
//                 ),
//                 decoration: new BoxDecoration(color: Colors.lightGreen[100]),
//               ),

//               // body

//               InkWell(
//                 onTap: () {},
//                 child: ListTile(
//                   title: Text('Home page'),
//                   leading: Icon(Icons.home),
//                 ),
//               ),

//               InkWell(
//                 onTap: () {},
//                 child: ListTile(
//                   title: Text('My account'),
//                   leading: Icon(Icons.shopping_basket),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: ListTile(
//                   title: Text('payments & refund'),
//                   leading: Icon(Icons.payment),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: ListTile(
//                   title: Text('manage addresss'),
//                   leading: Icon(Icons.home),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: ListTile(
//                   title: Text('favourite'),
//                   leading: Icon(Icons.favorite),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: ListTile(
//                   title: Text('Catagories'),
//                   leading: Icon(Icons.dashboard),
//                 ),
//               ),
//               Divider(),

//               InkWell(
//                 onTap: () {},
//                 child: ListTile(
//                   title: Text('Settings'),
//                   leading: Icon(
//                     Icons.settings,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: ListTile(
//                   title: Text('About'),
//                   leading: Icon(Icons.help, color: Colors.green),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         body: new ListView(
//           children: <Widget>[
//             newMethod(),
//             new Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: new Text('catagories'),
//             )
//           ],
//         ),
//       );
//     }
//   }

//   Type newMethod(Type carouselSlider) => carouselSlider;
// }
