import 'package:flutter/material.dart';

class CheckoutBottomSheet extends StatefulWidget {
  const CheckoutBottomSheet({super.key});

  @override
  State<CheckoutBottomSheet> createState() =>
      _CheckoutBottomSheetState();
}

class _CheckoutBottomSheetState extends State<CheckoutBottomSheet> {
  String selectedDelivery = 'Select Method';
  String selectedPayment = 'Select Method';

  final TextEditingController promoController = TextEditingController();

  double deliveryPrice = 0;
  double discount = 0;

  double subtotal = 13.97;

  double get totalPrice {
    return subtotal + deliveryPrice - discount;
  }

  @override
  void dispose() {
    promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 20,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= Header =================

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Image.asset(
                    'assets/icons/Group 6846.png',
                    width: 18,
                    height: 18,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),

            const SizedBox(height: 15),

            const Divider(
              height: 1,
              color: Color(0xFFE2E2E2),
            ),

            // ================= Delivery =================

            _buildOptionTile(
              title: 'Delivery',
              trailingWidget: Text(
                selectedDelivery,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                _showDeliveryOptions();
              },
            ),

            // ================= Payment =================

            _buildOptionTile(
              title: 'Payment',
              trailingWidget: selectedPayment == 'Select Method'
                  ? Image.asset(
                      'assets/image/card.png',
                      width: 28,
                      height: 18,
                      fit: BoxFit.contain,
                    )
                  : Text(
                      selectedPayment,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
              onTap: () {
                _showPaymentOptions();
              },
            ),

            // ================= Promo Code =================

            _buildOptionTile(
              title: 'Promo Code',
              trailingWidget: const Text(
                'Pick discount',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                _showPromoCode();
              },
            ),

            // ================= Total Cost =================

            _buildOptionTile(
              title: 'Total Cost',
              trailingWidget: Text(
                '\$${totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {},
            ),

            const SizedBox(height: 15),

            // ================= Terms =================

            RichText(
              text: const TextSpan(
                text: 'By placing an order you agree to our ',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  height: 1.4,
                ),
                children: [
                  TextSpan(
                    text: '\nTerms And Conditions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ================= Place Order =================

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF53B175),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: _placeOrder,
                child: const Text(
                  'Place Order',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // Delivery
  // =====================================================

  void _showDeliveryOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Delivery Method',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              ListTile(
                title: const Text('Standard Delivery'),
                subtitle: const Text('Delivery in 2-3 days'),
                trailing: const Text(
                  '\$2.00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedDelivery = 'Standard';
                    deliveryPrice = 2;
                  });

                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: const Text('Express Delivery'),
                subtitle: const Text('Delivery in 1 day'),
                trailing: const Text(
                  '\$5.00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedDelivery = 'Express';
                    deliveryPrice = 5;
                  });

                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  // =====================================================
  // Payment
  // =====================================================

  void _showPaymentOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Payment Method',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              ListTile(
                leading: const Icon(
                  Icons.money,
                  color: Color(0xFF53B175),
                ),
                title: const Text('Cash on Delivery'),
                onTap: () {
                  setState(() {
                    selectedPayment = 'Cash';
                  });

                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.credit_card,
                  color: Color(0xFF53B175),
                ),
                title: const Text('Credit / Debit Card'),
                onTap: () {
                  setState(() {
                    selectedPayment = 'Card';
                  });

                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  // =====================================================
  // Promo Code
  // =====================================================

  void _showPromoCode() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Promo Code'),

          content: TextField(
            controller: promoController,
            decoration: const InputDecoration(
              hintText: 'Enter promo code',
              border: OutlineInputBorder(),
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF53B175),
              ),
              onPressed: () {
                if (promoController.text.trim().toUpperCase() ==
                    'SAVE10') {
                  setState(() {
                    discount = 1.0;
                  });

                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Promo code applied! \$1 discount',
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Invalid promo code',
                      ),
                    ),
                  );
                }
              },
              child: const Text(
                'Apply',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // =====================================================
  // Place Order
  // =====================================================

  void _placeOrder() {
    if (selectedDelivery == 'Select Method') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select a delivery method',
          ),
        ),
      );
      return;
    }

    if (selectedPayment == 'Select Method') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select a payment method',
          ),
        ),
      );
      return;
    }

    // نرجع false للـ MyCartScreen
    // عشان يفتح OrderFailedScreen
    Navigator.pop(context, true);
  }

  // =====================================================
  // Reusable Option Tile
  // =====================================================

  Widget _buildOptionTile({
    required String title,
    required Widget trailingWidget,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 14,
            ),
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const Spacer(),

                trailingWidget,

                const SizedBox(width: 8),

                Image.asset(
                  'assets/icons/back arrow.png',
                  width: 14,
                  height: 14,
                ),
              ],
            ),
          ),
        ),

        const Divider(
          height: 1,
          color: Color(0xFFE2E2E2),
        ),
      ],
    );
  }
}