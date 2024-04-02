import 'package:doctari/patientFlow/all_doctors_and_reschedule/all_doctors/BookAppointment.dart';
import 'package:doctari/widgets/app_bar/custom_app_bar.dart';
import 'package:doctari/widgets/app_bar/appbar_leading_image.dart';
import 'package:doctari/widgets/app_bar/appbar_subtitle_seven.dart';
import 'widgets/tabbar_item_widget.dart';
import 'package:doctari/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 3.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCard(context),
              SizedBox(height: 34.v),
              _buildTabBar(context),
              SizedBox(height: 26.v),
              _buildAboutMe(context),
              SizedBox(height: 26.v),
              Padding(
                padding: EdgeInsets.only(left: 24.h),
                child: Text(
                  "Working Time",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 8.v),
              Padding(
                padding: EdgeInsets.only(left: 24.h),
                child: Text(
                  "Monday-Friday, 08.00 AM-18.00 PM",
                  style: CustomTextStyles.bodyMediumGray600,
                ),
              ),
              SizedBox(height: 24.v),
              Padding(
                padding: EdgeInsets.only(left: 24.h),
                child: Text(
                  "Past Consultations",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 10.v),
              Padding(
                padding: EdgeInsets.only(left: 24.h),
                child: Text(
                  "April 3rd, 2023 - 10 AM",
                  style: CustomTextStyles.bodyMediumGray600,
                ),
              ),
              SizedBox(height: 9.v),
              Padding(
                padding: EdgeInsets.only(left: 24.h),
                child: Text(
                  "April 3rd, 2023 - 10 AM",
                  style: CustomTextStyles.bodyMediumGray600,
                ),
              ),
              SizedBox(height: 9.v),
              Padding(
                padding: EdgeInsets.only(left: 24.h),
                child: Text(
                  "April 3rd, 2023 - 10 AM",
                  style: CustomTextStyles.bodyMediumGray600,
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildBookAppointment(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 60,
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
        onTap: (){
          Navigator.pop(context);
        },
        imagePath: ImageConstant.imgArrowDownBlueGray800,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 16.v,
          bottom: 15.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitleSeven(
        text: "Doctor Details",
      ),
    );
  }

  /// Section Widget
  Widget _buildCard(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.h),
        padding: EdgeInsets.all(11.h),
        decoration: AppDecoration.outlineGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgImage1,
              height: 109.adaptSize,
              width: 109.adaptSize,
              radius: BorderRadius.circular(
                12.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 12.h,
                top: 9.v,
                bottom: 9.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. Aaron Smith",
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 9.v),
                  SizedBox(
                    width: 197.h,
                    child: Divider(
                      color: appTheme.gray200,
                    ),
                  ),
                  SizedBox(height: 8.v),
                  Text(
                    "Cardiologist",
                    style: CustomTextStyles.titleSmallBluegray700,
                  ),
                  SizedBox(height: 11.v),
                  Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgSettings,
                        color: Colors.grey,
                        height: 14.adaptSize,
                        width: 14.adaptSize,
                        margin: EdgeInsets.only(bottom: 3.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: Text(
                          "Golden Cardiology Center",
                          style: CustomTextStyles.bodyMediumInterBluegray700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabBar(BuildContext context) {
    return Container(
      height: 102.v,
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      decoration: AppDecoration.fillOnErrorContainer1,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 32.h,
          );
        },
        itemCount: 4,
        itemBuilder: (context, index) {
          return TabbarItemWidget(index: index,);
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildAboutMe(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Appointment Price",
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(height: 8.v),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Online:",
                        style: CustomTextStyles.titleMediumff333333,
                      ),
                      TextSpan(
                          text: " \$",
                          style: TextStyle(color: Color(0xff0EBE7F))),
                      TextSpan(
                        text: "",
                        style: CustomTextStyles.titleMediumff0ebe7f,
                      ),
                      TextSpan(
                        text: "100.00",
                        style: CustomTextStyles.bodyLargee5677294,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 36.v),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "In-Person:",
                      style: CustomTextStyles.titleMediumff333333,
                    ),
                    TextSpan(
                        text: " \$",
                        style: TextStyle(color: Color(0xff0EBE7F))),
                    TextSpan(
                      text: "",
                      style: CustomTextStyles.titleMediumff0ebe7f,
                    ),
                    TextSpan(
                      text: "100.00",
                      style: CustomTextStyles.bodyLargee5677294,
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBookAppointment(BuildContext context) {
    return CustomElevatedButton(
      onPressed: (){
        Navigator
            .push(
            context,
            MaterialPageRoute(
                builder: (context) => BookingAppointmentDetails()
            )
        );
      },
      text: "Book Appointment",
      margin: EdgeInsets.only(
        left: 24.h,
        right: 24.h,
        bottom: 25.v,
      ),
      buttonStyle: CustomButtonStyles.fillPrimary,
      buttonTextStyle: CustomTextStyles.titleMediumOnErrorContainerSemiBold18,
    );
  }
}
