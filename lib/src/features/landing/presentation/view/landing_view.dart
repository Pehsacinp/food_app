import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:food_app/src/features/basket/presentation/view/basket_view.dart';
import 'package:food_app/src/features/favori/presentation/provider/favorite_provider.dart';
import 'package:food_app/src/features/favori/presentation/view/favori_view.dart';
import 'package:food_app/src/features/home/presentation/provider/provieder.dart';
import 'package:food_app/src/features/home/presentation/view/home_view.dart';
import 'package:food_app/src/features/profile/presentation/view/profile_view.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';

@RoutePage(name: 'LandingRoute')
class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const HomeView(),
          item: ItemConfig(
            icon: const Icon(Icons.home_outlined),
            title: "Keşfet",
          ),
        ),
        PersistentTabConfig(
          screen: Consumer<FavoriteProvider>(
            builder: (context, favoriteProvider, child) {
              return FavoriteView();
            },
          ),
          item: ItemConfig(
            icon: Stack(
              children: [
                Icon(Icons.favorite_outline_outlined),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Consumer<FavoriteProvider>(
                    builder: (context, favoriteProvider, child) {
                      return favoriteProvider.itemCount > 0
                          ? Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                              ),
                              child: Center(
                                child: Text(
                                  '${favoriteProvider.itemCount}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            )
                          : Container();
                    },
                  ),
                ),
              ],
            ),
            title: "Favoriler",
          ),
        ),
        PersistentTabConfig(
          screen: GestureDetector(
            onTap: () {
              showCustomSnackBar() {}
            },
            child: const ProfileView(),
          ),
          item: ItemConfig(
            icon: const Icon(Icons.person_outline_outlined),
            title: "Hesabım",
          ),
        ),
        PersistentTabConfig(
          screen: Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              return BasketView(); // CartProvider'ı kullanarak BasketView'u oluşturun
            },
          ),
          item: ItemConfig(
            icon: Stack(
              children: [
                Icon(Icons.shopping_bag_outlined),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Consumer<CartProvider>(
                    builder: (context, cartProvider, child) {
                      return cartProvider.itemCount > 0
                          ? Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                              ),
                              child: Center(
                                child: Text(
                                  '${cartProvider.itemCount}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            )
                          : Container();
                    },
                  ),
                ),
              ],
            ),
            title: "Sepetim",
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) => PersistentTabView(
        backgroundColor: Colors.white,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style2BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      );
}
