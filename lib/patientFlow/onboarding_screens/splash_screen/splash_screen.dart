// import 'package:flutter/material.dart';
// import 'package:doctari/core/app_export.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key})
//       : super(
//           key: key,
//         );

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SizedBox(
//           width: 375.h,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CustomImageView(
//                 imagePath: ImageConstant.imgDoctariIcon41,
//                 height: 99.v,
//                 width: 100.h,
//               ),
//               SizedBox(height: 19.v),
//               Text(
//                 "Doctari",
//                 style: CustomTextStyles.headlineLargeIndigo90001,
//               ),
//               SizedBox(height: 5.v),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:doctari/patientFlow/onboarding_screens/onboarding_screen_one_screen/onboarding_screen_one_screen.dart';
import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: ((context) => OnboardingScreenOneScreen()
              )
          )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 375.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgDoctariIcon41,
                height: 130.v,
                width: 130.h,
              ),
              SizedBox(height: 19.v),
              Text(
                "Doctari",
                style: TextStyle(
                  color: appTheme.indigo90001,
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
