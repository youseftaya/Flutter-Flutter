import 'package:flutter/material.dart';
import 'beverages_screen.dart';
import 'search_screen.dart';
import 'cart_screen.dart';
import 'home_screen.dart';
import 'favourite_screen.dart';
import 'account_screen.dart';

class CategoryModel {
  final String title;
  final String imagePath;
  final Color backgroundColor;
  final Color borderColor;

  CategoryModel({
    required this.title,
    required this.imagePath,
    required this.backgroundColor,
    required this.borderColor,
  });
}

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  final List<CategoryModel> categories = [
    CategoryModel(
      title: 'Frash Fruits\n& Vegetable',
      imagePath: 'assets/image/pngfuel 6.png',
      backgroundColor: const Color(0xff53B175).withOpacity(0.1),
      borderColor: const Color(0xff53B175).withOpacity(0.7),
    ),
    CategoryModel(
      title: 'Cooking Oil/n& Ghee',
      imagePath: 'assets/image/Group 6835.png',
      backgroundColor: const Color(0xffF8A44C).withOpacity(0.1),
      borderColor: const Color(0xffF8A44C).withOpacity(0.7),
    ),
    CategoryModel(
      title: 'Meat & Fish',
      imagePath: 'assets/image/pngfuel 9.png',
      backgroundColor: const Color(0xffF7A593).withOpacity(0.25),
      borderColor: const Color(0xffF7A593),
    ),
    CategoryModel(
      title: 'Bakery & Snacks',
      imagePath: 'assets/image/pngfuel 6(1).png',
      backgroundColor: const Color(0xffD3B0E0).withOpacity(0.25),
      borderColor: const Color(0xffD3B0E0),
    ),
    CategoryModel(
      title: 'Dairy & Eggs',
      imagePath: 'assets/image/pngfuel.png',
      backgroundColor: const Color(0xffFDE598).withOpacity(0.25),
      borderColor: const Color(0xffFDE598),
    ),
    CategoryModel(
      title: 'Beverages',
      imagePath: 'assets/image/pngfuel 6(2).png',
      backgroundColor: const Color(0xffB7DFF5).withOpacity(0.25),
      borderColor: const Color(0xffB7DFF5),
    ),
    CategoryModel(
      title: 'Frash Fruits\n& Vegetable',
      imagePath: 'assets/image/pngfuel 6.png',
      backgroundColor: const Color(0xff53B175).withOpacity(0.1),
      borderColor: const Color(0xff53B175).withOpacity(0.7),
    ),
    CategoryModel(
      title: 'Cooking Oil/n& Ghee',
      imagePath: 'assets/image/Group 6835.png',
      backgroundColor: const Color(0xffF8A44C).withOpacity(0.1),
      borderColor: const Color(0xffF8A44C).withOpacity(0.7),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Find Products',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff181725),
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),

              // Search Bar
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF2F3F2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IgnorePointer(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Store',
                        hintStyle: const TextStyle(
                          color: Color(0xff7C7C7C),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/icons/Vector.png',
                            width: 18,
                            height: 18,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Grid
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: categories.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    return InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: () {
                        if (category.title == 'Beverages') {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BeveragesScreen(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: category.backgroundColor,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: category.borderColor,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(
                                category.imagePath,
                                fit: BoxFit.contain,
                              ),
                            ),

                            const SizedBox(height: 12),

                            Text(
                              category.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff181725),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // ================= Bottom Navigation Bar =================

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff53B175),
        unselectedItemColor: const Color(0xff181725),

        onTap: (index) {
          // Shop
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          }

          // Explore
          if (index == 1) {
            return;
          }

          // Cart
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyCartScreen(),
              ),
            );
          }

          // Favourite
          if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FavouriteScreen(),
              ),
            );
          }

          // Account
          if (index == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AccountScreen(),
              ),
            );
          }
        },

        showSelectedLabels: true,
        showUnselectedLabels: true,

        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/store 1.png',
              width: 24,
              height: 24,
            ),
            label: 'Shop',
          ),

          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/Group 3.png',
              width: 24,
              height: 24,
            ),
            label: 'Explore',
          ),

          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/Vector(2).png',
              width: 24,
              height: 24,
            ),
            label: 'Cart',
          ),

          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/bookmark 1(1).png',
              width: 24,
              height: 24,
            ),
            label: 'Favorite',
          ),

          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/Vector(3).png',
              width: 24,
              height: 24,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}