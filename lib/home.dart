import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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

  List<bool> isFavorited = [false, false, false, false];
  List<bool> isFavoritedBar = [false, false, false, false];
  bool anyFavorited = false;
  bool anyFavorited2 = false;

  @override
  void initState() {
    super.initState();
    anyFavorited2 = isFavorited.any((element) => element);
    anyFavorited = isFavoritedBar.any((element) => element);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                anyFavorited2 = !anyFavorited2;
                isFavorited.fillRange(0, isFavorited.length, anyFavorited2);
              });
            },
            icon: Icon(
              anyFavorited2 ? Icons.favorite : Icons.favorite_border,
              color: anyFavorited2 ? Colors.red : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: GridView.builder(
          itemCount: images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.8,
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          images[index],
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                          top: 4,
                          right: 4,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                isFavoritedBar[index] = !isFavoritedBar[index];
                                anyFavorited =
                                    isFavoritedBar.any((element) => element);
                              });
                            },
                            icon: Icon(
                              isFavoritedBar[index]
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavoritedBar[index]
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      titles[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "₹${price[index]}",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      offerText[index],
                      style: const TextStyle(color: Colors.green),
                    ),
                    Text(
                      disctText[index],
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Text(
                      delivery[index],
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        const Text(
                          "Shop",
                          style: TextStyle(fontSize: 11),
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.green,
                          size: 20,
                        ),
                        Text(
                          ratings[index].toString(),
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(ratingCount[index].toString())
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
