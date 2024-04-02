import 'package:doctari/patientFlow/patientMenu/notification_screen/widgets/notification_item_widget.dart';
import 'package:doctari/widgets/app_bar/custom_app_bar.dart';
import 'package:doctari/widgets/app_bar/appbar_leading_image.dart';
import 'package:doctari/widgets/app_bar/appbar_subtitle_nine.dart';
import 'package:doctari/widgets/app_bar/appbar_trailing_button.dart';
import 'package:doctari/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';

class DoctorsNotifications extends StatelessWidget {
  const DoctorsNotifications({Key? key})
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
          padding: EdgeInsets.symmetric(vertical: 21.v, horizontal: 20),
          child: Column(
            children: [
              _buildDate(context),
              SizedBox(height: 25.v),
              _buildNotification(context),
              SizedBox(height: 39.v),
              _buildYESTERDAY(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 70.v,
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
      title: AppbarSubtitleNine(
        text: "Notification",
      ),
      actions: [
        AppbarTrailingButton(
          margin: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 15.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildDate(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 23.h,
        right: 27.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Today".toUpperCase(),
            style: CustomTextStyles.titleMediumGray600,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: Text(
              "Mark all as read",
              style: CustomTextStyles.titleSmallBluegray90002,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNotification(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
          context,
          index,
          ) {
        return SizedBox(
          height: 22.v,
        );
      },
      itemCount: 3,
      itemBuilder: (context, index) {
        return NotificationItemWidget();
      },
    );
  }

  /// Section Widget
  Widget _buildYESTERDAY(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        children: [
          Text(
            "YESTERDAY",
            style: CustomTextStyles.titleMediumGray600,
          ),
          SizedBox(height: 25.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 4.v,
                  bottom: 6.v,
                ),
                child: CustomIconButton(
                  height: 60.adaptSize,
                  width: 60.adaptSize,
                  padding: EdgeInsets.all(18.h),
                  decoration: IconButtonStyleHelper.fillGreen,
                  child: CustomImageView(
                    color: Colors.black,
                    imagePath: ImageConstant.imgCalendarErrorcontainer,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 1.v),
                            child: Text(
                              "Appointment success",
                              style: CustomTextStyles.titleMediumBluegray90002,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 3.v),
                            child: Text(
                              "1d",
                              style: CustomTextStyles.bodyMediumGray600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.v),
                      SizedBox(
                        width: 217.h,
                        child: Text(
                          "You have successfully booked your appointment with Dr. David Patel.",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyMediumGray600.copyWith(
                            height: 1.50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
