import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:ort_mobile/core/local_storages/utils/keys.dart';
import 'package:ort_mobile/core/utils/constants/keys.dart';
import 'package:ort_mobile/features/onboarding/view/onboarding_screen.dart';
import 'package:ort_mobile/features/sign_up/phone_input/view/phone_input_screen.dart';
import 'app_navigation.dart';

class AppRoutes {
  static GoRouter getGoRouter() => GoRouter(
        redirect: (context, state) async {
          var settingsBox = await Hive.box<dynamic>(preferencesBox);
          bool firstTime =
              settingsBox.get(preferencesKey, defaultValue: true) as bool;
          final phone =
              settingsBox.get(phoneNumber, defaultValue: '') as String;
          if (firstTime) {
            return AppNavigation.onboarding_screen;
          } else if (phone.isEmpty) {
            return AppNavigation.phone_input_screen;
          } else {
            return '/details';
          }
        },
        routes: [
          GoRoute(
            path: AppNavigation.onboarding_screen,
            builder: (context, state) {
              return OnboardingScreen();
            },
          ),
          GoRoute(
            path: AppNavigation.phone_input_screen,
            builder: (context, state) {
              return PhoneInputScreen();
            },
          ),
          GoRoute(
            path: '/details',
            builder: (context, state) {
              return Container(
                child: Text('details'),
              );
            },
          ),
        ],
      );
}
