import 'widgets/cards1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';

// ignore_for_file: must_be_immutable
class CompletedAppointmentsOnePage extends StatefulWidget {
  const CompletedAppointmentsOnePage({Key? key})
      : super(
          key: key,
        );

  @override
  CompletedAppointmentsOnePageState createState() =>
      CompletedAppointmentsOnePageState();
}

class CompletedAppointmentsOnePageState
    extends State<CompletedAppointmentsOnePage>
    with AutomaticKeepAliveClientMixin<CompletedAppointmentsOnePage> {
  @override
  bool get wantKeepAlive => true;
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
              _buildCards(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCards(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0.v),
            child: SizedBox(
              height: 22.v,
              child: Divider(
                color: Colors.grey.shade300,
              ),
            ),
          );
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return Cards1ItemWidget();
        },
      ),
    );
  }
}
