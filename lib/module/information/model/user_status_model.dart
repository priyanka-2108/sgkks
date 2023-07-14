import 'package:sgkks/utils/my_enum.dart';

class UserStatusModel {
  final String statusAsset;
  final String statusString;
  final String selectedStatusAsset;

  final UserStatus userStatus;
  UserStatusModel({
    required this.statusAsset,
    required this.statusString,
    required this.userStatus,
    required this.selectedStatusAsset,
  });
}
