import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/src/core/functions/color_ext.dart';
import 'package:food_app/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class BuildRegisterForm extends StatelessWidget {
  const BuildRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final toggleProvider = Provider.of<ToggleProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        AutoSizeText(
          'Adınız',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(83, 94, 126, 1),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 54.h,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(83, 94, 126, 1),
                      fontFamily: 'Poppins',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    hintText: 'Ad',
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
            ),
            SizedBox(width: 10.h),
            Expanded(
              child: Container(
                height: 54.h,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(83, 94, 126, 1),
                      fontFamily: 'Poppins',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    hintText: 'Soyad',
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
            ),
          ],
        ),
        SizedBox(height: 10.h),
        AutoSizeText(
          'E-Posta Adresiniz',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(83, 94, 126, 1),
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          height: 54.h,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.mail,
                color: Colors.grey,
              ),
              filled: true,
              fillColor: Colors.white,
              labelStyle: TextStyle(
                color: Color.fromRGBO(83, 94, 126, 1),
                fontFamily: 'Poppins',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              hintText: 'Ornek@email.com',
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
        SizedBox(height: 10.h),
        AutoSizeText(
          'Şifre Oluştur',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(83, 94, 126, 1),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 54.h,
                child: TextField(
                  obscureText: true, // Şifreyi gizlemek için
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(83, 94, 126, 1),
                      fontFamily: 'Poppins',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    hintText: '********',
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
            ),
            SizedBox(width: 10.h),
            Expanded(
              child: Container(
                height: 54.h,
                child: TextField(
                  obscureText: true, // Şifreyi gizlemek için
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(83, 94, 126, 1),
                      fontFamily: 'Poppins',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    hintText: '********',
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
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Center(
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.royalBlue,
              ),
              onPressed: () {},
              child: AutoSizeText('Kaydol', style: TextStyle(color: AppColor.whiteColor)),
            ),
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: toggleProvider.isChecked,
              onChanged: (value) {
                toggleProvider.toggleCheckbox(value!);
              },
            ),
            Expanded(
              child: AutoSizeText(
                'Gizlilik Sözleşmesi veya Üyelik Sözleşmes\'ni kabul ediyorum.',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Color.fromRGBO(83, 94, 126, 1),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
