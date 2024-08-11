import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/src/core/functions/color_ext.dart';
import 'package:food_app/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:food_app/src/features/profile/presentation/widget/login_view.dart';
import 'package:food_app/src/features/profile/presentation/widget/register_view.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final toggleProvider = Provider.of<ToggleProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.selago,
      appBar: AppBar(
        backgroundColor: AppColor.selago,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ToggleSwitch(
                  minWidth: 300.0,
                  initialLabelIndex: toggleProvider.isLogin ? 0 : 1,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: [
                    'Login',
                    'Register'
                  ],
                  icons: [
                    FontAwesomeIcons.rightToBracket,
                    FontAwesomeIcons.userPlus,
                  ],
                  activeBgColors: [
                    [
                      AppColor.comet
                    ],
                    [
                      AppColor.comet
                    ]
                  ],
                  onToggle: (index) {
                    if (index == 0) {
                      toggleProvider.setLogin(true); // Login sayfası
                    } else {
                      toggleProvider.setLogin(false); // Register sayfası
                    }
                  },
                ),
              ),
              SizedBox(height: 10.h),
              toggleProvider.isLogin ? BuildLoginForm() : BuildRegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
