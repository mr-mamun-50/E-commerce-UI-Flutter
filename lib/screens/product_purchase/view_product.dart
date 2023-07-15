// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_damex/screens/components/colors.dart';
import 'package:ecommerce_damex/screens/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ViewProduct extends StatefulWidget {
  ViewProduct({Key? key}) : super(key: key);

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('images/icons/bag.svg',
                colorFilter: ColorFilter.mode(darkTextColor, BlendMode.srcIn)),
            style: IconButton.styleFrom(backgroundColor: lightGreyColor),
          ),
          SizedBox(width: 5)
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              // Main image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/static/men1.png'),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              // name & price
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // title & subtitle
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Men\'s Printed Pullover Hoodie',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: mutedTextColor, fontSize: 13),
                          ),
                          Text(
                            'Nike Club Fleece',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: darkTextColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),

                    // Price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(color: mutedTextColor, fontSize: 13),
                        ),
                        Text(
                          '\$120',
                          style: TextStyle(
                              color: darkTextColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),

              // Featured images
              SizedBox(
                height: 75,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 10),
                    featuredImage(
                      'images/static/men1.png',
                      () => showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Container(
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/static/men1.png'),
                                fit: BoxFit.fitWidth,
                              ),
                              shape: RoundedRectangleBorder(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    featuredImage('images/static/men2.png', () {}),
                    featuredImage('images/static/men3.png', () {}),
                    featuredImage('images/static/men4.png', () {}),
                    featuredImage('images/static/men1.png', () {}),
                    featuredImage('images/static/men2.png', () {}),
                  ],
                ),
              ),

              // select size
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 8),
                child: sectionTitle('Size', 'Size Guide', () {}),
              ),
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 10),
                    sizeTile('S', () {}),
                    sizeTile('M', () {}),
                    sizeTile('L', () {}),
                    sizeTile('XL', () {}),
                    sizeTile('2XL', () {}),
                  ],
                ),
              ),

              //   product description
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 8),
                child: Column(
                  children: [
                    sectionTitle('Description', '', () {}),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with',
                            style: TextStyle(color: mutedTextColor),
                          ),
                          TextSpan(
                            text: ' Read More..',
                            style: TextStyle(
                                color: darkTextColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              //   Reviews & total price
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 8),
                child: Column(
                  children: [
                    sectionTitle('Reviews', '', () {}),

                    // reviews
                    ExpansionTile(
                      initiallyExpanded: true,
                      tilePadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        child: Image.asset('images/static/men3.png'),
                      ),
                      title: Text('Ronald Richards',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                      subtitle: Row(children: [
                        Icon(CupertinoIcons.clock,
                            size: 15, color: mutedTextColor),
                        Text(' 13 Sep, 2020',
                            style:
                                TextStyle(fontSize: 11, color: mutedTextColor)),
                      ]),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Rating
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('4.8',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),
                              Text(' rating',
                                  style: TextStyle(
                                      color: mutedTextColor, fontSize: 11))
                            ],
                          ),

                          //  rating bar
                          RatingBar(
                            itemSize: 13,
                            initialRating: 4.5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            ratingWidget: RatingWidget(
                              empty:
                                  Icon(Icons.star_border, color: Colors.black),
                              half: Icon(Icons.star_half,
                                  color: Color(0xFFFF971E)),
                              full: Icon(Icons.star, color: Color(0xFFFF971E)),
                            ),
                            onRatingUpdate: (double value) {},
                          ),
                        ],
                      ),
                      children: [
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
                          style: TextStyle(color: mutedTextColor),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),

                    // Total price
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('Total Price',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                      subtitle: Text('with VAT,SD',
                          style:
                              TextStyle(fontSize: 11, color: mutedTextColor)),
                      trailing: Text(
                        '\$125',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),
            ],
          ),

          //   add to cart button
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: MaterialButton(
              onPressed: () {},
              height: 50,
              color: primaryColor,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              child: const Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
