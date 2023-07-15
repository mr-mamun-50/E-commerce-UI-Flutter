// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_damex/screens/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//__input_decoration__
InputDecoration inputDecoration(String hints) {
  return InputDecoration(
    contentPadding: const EdgeInsets.all(5),
    hintText: hints,
    hintStyle: TextStyle(color: mutedTextColor),
  );
}

// section title
Row sectionTitle(String title, String btnText, Function pressed) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
      TextButton(
        onPressed: () => pressed(),
        style: TextButton.styleFrom(padding: EdgeInsets.all(5)),
        child: Text(
          btnText,
          style: TextStyle(color: mutedTextColor),
        ),
      ),
    ],
  );
}

// Brand badge
Container brandBadge(String img, String name) {
  return Container(
    padding: EdgeInsets.all(5),
    margin: EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      color: lightGreyColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            width: 40,
            height: 40,
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: SvgPicture.asset(img)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            name,
            style: TextStyle(
                color: darkTextColor,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    ),
  );
}

// Product card
Stack productCard(String img, String name, int price, Function navigate) {
  return Stack(
    children: [
      InkWell(
        onTap: () => navigate(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 4 / 5,
              child: Container(
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage(img),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: darkTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              '\$$price',
              style: TextStyle(
                color: darkTextColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      Positioned(
          top: 3,
          right: 3,
          child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('images/icons/heart.svg')))
    ],
  );
}

// Featured image slider component
InkWell featuredImage(String img, Function view) {
  return InkWell(
    child: Container(
      width: 75,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    onTap: () => view(),
  );
}

// size tile
InkWell sizeTile(String name, Function pressed) {
  return InkWell(
    child: Container(
      width: 60,
      margin: EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: lightGreyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: darkTextColor,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    onTap: () => pressed(),
  );
}
