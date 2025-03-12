import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/routes_manager.dart';
import 'package:evently_app/core/services/localStorage/local_storage_key.dart';
import 'package:evently_app/core/services/localStorage/local_storage_service.dart';
import 'package:evently_app/presentation/screens/onboarding/widgets/language_switcher.dart';
import 'package:evently_app/presentation/screens/onboarding/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../core/resources/app_colors.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
          fontFamily: "inter"),
      bodyTextStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, fontFamily: "inter"),
      //bodyPadding: EdgeInsets.fromLTRB(16.0, 16, 16.0, 16.0),
      pageColor: Colors.white,
      pageMargin: EdgeInsets.only(top: 120),
      bodyFlex: 1,
      footerFlex: 1,

    );
    return IntroductionScreen(
      //key: introKey,
      globalBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      allowImplicitScrolling: false,
      showDoneButton: true,
      showNextButton: true,
      //showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      //curve: Curves.fastLinearToSlowEaseIn,
      //controlsMargin: const EdgeInsets.all(16),
      //controlsPadding: kIsWeb
      //? const EdgeInsets.all(12.0)
      //: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(8.0, 8.0),
        color: AppColors.darkGray,
        activeSize: Size(20.0, 8.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),

      globalFooter: Align(
        alignment: Alignment.center,
          child: SafeArea(
            minimum: EdgeInsets.only(bottom: 20,right: 20,left: 20),
            top: false,
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, RoutesManager.login);
                    LocalStorageService.setBool(LocalStorageKeys.isFirstTimeRun, false);
                  }, child: const Text(
                'Let\'s Start',
              ))
          ))),
      globalHeader: Align(
        alignment: Alignment.center,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Image.asset(AssetsManager.onboardingHeader),
          ),
        ),
      ),

      pages: [
        PageViewModel(
            decoration: pageDecoration,
            title: "Personalize Your Experience",
            image: SvgPicture.asset(AssetsManager.onboarding_1),
            body: "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
            footer: Column(
              spacing: 16,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "Language",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    LanguageSwitcher(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Theme",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    ThemeSwitcher(),
                  ],
                ),
              ],
            )),
        PageViewModel(
          decoration: pageDecoration,
          title: "Find Events That Inspire You",
          image: SvgPicture.asset(AssetsManager.onboarding_2),
          body: "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
          footer: Text("")
        ),
        PageViewModel(
          decoration: pageDecoration,
          title: "Effortless Event Planning",
          image: SvgPicture.asset(AssetsManager.onboarding_3),
          body:
              "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
        ),
        PageViewModel(
          decoration: pageDecoration,
          title: "Connect with Friends & Share Moments",
          image: SvgPicture.asset(AssetsManager.onboarding_4),
          body:
              "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
        ),
      ],

      onDone: (){},
      onSkip: () => {}, // You can override onSkip callback
    );
  }
}

// Widget setupScreen() {
//   return Column(
//     children: [
//       ToggleButtons(isSelected: [true,true], children: [
//         SvgPicture.asset(AssetsManager.ic_eg),
//         SvgPicture.asset(AssetsManager.ic_lr)
//       ]),
//     ],
//   );
// }
