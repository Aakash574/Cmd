import 'package:tuktuk/src/presentation/view/Profile/ProfileSection/Aboutus/about_us.dart';
import 'package:tuktuk/src/presentation/view/Profile/ProfileSection/Aboutus/contact_us.dart';
import 'package:tuktuk/src/presentation/view/Profile/ProfileSection/Aboutus/privacy_policy.dart';
import 'package:tuktuk/src/presentation/view/Profile/ProfileSection/Categories/feedback.dart';
import 'package:tuktuk/src/presentation/view/Profile/ProfileSection/Categories/location.dart';
import 'package:tuktuk/src/presentation/view/Profile/ProfileSection/Categories/notification.dart';
import 'package:tuktuk/src/presentation/view/Profile/ProfileSection/General/edit_profile.dart';
import 'package:tuktuk/src/presentation/view/Profile/profile.dart';
import 'package:tuktuk/src/presentation/view/onBoarding/splash_screen.dart';
import 'package:tuktuk/src/presentation/view/onBoarding/welcome_screen.dart';
import 'package:tuktuk/src/presentation/view/user/add_details.dart';
import 'package:tuktuk/src/presentation/view/user/location_premission.dart';
import 'package:tuktuk/src/presentation/view/user/login.dart';
import 'package:tuktuk/src/presentation/view/user/verify_otp.dart';
import 'package:tuktuk/tuktuk.dart';

final routes = {
  '/': (context) => const LoadingScreen(),
  '/tuktuk': (context) => const TukTuk(),
  '/welcome': (context) => const WelcomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/verifyOtp': (context) => const OtpScreen(),
  '/addDetails': (context) => const AddDetails(),
  '/locationPermission': (context) => const LocationPermission(),

  // Profile ---------->
  '/profile': (context) => const Profile(),
  '/aboutUs': (context) => const AboutUs(),
  '/contactUs': (context) => const ContactUs(),
  '/privacyPolicy': (context) => const PrivacyPolicy(),
  '/feedbackScreen': (context) => const FeedbackScreen(),
  '/locationScreen': (context) => const LocationScreen(),
  '/notificationScreen': (context) => const NotificationScreen(),
  '/editProfile': (context) => const EditProfile(),
};
