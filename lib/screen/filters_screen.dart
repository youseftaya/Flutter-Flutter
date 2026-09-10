import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final List<String> _categories = [
    'Eggs',
    'Noodles & Pasta',
    'Chips & Crisps',
    'Fast Food',
  ];

  final List<String> _brands = [
    'Individual Callection',
    'Cocola',
    'Ifad',
    'Kazi Farmas',
  ];

  final Set<String> _selectedCategories = {'Eggs'};
  final Set<String> _selectedBrands = {'Cocola'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/icons/Group 6846.png',
                        width: 18,
                        height: 18,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.close,
                            size: 24,
                            color: Color(0xFF181725),
                          );
                        },
                      ),
                    ),
                  ),

                  const Text(
                    'Filters',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF181725),
                    ),
                  ),
                ],
              ),
            ),

            // Filters body
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 25,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFFF2F3F2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Categories
                      const Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF181725),
                        ),
                      ),

                      const SizedBox(height: 15),

                      ..._categories.map(
                        (category) => _buildCheckboxTile(
                          label: category,
                          isSelected:
                              _selectedCategories.contains(category),
                          onChanged: (isSelected) {
                            setState(() {
                              if (isSelected) {
                                _selectedCategories.add(category);
                              } else {
                                _selectedCategories.remove(category);
                              }
                            });
                          },
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Brand
                      const Text(
                        'Brand',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF181725),
                        ),
                      ),

                      const SizedBox(height: 15),

                      ..._brands.map(
                        (brand) => _buildCheckboxTile(
                          label: brand,
                          isSelected: _selectedBrands.contains(brand),
                          onChanged: (isSelected) {
                            setState(() {
                              if (isSelected) {
                                _selectedBrands.add(brand);
                              } else {
                                _selectedBrands.remove(brand);
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Apply Filter Button
            Container(
              color: const Color(0xFFF2F3F2),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
                bottom: 25,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      {
                        'categories': _selectedCategories.toList(),
                        'brands': _selectedBrands.toList(),
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF53B175),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Apply Filter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxTile({
    required String label,
    required bool isSelected,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          onChanged(!isSelected);
        },
        behavior: HitTestBehavior.opaque,
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF53B175)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF53B175)
                      : const Color(0xFFB1B1B1),
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
            ),

            const SizedBox(width: 14),

            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? const Color(0xFF53B175)
                    : const Color(0xFF181725),
              ),
            ),
          ],
        ),
      ),
    );
  }
}