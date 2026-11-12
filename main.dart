import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomePage(),
));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Online Shopping"),
          backgroundColor: Colors.blue),
      body: Column(children: [
        SizedBox(height: 20),
        Text("Available Products",
            style: TextStyle(fontSize: 25)),
        SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            product(context, "Headphones", "Rs.999",
              "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=200"),
            product(context, "Watch", "Rs.1499",
              "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=200"),
          ]),
      ]),
    );
  }
}

Widget product(BuildContext context, String name,
    String price, String image) {
  return Column(children: [
    Image.network(image, width: 100, height: 100),
    Text(name),
    Text(price),
    ElevatedButton(
      onPressed: () => Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
          DetailsPage(name: name, price: price, image: image))),
      child: Text("View"),
    ),
  ]);
}

class DetailsPage extends StatelessWidget {
  final String name, price, image;
  DetailsPage({required this.name, required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(image, width: 200, height: 200),
          SizedBox(height: 20),
          Text(name, style: TextStyle(fontSize: 25)),
          SizedBox(height: 10),
          Text(price, style: TextStyle(fontSize: 20,
              color: Colors.green)),
          SizedBox(height: 20),
          Text("Good quality product"),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(
                content: Text("Added to cart"))),
            child: Text("Add to Cart")),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Back")),
        ],
      )),
    );
  }
}
