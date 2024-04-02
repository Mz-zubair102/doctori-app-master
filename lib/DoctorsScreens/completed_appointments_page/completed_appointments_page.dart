import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

import 'widgets/completedappointments_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';

// ignore_for_file: must_be_immutable
class CompletedAppointmentsPage extends StatelessWidget {
  const CompletedAppointmentsPage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnErrorContainer1,
          child: Column(
            children: [
              SizedBox(height: 15.v),
              _buildCompletedAppointments(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCompletedAppointments(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 10),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return CompletedappointmentsItemWidget();
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 20,
          );
        },
      ),
    );
  }
}
