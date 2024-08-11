import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/src/core/functions/color_ext.dart';
import 'package:food_app/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class BuildLoginForm extends StatelessWidget {
  const BuildLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final toggleProvider = Provider.of<ToggleProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        TextField(
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
        SizedBox(height: 25.h),
        AutoSizeText(
          'Şifreniz',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(83, 94, 126, 1),
          ),
        ),
        SizedBox(height: 10.h),
        TextField(
          obscureText: toggleProvider.isObscure,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.grey,
            ),
            filled: true,
            suffixIcon: IconButton(
              icon: Icon(
                toggleProvider.isObscure ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                toggleProvider.toggleVisibility();
              },
            ),
            fillColor: Colors.white,
            labelStyle: TextStyle(
              color: Color.fromRGBO(83, 94, 126, 1),
              fontFamily: 'Poppins',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            hintText: '***************',
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
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: toggleProvider.isChecked,
                  onChanged: (value) {
                    toggleProvider.toggleCheckbox(value!);
                  },
                ),
                AutoSizeText(
                  'Beni Hatırla',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color.fromRGBO(83, 94, 126, 1),
                  ),
                ),
              ],
            ),
            AutoSizeText(
              'Şifremi Unuttum',
              style: TextStyle(
                fontSize: 14.sp,
                color: Color.fromRGBO(83, 94, 126, 1),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Center(
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.royalBlue,
              ),
              onPressed: () {},
              child: AutoSizeText('Giriş Yap', style: TextStyle(color: AppColor.whiteColor)),
            ),
          ),
        ),
      ],
    );
  }
}
