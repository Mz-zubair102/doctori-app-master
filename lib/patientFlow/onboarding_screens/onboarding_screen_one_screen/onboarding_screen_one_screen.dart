import 'package:doctari/patientFlow/onboarding_screens/onboarding_screen_two_screen/onboarding_screen_two_screen.dart';
import 'package:doctari/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';

class OnboardingScreenOneScreen extends StatelessWidget {
  const OnboardingScreenOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          // width: 375.h,
          child: Column(
            children: [
              _buildImage(context),
              SizedBox(height: 83.v),
              Text(
                "Find Trusted Doctors",
                style: theme.textTheme.headlineMedium,
              ),
              SizedBox(height: 8.v),
              Container(
                width: 275.h,
                margin: EdgeInsets.only(
                  left: 50.h,
                  right: 49.h,
                ),
                child: Text(
                  "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMediumBluegray50014.copyWith(
                    height: 1.66,
                  ),
                ),
              ),
              SizedBox(height: 48.v),
              CustomElevatedButton(
                text: "Get Started",
                onPressed: () {
                  print("on the first onbarding screen");
                  // Navigator.pushReplacementNamed(
                  //     context, AppRoutes.onboardingScreenTwoScreen);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => OnboardingScreenTwoScreen())));
                },
                margin: EdgeInsets.symmetric(horizontal: 40.h),
                buttonStyle: CustomButtonStyles.fillPrimary,
                buttonTextStyle:
                    CustomTextStyles.titleMediumOnErrorContainerSemiBold18,
              ),
              SizedBox(height: 16.v),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 164.h),
                  child: Text(
                    "Skip",
                    style: CustomTextStyles.bodyMediumBluegray50014_1,
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildImage(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 400.v,
        width: 356.h,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgEllipse153,
              height: 295.v,
              width: 238.h,
              alignment: Alignment.topLeft,
            ),
            CustomImageView(
              imagePath: ImageConstant.imgEllipse154,
              height: 336.adaptSize,
              width: 336.adaptSize,
              radius: BorderRadius.circular(
                168.h,
              ),
              alignment: Alignment.bottomRight,
            ),
          ],
        ),
      ),
    );
  }
}
