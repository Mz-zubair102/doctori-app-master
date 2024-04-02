import 'widgets/upcomingappointments_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';

// ignore_for_file: must_be_immutable
class UpcomingAppointmentsForDocPage extends StatelessWidget {
  const UpcomingAppointmentsForDocPage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Container(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 15.v),
              _buildUpcomingAppointments(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUpcomingAppointments(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.h),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.v),
              child: SizedBox(
                width: 310.h,
                child: Divider(
                  height: 1.v,
                  thickness: 1.v,
                  color: appTheme.gray200,
                ),
              ),
            );
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            return UpcomingappointmentsItemWidget();
          },
        ),
      ),
    );
  }
}
