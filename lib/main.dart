import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/src/core/provider/provider.dart';
import 'package:food_app/src/core/constants/app_constants.dart';
import 'package:food_app/src/core/functions/is_mobile.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/core/router/router.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("myBox");
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((value) => runApp(Zone()));
  runApp(Zone());
}

class Zone extends StatelessWidget {
  Zone({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return AppBlocProviders(
      child: ScreenUtilInit(
        designSize: IsItPhone.getDeviceType() ? const Size(375, 812) : const Size(768, 1024),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            theme: ThemeData(fontFamily: "Poppins"),
            builder: EasyLoading.init(),
            supportedLocales: const [
              Locale('tr')
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            title: AppConstants.title,
            routerConfig: _appRouter.config(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
