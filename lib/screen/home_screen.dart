import 'package:flutter/material.dart';
import 'product_details_screen.dart';
import 'explore_screen.dart';
import 'search_screen.dart';
import 'cart_screen.dart';
import 'favourite_screen.dart';
import 'account_screen.dart';

import '../widgets/section_header.dart';
import '../widgets/product_card.dart';
import '../widgets/category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/image/Group.png"),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/Exclude.png"),
                  const SizedBox(width: 5),
                  const Text(
                    'Dhaka, Banassre',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4C4F4D),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xffF2F3F2),
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/icons/Vector.png"),
                      const SizedBox(width: 10),
                      const Text(
                        "Search Store",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff7C7C7C),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Image.asset("assets/image/banner.png"),

              const SizedBox(height: 20),

              const SectionHeader(title: "Exclusive Offer"),

              const SizedBox(height: 15),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 175,
                      child: ProductCard(
                        imagePath: "assets/image/banas.png",
                        title: "Organic Bananas",
                        subtitle: "7pcs, Price",
                        price: "\$4.99",
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 175,
                      child: ProductCard(
                        imagePath: "assets/image/pngfuel 1.png",
                        title: "Red Apple",
                        subtitle: "1kg, Price",
                        price: "\$4.99",
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 175,
                      child: ProductCard(
                        imagePath: "assets/image/banas.png",
                        title: "Organic Bananas",
                        subtitle: "7pcs, Price",
                        price: "\$4.99",
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 175,
                      child: ProductCard(
                        imagePath: "assets/image/pngfuel 1.png",
                        title: "Red Apple",
                        subtitle: "1kg, Price",
                        price: "\$4.99",
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const SectionHeader(title: "Best Selling"),

              const SizedBox(height: 15),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 175,
                      child: ProductCard(
                        imagePath: "assets/image/p 1.png",
                        title: "Bell Pepper Red",
                        subtitle: "1kg, Price",
                        price: "\$4.99",
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 175,
                      child: ProductCard(
                        imagePath: "assets/image/p 2.png",
                        title: "Ginger",
                        subtitle: "250gm, Price",
                        price: "\$4.99",
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 175,
                      child: ProductCard(
                        imagePath: "assets/image/p 1.png",
                        title: "Bell Pepper Red",
                        subtitle: "1kg, Price",
                        price: "\$4.99",
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 175,
                      child: ProductCard(
                        imagePath: "assets/image/p 2.png",
                        title: "Ginger",
                        subtitle: "250gm, Price",
                        price: "\$4.99",
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const SectionHeader(title: "Groceries"),

              const SizedBox(height: 15),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryCard(
                      title: "Pulses",
                      imagePath: "assets/image/p 4.png",
                      color: const Color(0xffF8A44C),
                    ),
                    const SizedBox(width: 15),
                    CategoryCard(
                      title: "Rice",
                      imagePath: "assets/image/p 5.png",
                      color: const Color(0xff53B175),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 175,
                      child: ProductCard(
                        imagePath: "assets/image/pngfuel 4.png",
                        title: "Beef Bone",
                        subtitle: "1kg, Price",
                        price: "\$4.99",
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 175,
                      child: ProductCard(
                        imagePath: "assets/image/pngfuel 5.png",
                        title: "Broiler Chicken",
                        subtitle: "1kg, Price",
                        price: "\$4.99",
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 175,
                      child: ProductCard(
                        imagePath: "assets/image/pngfuel 4.png",
                        title: "Beef Bone",
                        subtitle: "1kg, Price",
                        price: "\$4.99",
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 175,
                      child: ProductCard(
                        imagePath: "assets/image/pngfuel 5.png",
                        title: "Broiler Chicken",
                        subtitle: "1kg, Price",
                        price: "\$4.99",
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: const Color(0xff53B175),
        unselectedItemColor: const Color(0xff181725),

        onTap: (index) {
          if (index == 0) {
            return;
          }

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExploreScreen(),
              ),
            );
          }

          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyCartScreen(),
              ),
            );
          }

          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavouriteScreen(),
              ),
            );
          }

          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AccountScreen(),
              ),
            );
          }
        },

        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/store 1.png",
              width: 24,
              height: 24,
            ),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/Group 3.png",
              width: 24,
              height: 24,
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/Vector(2).png",
              width: 24,
              height: 24,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/bookmark 1.png",
              width: 24,
              height: 24,
            ),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/Vector(3).png",
              width: 24,
              height: 24,
            ),
            label: "Account",
          ),
        ],
      ),
    );
  }
}