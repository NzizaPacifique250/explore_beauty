import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ECommerceHomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/productDetails': (BuildContext context) => ProductDetailsPage(),
        '/cart': (BuildContext context) => CartPage(),
      },
    );
  }
}

class ECommerceHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizza Delivery'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Navigate to search screen
              // You can implement the search screen here
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/productDetails',
                arguments: index, // Passing the index as an argument
              );
            },
            child: Hero(
              tag: 'pizza$index',
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          image: DecorationImage(
                            // Replace this with your pizza image
                            image: AssetImage('assets/pizza_$index.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pizza Name $index',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {
                              // Implement favorite button functionality
                              // Example: Toggle favorite status for this item
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pizza Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'pizza$index',
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  // Replace this with your pizza image
                  image: AssetImage('assets/pizza_$index.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pizza Name $index',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Description: This is the description for Pizza $index. Add more details here.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add item to cart functionality
          // Example: You can add this item to the cart
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Added to cart!')),
          );
        },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('Your cart items will be displayed here.'),
      ),
    );
  }
}
