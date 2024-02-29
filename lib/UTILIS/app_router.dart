import 'package:flutter/material.dart';
import 'package:inkozi/screens/LAWYER/AUTH/REGISTER/V/lawyer_register.dart';
import 'package:inkozi/screens/LAWYER/HOME/CHAT/V/lawyer_chat.dart';
import 'package:inkozi/screens/LAWYER/HOME/EDITPROFILE/V/edit_profile.dart';
import 'package:inkozi/screens/SPLASH/V/splash.dart';
import 'package:inkozi/screens/USER/AUTH/REGISTER/V/registration_complete.dart';
import 'package:inkozi/screens/USER/HOME/CHAT/V/all_chat%20_users.dart';
import 'package:inkozi/screens/WELCOME/Welcomes.dart';
import 'package:inkozi/screens/message/MsgApproval.dart';
import 'package:inkozi/screens/USER/AUTH/LOGIN/V/login.dart';
import '../screens/question/QuestionSend.dart';
import '../screens/screens.dart';

import 'package:inkozi/screens/message/testChat_view.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings setting) {
    print('This is route: ${setting.name}');

    switch (setting.name) {
      case InitialScreen.routeName:
        return InitialScreen.route();
      case '/':
        return MyCustomSplashScreen.route();

      // case PhoneAuth.routeName:
      //   return PhoneAuth.route();

      case RegisterLawyer.routeName:
        return RegisterLawyer.route();
      case LawyerCHat.routeName:
        return LawyerCHat.route();

      // case OtpInputPage.routeName:
      //   return OtpInputPage.route();

      case LogInPage.routeName:
        return LogInPage.route();

      case OtpLogin.routeName:
        return OtpLogin.route();

      case LogInLawyer.routeName:
        return LogInLawyer.route();

      // case WelcomePage.routeName:
      //   return WelcomePage.route();

      case Welcomes.routeName:
        return Welcomes.route();

      case ProvidersThanks.routeName:
        return ProvidersThanks.route();

      case ConsumersThanks.routeName:
        return ConsumersThanks.route();

      case IntroToProviders.routeName:
        return IntroToProviders.route();

      case AddPhoto.routeName:
        return AddPhoto.route();

      case LocateLawyer.routeName:
        return LocateLawyer.route();

      // case SearchSelection.routeName:
      //   return SearchSelection.route();

      case FindLawyer.routeName:
        return FindLawyer.route();

      case LawyerBySpecialSearch.routeName:
        return LawyerBySpecialSearch.route();

      case FindYourLawyer.routeName:
        return FindYourLawyer.route();

      case RegistrationComplete.routeName:
        return RegistrationComplete.route();

      case MyProfile.routeName:
        return MyProfile.route();

      case LawyerMyProfile.routeName:
        return LawyerMyProfile.route();

      case AskQuestions.routeName:
        return AskQuestions.route();

      case QuestionSend.routeName:
        return QuestionSend.route();

      case MsgApproval.routeName:
        return MsgApproval.route();

      case MsgScreens.routeName:
        return MsgScreens.route();

      case UserAllChats.routeName:
        return UserAllChats.route();
      case EditProfileLAwyer.routeName:
        return EditProfileLAwyer.route();

      case TestChat.routeName:
        return TestChat.route(setting.arguments);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('Error')),
      ),
    );
  }
}
