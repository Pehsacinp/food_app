import 'package:flutter/material.dart';
import 'package:food_app/src/features/home/domain/repositories/yemekler_model.dart';

class FavoriteProvider with ChangeNotifier {
  List<Yemekler> _favorites = [];

  List<Yemekler> get favorites => _favorites;

  void addFavorite(Yemekler yemek) {
    _favorites.add(yemek);
    notifyListeners();
  }

  void removeFavorite(Yemekler yemek) {
    _favorites.remove(yemek);
    notifyListeners();
  }

  bool isFavorite(Yemekler yemek) {
    return _favorites.contains(yemek);
  }

  double getTotalPrice() {
    double total = 0.0;
    for (var item in _favorites) {
      total += double.tryParse(item.yemekFiyat ?? '0') ?? 0.0;
    }
    return total;
  }

  int get itemCount => _favorites.length;
}
