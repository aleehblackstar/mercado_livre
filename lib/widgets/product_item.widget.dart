import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mercado_livre_app/models/product.model.dart';
import 'package:mercado_livre_app/stores/cart.store.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  final CartStore store;

  const ProductItem({
    super.key,
    required this.product,
    required this.store,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  void _addToCart() {
    final added = widget.store.addToCart(widget.product);

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: added ? Colors.yellow[700] : Colors.red,
        content: Text(
          added ? 'Produto adicionado!' : 'Produto não adicionado!',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        action: SnackBarAction(
          label: 'X',
          textColor: Colors.black,
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final installment = product.price / 10;

    return Container(
      key: const Key("productItem"),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3)),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            key: const Key("productImage"),
            product.image,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${product.title} - ${product.color}',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  'R\$ ${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'em 10x R\$ ${installment.toStringAsFixed(2)} sem juros',
                  style: const TextStyle(color: Colors.green, fontSize: 12),
                ),
                const Text(
                  'Frete grátis',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Disponível em 6 cores',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 4),
                RatingBar.builder(
                  initialRating: product.rating,
                  minRating: 1,
                  itemSize: 20,
                  itemBuilder: (context, _) =>
                      const Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {
                    setState(() => product.rating = rating);
                  },
                ),
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    key: const Key("addProductToCart"),
                    onTap: _addToCart,
                    child: const Text(
                      'Add carrinho',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
