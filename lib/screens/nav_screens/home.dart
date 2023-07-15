// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce_damex/screens/components/colors.dart';
import 'package:ecommerce_damex/screens/components/components.dart';
import 'package:ecommerce_damex/screens/product_purchase/view_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Hello text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello',
                  style: TextStyle(
                      color: darkTextColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 5),
              Text('Welcome to Laza.',
                  style: TextStyle(color: mutedTextColor, fontSize: 15)),
            ],
          ),
        ),

        // Search section
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: lightGreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search...',
                      icon: SvgPicture.asset('images/icons/search.svg'),
                      iconColor: mutedTextColor,
                      hintStyle: TextStyle(color: mutedTextColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('images/icons/voice.svg'),
                ),
              ),
            ],
          ),
        ),

        // Choose brand section
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 8),
          child: sectionTitle('Choose Brand', 'View All', () {}),
        ),

        // brands
        SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 10),
              brandBadge('images/static/Adidas.svg', 'Adidas'),
              brandBadge('images/static/nike.svg', 'Nike'),
              brandBadge('images/static/Fils.svg', 'Fila'),
              brandBadge('images/static/puma.svg', 'puma'),
            ],
          ),
        ),

        // new arrival
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: sectionTitle('New Arrival', 'View All', () {}),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.175 / 2,
            children: [
              productCard(
                  'images/static/men1.png',
                  'Nike Sportswear Club Fleece',
                  99,
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ViewProduct())))),
              productCard('images/static/men3.png',
                  'Trail Running Jacket Nike Windrunner', 199, () {}),
              productCard('images/static/men2.png',
                  'Nike Sportswear Club Fleece', 350, () {}),
              productCard('images/static/men4.png',
                  'Nike Sportswear Club Fleece', 99, () {}),
              productCard('images/static/men1.png',
                  'Nike Sportswear Club Fleece', 99, () {}),
            ],
          ),
        )
      ],
    );
  }
}
