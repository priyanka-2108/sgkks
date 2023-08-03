import 'package:flutter/material.dart';
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
import '../module/about/about.dart';
import '../module/announcement/add_Announcement.dart';
import '../module/editManageProfile/edit_manage_profile.dart';
import '../module/faq/faq.dart';
import '../module/home/view/home_page.dart';
import '../module/information/components/business_information_widget.dart';
import '../module/information/components/choose_your_status_widget.dart';
import '../module/information/components/sign_up_widget.dart';
import '../module/notification/notification.dart';
import '../module/samaj_bhavan/samaj_bhavan.dart';
import '../module/setting/setting.dart';
import '../module/sign_up/register.dart';

class Routes {
  static final data = {
    "/login": (context) =>  LoginScreen(loginData: ModalRoute.of(context)?.settings.arguments as List,),
    "/signUp": (context) => const SignUpWidget(),
    "/splash": (context) => SplashScreen(),
    "/home": (context) =>  HomePage(),
    "/selectLanguage": (context) => const SelectLanguageScreen(),
    "/onboarding": (context) =>  const OnboardingScreen(
      // selectLang: ModalRoute.of(context)?.settings.arguments as Object,
    ),
    "/main": (context) => const MainScreen(),
    "/verification": (context) =>  VerificationScreen(type: ModalRoute.of(context)?.settings.arguments as String,),
    "/information": (context) => const SetInformationScreen(),
    "/filter": (context) => const FilterPage(),
    "/announcement": (context) => const AnnouncementScreen(),
    "/setting": (context) =>  const SettingScreen(),
    "/samajBhavanScreen": (context) =>  const SamajBhavanScreen(),
    "/addAnnouncement": (context) => const AddAnnouncement(),
    "/announcementDetail": (context) => const AnnouncementDetailScreen(),
    "/manageProfile": (context) => const ManageProfileScreen(),
    "/notification": (context) => const NotificationScreen(),
    "/about": (context) => const AboutScreen(),
    "/faq": (context) => const FaqScreen(),
    "/BusinessInformation": (context) => const BusinessInformationWidget(),
    "/ChooseYourStatus": (context) => const ChooseYourStatusWidget(),
    "/editManageProfile": (context) =>  EditManageProfile(routeName: ModalRoute.of(context)?.settings.arguments as String,),
    "/register": (context) =>  Registration(),
  };
}
