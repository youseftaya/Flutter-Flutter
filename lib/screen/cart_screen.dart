import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'explore_screen.dart';
import 'favourite_screen.dart';
import 'checkout_screen.dart';
import 'order_accepted_screen.dart';
import 'error_screen.dart';
import 'account_screen.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  int _selectedIndex = 2;

  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Bell Pepper Red',
      'weight': '1kg, Price',
      'price': 4.99,
      'quantity': 1,
      'image': 'assets/image/p 1.png',
    },
    {
      'name': 'Egg Chicken Red',
      'weight': '4pcs, Price',
      'price': 1.99,
      'quantity': 1,
      'image': 'assets/image/pngfuel 16.png',
    },
    {
      'name': 'Organic Bananas',
      'weight': '12kg, Price',
      'price': 3.00,
      'quantity': 1,
      'image': 'assets/image/banas.png',
    },
    {
      'name': 'Ginger',
      'weight': '250gm, Price',
      'price': 2.99,
      'quantity': 1,
      'image': 'assets/image/p 2.png',
    },
    {
      'name': 'Zucchini',
      'weight': '330gm, Price',
      'price': 4.99,
      'quantity': 1,
      'image': 'assets/image/pngfuel 6(1).png',
    },
  ];

  double get totalPrice {
    double total = 0;

    for (final item in cartItems) {
      total += item['price'] * item['quantity'];
    }

    return total;
  }

  void removeItem(int index) {
    final removedItem = cartItems[index];

    setState(() {
      cartItems.removeAt(index);
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${removedItem['name']} removed',
        ),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              if (index <= cartItems.length) {
                cartItems.insert(index, removedItem);
              } else {
                cartItems.add(removedItem);
              }
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Color(0xFF181725),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: const Color(0xFFE2E2E2),
          ),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              itemCount: cartItems.length,
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 30,
                  color: Color(0xFFE2E2E2),
                );
              },
              itemBuilder: (context, index) {
                final item = cartItems[index];

                return Row(
                  children: [
                    Image.asset(
                      item['image'],
                      width: 75,
                      height: 75,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item['name'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              GestureDetector(
                                onTap: () {
                                  removeItem(index);
                                },
                                child: const Icon(
                                  Icons.close,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 5),

                          Text(
                            item['weight'],
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 12),

                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  _quantityButton(
                                    icon: Icons.remove,
                                    color: Colors.grey,
                                    onTap: () {
                                      if (item['quantity'] > 1) {
                                        setState(() {
                                          item['quantity']--;
                                        });
                                      }
                                    },
                                  ),

                                  const SizedBox(width: 12),

                                  Text(
                                    '${item['quantity']}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  _quantityButton(
                                    icon: Icons.add,
                                    color: const Color(0xFF53B175),
                                    onTap: () {
                                      setState(() {
                                        item['quantity']++;
                                      });
                                    },
                                  ),
                                ],
                              ),

                              Text(
                                '\$${(item['price'] * item['quantity']).toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () async {
                  final orderResult =
                      await showModalBottomSheet<bool>(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return const CheckoutBottomSheet();
                    },
                  );

                  if (!mounted) return;

                  if (orderResult == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const OrderAcceptedScreen(),
                      ),
                    );
                  } else if (orderResult == false) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const OrderFailedScreen(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF53B175),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: Row(
                  children: [
                    const Spacer(),

                    const Text(
                      'Go to Checkout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Spacer(),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF489E67),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(
              0,
              'assets/icons/store 1.png',
              'Shop',
            ),
            _navItem(
              1,
              'assets/icons/Group 3.png',
              'Explore',
            ),
            _navItem(
              2,
              'assets/icons/Vector(2).png',
              'Cart',
            ),
            _navItem(
              3,
              'assets/icons/bookmark 1(1).png',
              'Favourite',
            ),
            _navItem(
              4,
              'assets/icons/Vector(3).png',
              'Account',
            ),
          ],
        ),
      ),
    );
  }

  Widget _quantityButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFE2E2E2),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: color,
          size: 20,
        ),
      ),
    );
  }

  Widget _navItem(
    int index,
    String iconPath,
    String label,
  ) {
    final selected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        // Shop
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
          return;
        }

        // Explore
        if (index == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ExploreScreen(),
            ),
          );
          return;
        }

        // Cart
        if (index == 2) {
          setState(() {
            _selectedIndex = 2;
          });
          return;
        }

        // Favourite
        if (index == 3) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => FavouriteScreen(),
            ),
          );
          return;
        }

        // Account
        if (index == 4) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AccountScreen(),
            ),
          );
          return;
        }
      },

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: 22,
            height: 22,
            color: selected
                ? const Color(0xFF53B175)
                : const Color(0xFF181725),
          ),

          const SizedBox(height: 4),

          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: selected
                  ? const Color(0xFF53B175)
                  : const Color(0xFF181725),
            ),
          ),
        ],
      ),
    );
  }
}