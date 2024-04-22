import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<String> images = [
    "assets/images/1im.jpg",
    "assets/images/2im.jpg",
    "assets/images/2im.jpg",
    "assets/images/1im.jpg",
  ];
  List<String> titles = [
    "Unique Block Toys",
    "Trendy Block Toys",
    "Unique Block Toys",
    "Stylo Block Toys",
  ];

  List<String> price = [
    "138",
    "580",
    "160",
    "144",
  ];
  List<String> priceDiscount = [
    "139",
    "581",
    "161",
    "145",
  ];
  List<String> discount = [
    "1%",
    "1%",
    "1%",
    "1%",
  ];
  List<String> disctText = [
    "1% off|Discount for vadakara",
    "1% off|Discount for vadakara",
    "1% off|Discount for vadakara",
    "1% off|Discount for vadakara",
  ];
  List<String> offerText = [
    "₹127 with Spacial offer",
    "₹127 with Spacial offer",
    "₹127 with Spacial offer",
    "₹127 with Spacial offer",
  ];

  List<String> delivery = [
    "Free delivery",
    "Free delivery",
    "Free delivery",
    "Free delivery",
  ];

  List<double> ratings = [
    4.5,
    3.8,
    4.2,
    4.0,
  ];
  List<double> ratingCount = [
    1229,
    134,
    35,
    4801,
  ];
}
