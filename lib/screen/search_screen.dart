import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'filters_screen.dart';
import 'cart_screen.dart';

class Product {
  final String name;
  final String unit;
  final String price;
  final String imagePath;

  Product({
    required this.name,
    required this.unit,
    required this.price,
    required this.imagePath,
  });
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final TextEditingController _searchController = TextEditingController();

  final List<Product> _allProducts = [
    Product(
      name: 'Egg Chicken Red',
      unit: '4pcs, Price',
      price: '\$1.99',
      imagePath: 'assets/image/pngfuel 16.png',
    ),
    Product(
      name: 'Egg Chicken White',
      unit: '180g, Price',
      price: '\$1.50',
      imagePath: 'assets/image/pngfuel 18.png',
    ),
    Product(
      name: 'Egg Pasta',
      unit: '30gm, Price',
      price: '\$15.99',
      imagePath: 'assets/image/Group 6848.png',
    ),
    Product(
      name: 'Egg Noodles',
      unit: '2L, Price',
      price: '\$15.99',
      imagePath: 'assets/image/egg-noodle (1) 2.png',
    ),
    Product(
      name: 'Mayonnais Eggless',
      unit: '325ml, Price',
      price: '\$4.99',
      imagePath:
          'assets/image/American-Garden-Mayonnaise-Eggless-473ml 2.png',
    ),
    Product(
      name: 'Egg Noodles',
      unit: '330ml, Price',
      price: '\$4.99',
      imagePath: 'assets/image/rp_24790392_0053554627_l 2.png',
    ),
  ];

  List<Product> _filteredProducts = [];

  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _filteredProducts = _allProducts;
  }

  void _runFilter(String enteredKeyword) {
    final keyword = enteredKeyword.trim().toLowerCase();

    List<Product> results;

    if (keyword.isEmpty) {
      results = _allProducts;
    } else {
      results = _allProducts.where((product) {
        return product.name.toLowerCase().contains(keyword);
      }).toList();
    }

    setState(() {
      _filteredProducts = results;
    });
  }

  Future<void> _playSound() async {
    await _audioPlayer.stop();

    await _audioPlayer.play(
      AssetSource(
        'dragon-studio-pop-402324(1).mp3',
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 15.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F3F2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/Vector.png',
                            width: 18,
                            height: 18,
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              onChanged: (value) {
                                _runFilter(value);
                              },
                              decoration: const InputDecoration(
                                hintText: 'Search Store',
                                hintStyle: TextStyle(
                                  color: Color(0xFF7C7C7C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                          if (_searchController.text.isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                _searchController.clear();
                                _runFilter('');
                              },
                              child: const Icon(
                                Icons.cancel,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FiltersScreen(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/icons/Group 6839.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: _filteredProducts.isEmpty
                  ? const Center(
                      child: Text(
                        'No products found',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.72,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: _filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = _filteredProducts[index];

                        return Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: const Color(0xFFE2E2E2),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Image.asset(
                                    product.imagePath,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF181725),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),

                              const SizedBox(height: 4),

                              Text(
                                product.unit,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF7C7C7C),
                                ),
                              ),

                              const SizedBox(height: 12),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.price,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF181725),
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: _playSound,
                                    child: Container(
                                      width: 42,
                                      height: 42,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF53B175),
                                        borderRadius:
                                            BorderRadius.circular(14),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                ],
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

      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
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
            _buildNavItem(
              0,
              'assets/icons/store 1.png',
              'Shop',
            ),

            _buildNavItem(
              1,
              'assets/icons/Group 3.png',
              'Explore',
            ),

            _buildNavItem(
              2,
              'assets/icons/Vector(2).png',
              'Cart',
            ),

            _buildNavItem(
              3,
              'assets/icons/bookmark 1(1).png',
              'Favourite',
            ),

            _buildNavItem(
              4,
              'assets/icons/Vector(3).png',
              'Account',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    String iconPath,
    String label,
  ) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        // Shop → Home
        if (index == 0) {
          Navigator.popUntil(
            context,
            (route) => route.isFirst,
          );
          return;
        }

        // Explore → Explore
        if (index == 1) {
          Navigator.pop(context);
          return;
        }

        // Cart → My Cart
        if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyCartScreen(),
            ),
          );
          return;
        }

        // باقي الأزرار
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: 22,
            height: 22,
            color: isSelected
                ? const Color(0xFF53B175)
                : const Color(0xFF181725),
          ),

          const SizedBox(height: 4),

          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? const Color(0xFF53B175)
                  : const Color(0xFF181725),
            ),
          ),
        ],
      ),
    );
  }
}