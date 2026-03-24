import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mercado_livre_app/models/product.model.dart';
import 'package:mercado_livre_app/pages/cart.page.dart';
import 'package:mercado_livre_app/stores/cart.store.dart';
import 'package:mercado_livre_app/widgets/product_item.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CartStore store = CartStore();

  final List<Product> products = List.generate(15, (index) {
    final price = (index + 1) * 599.99;
    return Product(
      id: index + 1,
      title: 'Apple Iphone 11 Pro (128gb)',
      color: 'Preto',
      price: double.parse(price.toStringAsFixed(2)),
      image: 'assets/images/iphone.png',
      rating: index % 2 == 0 ? 5 : 1,
    );
  });

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      store.finishLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          color: Colors.yellow[600],
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const TextField(
                            key: Key("inputSearch"),
                            decoration: InputDecoration(
                              hintText: 'Buscar no Mercado Livre',
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.grey),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Observer(
                        builder: (_) => Stack(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.shopping_cart_outlined,
                                  color: Colors.black),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => CartPage(store: store),
                                  ),
                                );
                              },
                            ),
                            if (store.cartCount > 0)
                              Positioned(
                                right: 4,
                                top: 4,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '${store.cartCount}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Icon(Icons.pin_drop_outlined, size: 18),
                      SizedBox(width: 4),
                      Text('Informe o seu cep'),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward_ios, size: 14),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.yellow),
            );
          }

          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${products.length} resultados'),
                    const Text(
                      'Filtrar (2) ▼',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductItem(
                      product: products[index],
                      store: store,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
