import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/src/features/favori/presentation/provider/favorite_provider.dart';
import 'package:food_app/src/features/home/presentation/provider/provieder.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:food_app/src/core/functions/color_ext.dart';
import 'package:food_app/src/core/router/router.gr.dart';
import 'package:food_app/src/features/home/domain/repositories/yemekler_model.dart';

@RoutePage(name: 'HomeRoute')
@RoutePage(name: 'HomeRoute')
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<Yemekler> tumYemekler = [];
  late List<Yemekler> filteredYemekler = [];

  final TextEditingController _searchController = TextEditingController();
  List<Yemekler> sepet = [];

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    istekAt(); // Veriyi çek ve işleme başla
    _searchController.addListener(_onSearchChanged);
    _searchController.clear();
  }

  void _onSearchChanged() {
    setState(() {
      filteredYemekler = tumYemekler.where((yemek) => yemek.yemekAdi!.toLowerCase().contains(_searchController.text.toLowerCase())).toList();
    });
  }

  Future<void> istekAt() async {
    try {
      var url = Uri.parse('http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        var result = ProductDetailModel.fromJson(jsonResponse);

        setState(() {
          tumYemekler = result.yemekler ?? [];
          filteredYemekler = tumYemekler; // Başlangıçta tüm yemekler gösterilir
        });

        // Veriyi kontrol etmek için print komutları
        for (var yemek in tumYemekler) {
          print('Yemek ID: ${yemek.yemekId}, Yemek Adı: ${yemek.yemekAdi}, Fiyat: ${yemek.yemekFiyat}');
        }
        print('Success: ${result.success}');
      } else {
        print('İstek başarısız: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void sepeteEkle(Yemekler yemek) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItem(yemek);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.selago,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: AppColor.selago,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColor.selago,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
                  child: Column(
                    children: [
                      Container(
                        height: 54.h,
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.white,
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(83, 94, 126, 1),
                              fontFamily: 'Poppins',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            hintText: 'Ara',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(205, 210, 227, 1),
                              fontFamily: 'Poppins',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: filteredYemekler.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 0,
                  ),
                  itemBuilder: (context, index) {
                    final yemek = filteredYemekler[index];
                    String imageUrl = 'http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemekResimAdi}';
                    return GestureDetector(
                      onTap: () {
                        context.router.push(HomeDetailRoute());
                      },
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            _boxShadowContainer(),
                            _favoriteIcon(yemek: yemek),
                            _networkImage(imageUrl: imageUrl),
                            Positioned(
                              bottom: 0.h,
                              right: 5.h,
                              child: SizedBox(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          sepeteEkle(yemek);
                                        },
                                        icon: Icon(Icons.add_shopping_cart))
                                  ],
                                ),
                              ),
                            ),
                            _productName(yemek: yemek),
                            _productPrice(yemek: yemek),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _productPrice extends StatelessWidget {
  const _productPrice({
    super.key,
    required this.yemek,
  });

  final Yemekler yemek;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15.h,
      left: 25.h,
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AutoSizeText('${yemek.yemekFiyat ?? 'Bilgi Yok'} ₺'),
          ],
        ),
      ),
    );
  }
}

class _productName extends StatelessWidget {
  const _productName({
    super.key,
    required this.yemek,
  });

  final Yemekler yemek;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      left: 15,
      child: Column(
        children: [
          Container(
            child: SizedBox(
              child: Row(
                children: [
                  AutoSizeText(
                    yemek.yemekAdi ?? 'Bilgi Yok',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _networkImage extends StatelessWidget {
  const _networkImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 150.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          scale: 1,
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _favoriteIcon extends StatelessWidget {
  const _favoriteIcon({
    super.key,
    required this.yemek,
  });

  final Yemekler yemek;

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final isFavorite = favoriteProvider.isFavorite(yemek);

    return Positioned(
      top: 0.h,
      right: 5.h,
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                if (isFavorite) {
                  favoriteProvider.removeFavorite(yemek);
                } else {
                  favoriteProvider.addFavorite(yemek);
                }
              },
              icon: Icon(
                color: Colors.red,
                isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _boxShadowContainer extends StatelessWidget {
  const _boxShadowContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: 200.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10.0,
            spreadRadius: -5,
            offset: const Offset(0.0, 5.0),
          ),
        ],
      ),
    );
  }
}
