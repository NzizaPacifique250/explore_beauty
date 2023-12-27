import 'package:flutter/material.dart';

class ECommerceHomePage extends StatefulWidget {
  @override
  _ECommerceHomePageState createState() => _ECommerceHomePageState();
}

class _ECommerceHomePageState extends State<ECommerceHomePage>
    with SingleTickerProviderStateMixin {
  bool _isSearching = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  List<Map<String, dynamic>> items = [
    {
      'image': 'assets/images/BBQ-CHICKEN-1.png',
      'name': 'BBQ-CHICKEN',
      'price': '10,000',
    },
    {
      'image': 'assets/images/bufallo-chicken.png',
      'name': 'Bufallo Chicken',
      'price': '10,000',
    },
    {
      'image': 'assets/images/goat-cheese.png',
      'name': 'Goat Chees',
      'price': '10,000',
    },
  ];

  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (_isSearching) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching ? null : Text('Pizza Delivery'),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: _toggleSearch,
          ),
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {
              // Implement filter functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: _isSearching ? 70 : 0,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for pizzas...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            // Slide view banners widget
            Container(
              height: 200,
              // Replace this with your banner/slider widget
              color: Colors.orange,
              child: Center(
                child: Text(
                  'Banner - Promotions and Offers',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Grid view of products (Pizza items)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> item = items[index];
                  String image = item['image'];
                  String name = item['name'];
                  String price = item['price'];

                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15),
                            ),
                            image: DecorationImage(
                              // Replace this with your pizza image
                              image: AssetImage(image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              price, // Replace with actual price
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {
                              // Implement favorite button functionality
                            },
                            color: Colors.red,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.chat_bubble_outline),
                            onPressed: () {
                              // Implement chat button functionality
                            },
                            color: Colors.red,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        // Implement navigation bar functionality
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          // Implement navigation item selection
        },
      ),
    );
  }
}
