import 'package:flutter/material.dart';
import 'explore_screen.dart';
import 'home_screen.dart';
import 'cart_screen.dart';
import 'account_screen.dart';

class FavouriteItem {
  final String name;
  final String subtitle;
  final String price;
  final String imagePath;

  FavouriteItem({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.imagePath,
  });
}

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  int _selectedIndex = 3;

  final List<FavouriteItem> favoriteItems = [
    FavouriteItem(
      name: 'Sprite Can',
      subtitle: '325ml, Price',
      price: '\$1.50',
      imagePath: 'assets/image/pngfuel 12.png',
    ),
    FavouriteItem(
      name: 'Diet Coke',
      subtitle: '355ml, Price',
      price: '\$1.99',
      imagePath: 'assets/image/pngfuel 11.png',
    ),
    FavouriteItem(
      name: 'Apple & Grape Juice',
      subtitle: '2L, Price',
      price: '\$15.50',
      imagePath:
          'assets/image/tree-top-juice-apple-grape-64oz 1.png',
    ),
    FavouriteItem(
      name: 'Coca Cola Can',
      subtitle: '325ml, Price',
      price: '\$4.99',
      imagePath: 'assets/image/pngfuel 13.png',
    ),
    FavouriteItem(
      name: 'Pepsi Can',
      subtitle: '330ml, Price',
      price: '\$4.99',
      imagePath: 'assets/image/pngfuel 14.png',
    ),
    FavouriteItem(
      name: 'Oreng Juice',
      subtitle: '2L,price',
      price: '\$15.99',
      imagePath:
          'assets/image/tree-top-juice-apple-grape-64oz 1(1).png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Favourite',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFE2E2E2),
          ),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: favoriteItems.length,
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xFFE2E2E2),
                );
              },
              itemBuilder: (context, index) {
                final item = favoriteItems[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        item.imagePath,
                        width: 45,
                        height: 55,
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(width: 20),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              item.subtitle,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Text(
                        item.price,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(width: 10),

                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF53B175),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Add All To Cart',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,

        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          }

          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ExploreScreen(),
              ),
            );
          }

          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyCartScreen(),
              ),
            );
          }

          if (index == 3) {
            setState(() {
              _selectedIndex = 3;
            });
          }

          if (index == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AccountScreen(),
              ),
            );
          }
        },

        type: BottomNavigationBarType.fixed,

        selectedItemColor: const Color(0xFF53B175),
        unselectedItemColor: Colors.black,

        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),

        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
        ),

        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/store 1.png',
              width: 22,
              height: 22,
            ),
            label: 'Shop',
          ),

          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/Group 3.png',
              width: 22,
              height: 22,
            ),
            label: 'Explore',
          ),

          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/Vector(2).png',
              width: 22,
              height: 22,
            ),
            label: 'Cart',
          ),

          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/bookmark 1(1).png',
              width: 22,
              height: 22,
              color: const Color(0xFF53B175),
            ),
            label: 'Favourite',
          ),

          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/Vector(3).png',
              width: 22,
              height: 22,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}