import 'package:sgkks/module/announcement/announcement.dart';
import 'package:sgkks/module/announcement/announcement_detail.dart';
import 'package:sgkks/module/filter/filter.dart';
import 'package:sgkks/module/home/view/main_screen.dart';
import 'package:sgkks/module/information/view/set_information_screen.dart';
import 'package:sgkks/module/language/view/select_language.dart';
import 'package:sgkks/module/login/view/login_screen.dart';
import 'package:sgkks/module/onboarding/view/onboarding_screen.dart';
import 'package:sgkks/module/setting/manage_profile.dart';
import 'package:sgkks/module/splash/view/splash_screen.dart';
import 'package:sgkks/module/verification/view/verification_screen.dart';
import '../module/announcement/add_Announcement.dart';
import '../module/home/view/home_page.dart';
import '../module/information/components/sign_up_widget.dart';
import '../module/setting/setting.dart';

class Routes {
  static final data = {
    "/login": (context) => const LoginScreen(),
    "/signUp": (context) => const SignUpWidget(),
    "/splash": (context) => SplashScreen(),
    "/home": (context) => const HomePage(),
    "/selectLanguage": (context) => const SelectLanguageScreen(),
    "/onboarding": (context) => const OnboardingScreen(),
    "/main": (context) => const MainScreen(),
    "/verification": (context) => const VerificationScreen(),
    "/information": (context) => SetInformationScreen(),
    "/filter": (context) => const FilterPage(),
    "/announcement": (context) => const AnnouncementScreen(),
    "/setting": (context) =>  SettingScreen(),
    "/addAnnouncement": (context) => const AddAnnouncement(),
    "/announcementDetail": (context) => const AnnouncementDetailScreen(),
    "/manageProfile": (context) => const ManageProfileScreen(),
  };
}
