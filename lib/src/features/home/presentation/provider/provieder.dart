import 'package:flutter/foundation.dart';
import 'package:food_app/src/features/home/domain/repositories/yemekler_model.dart';

class CartProvider with ChangeNotifier {
  // Sepetteki yemekler ve miktarlarını saklamak için Map kullanımı
  final Map<Yemekler, int> _items = {};

  List<Yemekler> get items => _items.keys.toList();

  void addItem(Yemekler item) {
    if (_items.containsKey(item)) {
      _items[item] = _items[item]! + 1;
    } else {
      _items[item] = 1;
    }
    notifyListeners();
  }

  void removeItem(Yemekler item) {
    if (_items.containsKey(item)) {
      if (_items[item]! > 1) {
        _items[item] = _items[item]! - 1;
      } else {
        _items.remove(item);
      }
      notifyListeners();
    }
  }

  int getItemQuantity(Yemekler item) {
    return _items[item] ?? 0;
  }

  double getTotalPrice() {
    double total = 0.0;

    for (var entry in _items.entries) {
      double itemPrice = double.tryParse(entry.key.yemekFiyat ?? '0') ?? 0.0;
      total += itemPrice * entry.value;
    }
    return total;
  }

  double itemTotalPrice(Yemekler item) {
    // `item.yemekFiyat`'ı String'den double'a dönüştürür
    double cevirilen = double.tryParse(item.yemekFiyat ?? '0') ?? 0.0;
    // Fiyatı kendisiyle çarpar ve döndürür
    return cevirilen * getItemQuantity(item);
  }

  int get itemCount => _items.values.fold(0, (previousValue, quantity) => previousValue + quantity);
}
