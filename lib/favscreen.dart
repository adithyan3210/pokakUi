import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopuipokak/favprovider.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: favoritesProvider.favoriteProducts.isEmpty
          ? const Center(
              child: Text(
                'No favorites yet',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: favoritesProvider.favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = favoritesProvider.favoriteProducts[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      leading: Container(
                        width: 80,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(product.image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      title: Text(
                        product.title,
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '₹${product.price}',
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          favoritesProvider.removeProductFromFavorites(product);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
