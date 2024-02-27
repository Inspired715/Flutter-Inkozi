import 'package:inkozi/screens/USER/AUTH/LOGIN/M/model.dart';
import 'package:inkozi/screens/LAWYER/AUTH/LOGIN/M/model.dart';

class StaticValues {
  static UserInfo? userInfo;
  static bool logginedChecker = false;
  static String? tokan;
  static String? phone;
  static LawyerInfo? lawyerInfo;
  static bool? isuser;
  static String baseURL = "https://www.inkozi.com/api/01/";
  static const user_registration = "01/user_registration";
  static const editprofile = "update_users";
  static const getcategories = "categories";
  static const search_category_lawyers =
      "search_category_lawyers?INKOZI-API-KEY=MG5tj4wNbrb48yFD&category_id=";
}
