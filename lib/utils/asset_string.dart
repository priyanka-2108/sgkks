import 'package:flutter/material.dart';
import 'package:sgkks/utils/theme/theme_manager.dart';

class AssetString {
  //splash
  static String logo = "assets/images/sgkks_logo.png";
  static String splashBackGround = 'assets/backGrounds/splash_bg.png';
  //onboarding
  // static String onboardingBackGround =
  //     ThemeManager.instance.themeMode == ThemeMode.light
  //         ? 'assets/backGrounds/onboarding_bg.png'
  //         : 'assets/backGrounds/dark_bg/dark_bg.png';
  static String onboardingCircle = 'assets/images/onboarding_circle.png';
  static String onboardingAsset = 'assets/images/onboarding_asset1.png';
  //login
  static String loginAsset = 'assets/images/login_asset.png';
  static String userIcon = 'assets/images/user_icon.png';
  //verification
  static String verificationAsset = 'assets/images/verification_asset.png';
  //Residential Information
  static String locationIcon = 'assets/images/location_icon.png';
  // static String cameraIcon = ThemeManager.instance.themeMode == ThemeMode.light
  //     ? 'assets/images/camera_icon.png'
  //     : 'assets/images/dark_images/camera_dark.png';
  //choose status
  // static String statusBackGroundImage =
  //     ThemeManager.instance.themeMode == ThemeMode.light
  //         ? 'assets/images/status_bg.png'
  //         : 'assets/images/dark_images/statusBackGroundImage_dark.png';
  static String singleIcon = 'assets/images/single_icon.png';
  static String marriedIcon = 'assets/images/married_icon.png';
  static String withKidsIcon =
      ThemeManager.instance.themeMode == ThemeMode.light
          ? 'assets/images/with_kids_icon.png'
          : 'assets/images/dark_images/withKidsIcon_dark.png';
  static String singleWithKidsIcon = 'assets/images/single_with_kids_icon.png';
  static String selectedStatusBackGroundImage =
      "assets/images/selected_status_bg.png";
  static String selectedSingleIcon = 'assets/images/selected_single_icon.png';
  static String selectedMarriedIcon = 'assets/images/selected_married_icon.png';
  static String selectedWithKidsIcon =
      'assets/images/selected_with_kids_icon.png';
  static String selectedSingleWithKidsIcon =
      'assets/images/selected_single_with_kids_icon.png';
  static String cameraWithOutIcon = 'assets/images/camera.png';
  static String cakeIcon = 'assets/images/cake_icon.png';
  static String dropDownIcon = 'assets/images/drop_down_icon.png';
  static String upWordIcon = 'assets/images/up_word_icon.png';
  static String peopleIcon = 'assets/images/people.png';
  static String awardIcon = 'assets/images/award.png';
  static String editIcon = 'assets/images/edit_icon.png';
  static String deleteIcon = 'assets/images/trash_icon.png';
  static String femaleIcon = 'assets/images/female_icon.svg';
  static String maleIcon = 'assets/images/male_icon.svg';
  static String emailIcon = 'assets/images/email_icon.svg';
  static String profileAsset = 'assets/images/profile_asset.png';
  static String phoneIcon = 'assets/images/phone_icon.svg';

  //Home
  static String homeTitle = 'assets/images/sgkks_text.png';
  static String logoApp = 'assets/images/app_logo.png';
  static String favoriteIcon = 'assets/images/favorite_icon.png';
  static String notificationIcon = 'assets/images/notification_icon.png';

  static String compileImage = 'assets/images/compile_image.png';
  static String sliderImage1 = 'assets/images/slider_image1.png';
  static String nearByYouImage = 'assets/images/near_by_you_image.png';
  static String userImage1 = 'assets/images/user_image1.png';
  static String userImage5 = 'assets/images/user_image5.png';
  static String userImage3 = 'assets/images/user_image3.png';
  static String userImage4 = 'assets/images/user_image4.png';
  static String homeImage = 'assets/images/home_image.png';
  static String announcementImage = 'assets/images/announcement_image.png';
  static String settingImage = 'assets/images/setting_image.png';
  static String favoriteImage = 'assets/images/favorite.png';
  static String locationImage = 'assets/images/location_image.png';
  static String peopleImage = 'assets/images/people_image.png';
  static String filterImage = 'assets/images/filter_image.png';

  //announcement
  static String userDetail1 = 'assets/images/user_detail1.png';
  static String userProfileImage = 'assets/images/user_profile_image.png';
  static String clockImage = 'assets/images/clock.png';
  static String calenderImage = 'assets/images/calendar.png';
  static String userDetail2 = 'assets/images/user_detail2.png';

  //add Announcement
  static String addImage1 = 'assets/images/add_image1.png';
  static String addImage2 = 'assets/images/add_image2.png';
  static String closeIcon = 'assets/images/close_icon.png';

  //setting
  static String notificationImage = 'assets/images/notification.png';
  static String heartIcon = 'assets/images/heart.png';
  static String boxImage = 'assets/images/box_image.png';
  static String userImage6 = 'assets/images/user_image6.png';
  static String aboutIcon = 'assets/images/about_icon.png';
  static String privacyIcon = 'assets/images/privacy.png';
  static String faqIcon = 'assets/images/faq_icon.png';
  static String logoutIcon = 'assets/images/logout.png';
  static String trashIcon = 'assets/images/trash.png';
  static String modeIcon = 'assets/images/mode_icon.png';
  static String languageIcon = 'assets/images/language_icon.png';

  // logout
  static String logoutImage = 'assets/images/logout_image.png';
  static String deleteImage = 'assets/images/delete_image.png';
  static String residentialIcon = 'assets/images/residential_icon.png';
  static String businessIcon = 'assets/images/business_icon.png';
  static String statusIcon = 'assets/images/status_icon.png';

  //filter
  static String searchIcon = 'assets/images/search_image.png';

  //manage Profile
  static String editImage = 'assets/images/edit_image.png';

  //favorite Profile
  static String userFace = 'assets/images/user_face.png';

  static String simpleLogo = 'assets/images/simple_logo.png';
}
extension LightThemeEx on ThemeData {
  String get onboardingBackGround {
    return ThemeManager.instance.themeMode == ThemeMode.light
        ? 'assets/backGrounds/onboarding_bg.png'
        : 'assets/backGrounds/dark_bg/dark_bg.png';
  }

  String get cameraIcon {
    return ThemeManager.instance.themeMode == ThemeMode.light
        ? 'assets/images/camera_icon.png'
        : 'assets/images/dark_images/camera_dark.png';
  }

  String get statusBackGroundImage {
    return ThemeManager.instance.themeMode == ThemeMode.light
        ? 'assets/images/status_bg.png'
        : 'assets/images/dark_images/statusBackGroundImage_dark.png';
  }

  String get withKidsIcon {
    return ThemeManager.instance.themeMode == ThemeMode.light
        ? 'assets/images/with_kids_icon.png'
        : 'assets/images/dark_images/withKidsIcon_dark.png';
  }
}


