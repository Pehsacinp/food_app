import 'package:flutter/material.dart';
import 'package:food_app/src/features/favori/presentation/provider/favorite_provider.dart';
import 'package:food_app/src/features/home/presentation/provider/provieder.dart';
import 'package:food_app/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class AppBlocProviders extends StatelessWidget {
  final Widget child;

  const AppBlocProviders({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => ToggleProvider()),
      ],
      child: child,
    );
  }
}
