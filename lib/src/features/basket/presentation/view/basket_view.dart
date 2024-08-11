import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/src/core/functions/app_dynamic_textstyle.dart';
import 'package:food_app/src/core/functions/app_keys.dart';
import 'package:food_app/src/core/functions/color_ext.dart';
import 'package:food_app/src/features/home/presentation/provider/provieder.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: AppColor.selago,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: true,
        title: const AutoSizeText(AppKeys.sepetim),
      ),
      body: SafeArea(
        child: cartProvider.items.isEmpty
            ? Center(
                child: CustomTextStyle(
                  color: AppColor.blackColor,
                  text: AppKeys.sepetimBos,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: cartProvider.items.toSet().length,
                      itemBuilder: (context, index) {
                        final item = cartProvider.items.toSet().elementAt(index);
                        final quantity = cartProvider.getItemQuantity(item);
                        final itemTotal = cartProvider.itemTotalPrice(item); // Yeni metod kullanımı

                        String imageUrl = 'http://kasimadalan.pe.hu/yemekler/resimler/${item.yemekResimAdi}';
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: .0,
                          ).w,
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
                                            item.yemekAdi ?? AppKeys.bilinmeyenYemek,
                                            style: GoogleFonts.poppins(
                                              fontSize: 18.sp,
                                              color: AppColor.blackColor,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        AutoSizeText(
                                          '${itemTotal.toStringAsFixed(2)} ${AppKeys.tlIconu}',
                                          style: GoogleFonts.poppins(
                                            fontSize: 18.sp,
                                            color: AppColor.blackColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            cartProvider.removeItem(item);
                                          },
                                          icon: Icon(Icons.remove),
                                        ),
                                        Text('$quantity'),
                                        IconButton(
                                          onPressed: () {
                                            cartProvider.addItem(item);
                                          },
                                          icon: Icon(Icons.add),
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
                                AutoSizeText(AppKeys.odenecekTutarKdvDahil),
                                AutoSizeText(
                                  '${cartProvider.getTotalPrice().toString()} ${AppKeys.tlIconu} ',
                                  style: GoogleFonts.poppins(
                                    fontSize: 20.sp,
                                    color: AppColor.blackColor,
                                    fontWeight: FontWeight.w500,
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
                              AppKeys.alisverisiTamamla,
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
