import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:sgkks/module/home/view/home_page.dart';
import 'package:sgkks/module/information/view/set_information_screen.dart';
import 'package:sgkks/module/splash/view/splash_screen.dart';
import 'package:sgkks/routes/routes.dart';
import 'package:sgkks/shared_preference/shared_preference.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/utils/size_constant.dart';
import 'package:sgkks/utils/theme/theme_manager.dart';
import 'package:sgkks/utils/theme/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'localString/local_string.dart';
import 'localString/update_language.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MySharedPreference.prefs = await SharedPreferences.getInstance();
  ThemeManager.instance.storeToggleTheme();
  MySharedPreference.storeMethod();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    ThemeManager.instance.addListener(themeListener);

    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    ThemeManager.instance.removeListener(themeListener);
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(SizeConstant.kScreenWidth, SizeConstant.kScreenHight),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return ChangeNotifierProvider<ThemeManager>(
            create: (_) => ThemeManager(),
            child: GetMaterialApp(
                scrollBehavior: MyBehavior(),
                title: "appName".tr,
                debugShowCheckedModeBanner: false,
                theme: Themes.light,
                darkTheme: Themes.dark,
                themeMode: ThemeManager.instance.themeMode,
                translations: LocaleString(),
                locale: MySharedPreference.localeTranslation,
                // const Locale('gu','IN'),
                // themeMode: ,
                // ThemeManager.instance.themeMode,

                home:
                    // HomePage(),
                    SplashScreen(),
                routes: Routes.data),
          );
        });
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
