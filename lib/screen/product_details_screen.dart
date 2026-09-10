import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;

  const ProductDetailsScreen({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  bool isFavorite = false;
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final double price =
        double.parse(widget.price.replaceAll('\$', ''));

    final double totalPrice = price * quantity;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image Container
                    Container(
                      height: 280,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffF2F3F2),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Stack(
                        children: [
                          // Back Button
                          Positioned(
                            top: 15,
                            left: 10,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),

                          // Share Button
                          Positioned(
                            top: 15,
                            right: 10,
                            child: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/icons/Vector(4).png',
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),

                          // Product Image
                          Center(
                            child: Image.asset(
                              widget.imagePath,
                              height: 170,
                              fit: BoxFit.contain,
                            ),
                          ),

                          // Page Indicators
                          Positioned(
                            bottom: 18,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 16,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff53B175),
                                    borderRadius:
                                        BorderRadius.circular(2),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  width: 4,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // باقي محتوى الصفحة
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25),

                          // Title + Favorite
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.title,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff181725),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                },
                                icon: Image.asset(
                                  'assets/icons/bookmark 1(1).png',
                                  width: 24,
                                  height: 24,
                                  color: isFavorite
                                      ? Colors.red
                                      : null,
                                ),
                              ),
                            ],
                          ),

                          // Subtitle
                          Text(
                            widget.subtitle,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff7C7C7C),
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(height: 25),

                          // Quantity + Price
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (quantity > 1) {
                                        setState(() {
                                          quantity--;
                                        });
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                      color: Color(0xff7C7C7C),
                                    ),
                                  ),

                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            const Color(0xffE2E2E2),
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(14),
                                    ),
                                    child: Text(
                                      '$quantity',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        quantity++;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      color: Color(0xff53B175),
                                    ),
                                  ),
                                ],
                              ),

                              // Total Price
                              Text(
                                '\$${totalPrice.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff181725),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          const Divider(
                            color: Color(0xffE2E2E2),
                          ),

                          // Product Detail
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(
                              "Product Detail",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff181725),
                              ),
                            ),
                            trailing: Icon(
                              isExpanded
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_right,
                              color: const Color(0xff181725),
                            ),
                            onTap: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                          ),

                          if (isExpanded)
                            const Text(
                              "Apples Are nutritious. Apples May be good for "
                              "Weight loss. Apples may be good for your Heart. "
                              "As part of a Healthful And varied diet.",
                              style: TextStyle(
                                fontSize: 13,
                                height: 1.4,
                                color: Color(0xff7C7C7C),
                              ),
                            ),

                          const Divider(
                            color: Color(0xffE2E2E2),
                          ),

                          // Nutritions
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(
                              "Nutritions",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff181725),
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        const Color(0xffEBEBEB),
                                    borderRadius:
                                        BorderRadius.circular(5),
                                  ),
                                  child: const Text(
                                    "100gr",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xff7C7C7C),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 8),

                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                  color: Color(0xff181725),
                                ),
                              ],
                            ),
                          ),

                          const Divider(
                            color: Color(0xffE2E2E2),
                          ),

                          // Review
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(
                              "Review",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff181725),
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: List.generate(
                                    5,
                                    (index) => const Icon(
                                      Icons.star,
                                      color: Color(0xffF3603F),
                                      size: 16,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 8),

                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                  color: Color(0xff181725),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Add To Basket
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff53B175),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    "Add To Basket",
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
      ),
    );
  }
}