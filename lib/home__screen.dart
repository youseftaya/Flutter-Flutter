import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/image/Group.png"),

          Row(
            spacing: 5,
            children: [
              Image.asset("assets/icons/Exclude.png"),
              Text(
                'Dhaka, Banassre',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff4C4F4D),
                ),
              ),
            ],
          ),

          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xffF2F3F2),
            ),
            child: Row(
              spacing: 10,
              children: [
                Image.asset("assets/icons/Vector.png"),
                Text(
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

          Image.asset("assets/image/banner.png"),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Exclusive Offer",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff181725),
                ),
              ),
              Text(
                "See all",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff53B175),
                ),
              ),
            ],
          ),

          Row(
            children: [
              // Banana Card - الشمال
              Container(
                width: 180,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/image/banas.png",
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      "Organic Bananas",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff181725),
                      ),
                    ),

                    Text(
                      "7pcs,Prieg",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff7C7C7C),
                      ),
                    ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$34.99",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff181725),
                          ),
                        ),

                        FloatingActionButton(
                          mini: true,
                          onPressed: () {},
                          backgroundColor: Color(0xff53B175),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(width: 10),

              // Apple Card - اليمين
              Container(
                width: 180,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/image/pngfuel 1.png",
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      "Red Apple",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff181725),
                      ),
                    ),

                    Text(
                      "1kg, priceg",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff7C7C7C),
                      ),
                    ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$34.99",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff181725),
                          ),
                        ),

                        FloatingActionButton(
                          mini: true,
                          onPressed: () {},
                          backgroundColor: Color(0xff53B175),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}