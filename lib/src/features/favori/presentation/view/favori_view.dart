import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/src/core/functions/color_ext.dart';
import 'package:food_app/src/features/favori/presentation/provider/favorite_provider.dart';
import 'package:food_app/src/features/home/presentation/provider/provieder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favoriteYemekler = favoriteProvider.favorites;

    final _cardProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.selago,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: const Text('Favoriler'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: favoriteProvider.favorites.isEmpty
            ? Center(
                child: AutoSizeText(
                'Favori Alanınız Boş',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 21.sp,
                ),
              ))
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: favoriteProvider.favorites.length,
                      itemBuilder: (context, index) {
                        final item = favoriteProvider.favorites[index];
                        String imageUrl = 'http://kasimadalan.pe.hu/yemekler/resimler/${item.yemekResimAdi}';

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 5.0,
                          ),
                          child: Card(
                            color: AppColor.whiteColor,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Center(
                                      child: Container(
                                        height: 150.h,
                                        width: 150.h,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            scale: 1,
                                            image: NetworkImage(imageUrl),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Center(
                                          child: AutoSizeText(
                                            item.yemekAdi ?? 'Bilinmeyen Yemek',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20.h),
                                        AutoSizeText(
                                          '${item.yemekFiyat ?? 'Bilinmeyen Fiyat'} ₺',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            favoriteProvider.removeFavorite(item);
                                          },
                                          icon: Icon(Icons.delete),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            _cardProvider.addItem(item);
                                          },
                                          icon: Icon(Icons.add_shopping_cart),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Card(
                    elevation: 20,
                    margin: EdgeInsets.zero,
                    child: Container(
                      height: 100.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            topLeft: Radius.circular(16),
                          )),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0).h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AutoSizeText('Ödenecek Tutar (KDV Dahil)'),
                                AutoSizeText(
                                  '${favoriteProvider.getTotalPrice().toString()} ₺ ',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.royalBlue,
                            ),
                            onPressed: () {},
                            child: AutoSizeText(
                              'Sepete git',
                              style: GoogleFonts.montserrat(
                                color: AppColor.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
