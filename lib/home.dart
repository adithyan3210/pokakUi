import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopuipokak/favprovider.dart';
import 'package:shopuipokak/product_model.dart';
import 'package:shopuipokak/favscreen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

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
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const FavScreen();
                },
              ));
            },
            icon: const Icon(Icons.favorite_border),
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
          itemCount: productProvider.images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.8,
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            final product = Product(
              image: productProvider.images[index],
              title: productProvider.titles[index],
              price: productProvider.price[index],
            );
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
                          productProvider.images[index],
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                          top: 4,
                          right: 4,
                          child: Consumer<FavoritesProvider>(
                            builder: (context, favoritesProvider, child) {
                              return IconButton(
                                onPressed: () {
                                  if (favoritesProvider
                                      .isProductInFavorites(product)) {
                                    favoritesProvider
                                        .removeProductFromFavorites(product);
                                  } else {
                                    favoritesProvider
                                        .addProductToFavorites(product);
                                  }
                                },
                                icon: Icon(
                                    favoritesProvider
                                            .isProductInFavorites(product)
                                        ?Icons.favorite
                                        : Icons.favorite_border,
                                    color: favoritesProvider
                                            .isProductInFavorites(product)
                                        ? Colors.red
                                        : null),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      productProvider.titles[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "₹${productProvider.price[index]}",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      productProvider.offerText[index],
                      style: const TextStyle(color: Colors.green),
                    ),
                    Text(
                      productProvider.disctText[index],
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Text(
                      productProvider.delivery[index],
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
                          productProvider.ratings[index].toString(),
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(productProvider.ratingCount[index].toString())
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
