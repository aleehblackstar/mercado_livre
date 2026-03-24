import 'package:mercado_livre_app/models/product.model.dart';
import 'package:mobx/mobx.dart';

part 'cart.store.g.dart';

class CartStore = CartStoreBase with _$CartStore;

abstract class CartStoreBase with Store {
  @observable
  ObservableList<Product> cartItems = ObservableList<Product>();

  @observable
  bool isLoading = true;

  @computed
  int get cartCount => cartItems.length;

  @action
  void finishLoading() {
    isLoading = false;
  }

  @action
  bool addToCart(Product product) {
    final alreadyIn = cartItems.any((p) => p.id == product.id);
    if (alreadyIn) return false;
    cartItems.add(product);
    return true;
  }
}
