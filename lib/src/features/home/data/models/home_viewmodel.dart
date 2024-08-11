import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductContanier extends StatelessWidget {
  const ProductContanier({
    Key? key,
    required this.yemek_id,
    required this.yemek_adi,
    required this.yemek_resim_adi,
    required this.yemek_fiyat,
  }) : super(key: key);

  final int yemek_id;
  final String yemek_adi;
  final String yemek_resim_adi;
  final int yemek_fiyat;

  factory ProductContanier.fromJson(Map<String, dynamic> json) {
    return ProductContanier(
      yemek_id: json['yemek_id'] as int,
      yemek_adi: json['yemek_adi'] as String,
      yemek_resim_adi: json['yemek_resim_adi'] as String,
      yemek_fiyat: json['yemek_fiyat'] as int,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
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
                  ),
                  Positioned(
                    top: 0.h,
                    right: 5.h,
                    child: SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border_outlined),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 150.h,
                    width: 150.h,
                    child: Placeholder(),
                  ),
                  Positioned(
                    bottom: 0.h,
                    right: 5.h,
                    child: SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.add_outlined))
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15.h,
                    left: 70.h,
                    child: SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AutoSizeText('Ayran'),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15.h,
                    left: 25.h,
                    child: SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AutoSizeText('3 ₺'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TumYemeklerCevap {
  List<ProductContanier> productContainer;
  int success;
  TumYemeklerCevap({
    required this.productContainer,
    required this.success,
  });

  factory TumYemeklerCevap.fromJson(Map<String, dynamic> json) {
    var jsonArry = json['yemekler'] as List;
    int success = json['success'] as int;

    var yemekler = jsonArry.map((jsonArryNesnesi) => ProductContanier.fromJson(jsonArryNesnesi)).toList();
    return TumYemeklerCevap(productContainer: yemekler, success: success);
  }
}
