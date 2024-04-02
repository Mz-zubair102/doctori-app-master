import 'package:doctari/widgets/custom_outlined_button.dart';
import 'package:doctari/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';

class SignUpAsScreen extends StatelessWidget {
  const SignUpAsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 375.h,
          padding: EdgeInsets.symmetric(
            horizontal: 40.h,
            vertical: 21.v,
          ),
          child: Column(
            children: [
              SizedBox(height: 70.v),
              CustomImageView(
                imagePath: ImageConstant.imgDoctariIcon51,
                height: 54.v,
                width: 214.h,
              ),
              Spacer(
                flex: 36,
              ),
              CustomOutlinedButton(
                height: 54.v,
                text: "Register as a Patient ",
                buttonStyle: CustomButtonStyles.outlineBlueGray,
                buttonTextStyle:
                    CustomTextStyles.titleMediumBluegray500SemiBold,
              ),
              SizedBox(height: 20.v),
              CustomElevatedButton(
                text: "Register as a Doctor",
                buttonStyle: CustomButtonStyles.fillPrimary,
                buttonTextStyle:
                    CustomTextStyles.titleMediumOnErrorContainerSemiBold,
              ),
              Spacer(
                flex: 63,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Have an account? ",
                      style: CustomTextStyles.bodyMediumff000000,
                    ),
                    TextSpan(
                      text: "Log in",
                      style: CustomTextStyles.bodyMediumff004687,
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
