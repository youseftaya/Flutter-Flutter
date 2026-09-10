import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'explore_screen.dart';
import 'cart_screen.dart';
import 'favourite_screen.dart';
import 'log_in_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int _selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Profile Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage(
                        'assets/image/WhatsApp Image 2026-09-10 at 2.00.55 AM.jpeg',
                      ),
                    ),
                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Yousef Mahmoud',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Icon(
                                Icons.edit_outlined,
                                color: Colors.green.shade600,
                                size: 18,
                              ),
                            ],
                          ),

                          const SizedBox(height: 4),

                          Text(
                            'yousef123@gmail.com',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              const Divider(thickness: 1, height: 1),

              // Menu List
              _buildMenuItem(
                iconPath: 'assets/icons/Orders icon.png',
                title: 'Orders',
                onTap: () {},
              ),

              _buildMenuItem(
                iconPath: 'assets/icons/My Details icon.png',
                title: 'My Details',
                onTap: () {},
              ),

              _buildMenuItem(
                iconPath: 'assets/icons/Delicery address.png',
                title: 'Delivery Address',
                onTap: () {},
              ),

              _buildMenuItem(
                iconPath: 'assets/icons/Vector icon.png',
                title: 'Payment Methods',
                onTap: () {},
              ),

              _buildMenuItem(
                iconPath: 'assets/icons/Promo Cord icon.png',
                title: 'Promo Cord',
                onTap: () {},
              ),

              _buildMenuItem(
                iconPath: 'assets/icons/Bell icon.png',
                title: 'Notifications',
                onTap: () {},
              ),

              _buildMenuItem(
                iconPath: 'assets/icons/help icon.png',
                title: 'Help',
                onTap: () {},
              ),

              _buildMenuItem(
                iconPath: 'assets/icons/about icon.png',
                title: 'About',
                onTap: () {},
              ),

              const SizedBox(height: 30),

              // Log Out Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFFF2F3F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Text(
                          'Log Out',
                          style: TextStyle(
                            color: Color(0xFF53B175),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            'assets/icons/Group 6892.png',
                            width: 22,
                            height: 22,
                            color: const Color(0xFF53B175),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),

        child: BottomNavigationBar(
          currentIndex: _selectedIndex,

          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => FavouriteScreen(),
                ),
              );
            }

            if (index == 4) {
              return;
            }
          },

          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,

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
                'assets/icons/bookmark 1.png',
                width: 22,
                height: 22,
              ),
              label: 'Favourite',
            ),

            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/Vector(3).png',
                width: 22,
                height: 22,
                color: const Color(0xFF53B175),
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Menu Items
  Widget _buildMenuItem({
    required String iconPath,
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 2,
          ),

          leading: Image.asset(
            iconPath,
            width: 22,
            height: 22,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error, size: 22),
          ),

          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),

          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.black87,
          ),

          onTap: onTap,
        ),

        const Divider(
          thickness: 1,
          height: 1,
        ),
      ],
    );
  }
}