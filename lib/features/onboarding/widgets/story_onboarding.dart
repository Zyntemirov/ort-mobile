import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:ort_mobile/app/routes/app_navigation.dart';
// import 'package:ort_mobile/core/local_storages/utils/keys.dart';
import 'package:ort_mobile/shared/utils/colors.dart';
import 'package:hive/hive.dart';

class StoryOnboarding extends StatefulWidget {
  const StoryOnboarding({
    required this.pages,
    this.pageDuration = const Duration(seconds: 5),
  });

  final List<Widget> pages;
  final Duration pageDuration;

  @override
  _StoryOnboardingState createState() => _StoryOnboardingState();
}

class _StoryOnboardingState extends State<StoryOnboarding> {
  Timer? _timer;
  int _currentPage = 0;
  late PageController _pageController;
  ValueNotifier<double> _progressNotifier = ValueNotifier<double>(0.0);

  void _restartTimer() {
    _timer?.cancel();
    _startTimer();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController()
      ..addListener(() {
        _progressNotifier.value = _pageController.page! % 1;
      });

    _startTimer();
    // checkForFirstTimeOpen();
  }

  // Future<void> checkForFirstTimeOpen() async {
  //   var settingsBox = Hive.box<dynamic>(preferencesBox);
  //   bool firstTime =
  //       settingsBox.get(preferencesKey, defaultValue: true) as bool;

  //   if (firstTime) {
  //     // After that, set 'firstTime' to false, so this block won't run again
  //     await settingsBox.put(preferencesKey, false);
  //     // Delete all secure storage data
  //     await getIt<FlutterSecureStorage>().deleteAll();
  //   }
  // }

  void _startTimer() {
    _timer = Timer.periodic(
        Duration(milliseconds: widget.pageDuration.inMilliseconds ~/ 100),
        (timer) {
      final nextProgressValue = _progressNotifier.value + 0.01;
      if (nextProgressValue >= 1) {
        timer.cancel();
        if (_currentPage <= widget.pages.length - 1) {
          _currentPage++;
          _pageController.animateToPage(_currentPage,
              duration: Duration(milliseconds: 1), curve: Curves.easeInOut);
          _restartTimer();
        }
      } else {
        _progressNotifier.value = nextProgressValue;
      }
    });

    /// Open phone input if onboarding current page == 3
    if (_currentPage == 3) {
      context.go('/details');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _progressNotifier.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onLongPressDown: (details) {
            _timer?.cancel();
          },
          onLongPressUp: _startTimer,
          onTapUp: (details) {
            _startTimer();

            double screenWidth = MediaQuery.of(context).size.width;

            if (details.localPosition.dx < screenWidth / 2) {
              if (_currentPage > 0) {
                _timer?.cancel();

                _currentPage--;
                _pageController.jumpToPage(_currentPage);
                _progressNotifier.value = 0.0;

                _startTimer();
              }
            } else {
              if (_currentPage <= widget.pages.length - 1) {
                _timer?.cancel();

                _currentPage++;
                _pageController.jumpToPage(_currentPage);
                _progressNotifier.value = 0.0;

                _startTimer();
              }
            }

            /// Open phone input if onboarding current page == 3
            if (_currentPage == 3 && context.canPop()) {
              context.go(AppNavigation.phone_input_screen);
            }
          },
          child: Stack(
            children: [
              PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: widget.pages,
              ),
              Positioned(
                top: 20.0,
                left: 10.0,
                right: 10.0,
                child: Row(
                  children: List.generate(
                    widget.pages.length,
                    (index) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: ValueListenableBuilder<double>(
                          valueListenable: _progressNotifier,
                          builder: (context, progress, child) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(3.0),
                              child: LinearProgressIndicator(
                                value: index < _currentPage
                                    ? 1
                                    : (index == _currentPage ? progress : 0),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.white),
                                backgroundColor:
                                    AppColors.white.withOpacity(0.31),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
