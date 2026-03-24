// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartStore on CartStoreBase, Store {
  Computed<int>? _$cartCountComputed;

  @override
  int get cartCount => (_$cartCountComputed ??=
          Computed<int>(() => super.cartCount, name: 'CartStoreBase.cartCount'))
      .value;

  late final _$cartItemsAtom =
      Atom(name: 'CartStoreBase.cartItems', context: context);

  @override
  ObservableList<Product> get cartItems {
    _$cartItemsAtom.reportRead();
    return super.cartItems;
  }

  @override
  set cartItems(ObservableList<Product> value) {
    _$cartItemsAtom.reportWrite(value, super.cartItems, () {
      super.cartItems = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'CartStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$CartStoreBaseActionController =
      ActionController(name: 'CartStoreBase', context: context);

  @override
  void finishLoading() {
    final _$actionInfo = _$CartStoreBaseActionController.startAction(
        name: 'CartStoreBase.finishLoading');
    try {
      return super.finishLoading();
    } finally {
      _$CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool addToCart(Product product) {
    final _$actionInfo = _$CartStoreBaseActionController.startAction(
        name: 'CartStoreBase.addToCart');
    try {
      return super.addToCart(product);
    } finally {
      _$CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cartItems: ${cartItems},
isLoading: ${isLoading},
cartCount: ${cartCount}
    ''';
  }
}
