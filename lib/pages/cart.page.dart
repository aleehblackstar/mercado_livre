import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mercado_livre_app/stores/cart.store.dart';

class CartPage extends StatelessWidget {
  final CartStore store;

  const CartPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        leading: BackButton(
          key: const Key("backBtn"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Carrinho de compras"),
      ),
      body: Observer(
        builder: (_) {
          if (store.cartItems.isEmpty) {
            return Center(
              child: Image.asset(
                key: const Key("imageCart"),
                'assets/images/empty_cart.png',
                width: 200,
              ),
            );
          }

          return ListView.builder(
            itemCount: store.cartItems.length,
            itemBuilder: (context, index) {
              final product = store.cartItems[index];
              return ListTile(
                title: Text(
                  '$index - ${product.title} - ${product.color} - ${product.price.toStringAsFixed(2)}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
