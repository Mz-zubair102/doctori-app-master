import 'widgets/cards_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';

// ignore_for_file: must_be_immutable
class UpcomingAppointmentsOnePage extends StatefulWidget {
  const UpcomingAppointmentsOnePage({Key? key})
      : super(
          key: key,
        );

  @override
  UpcomingAppointmentsOnePageState createState() =>
      UpcomingAppointmentsOnePageState();
}

class UpcomingAppointmentsOnePageState
    extends State<UpcomingAppointmentsOnePage>
    with AutomaticKeepAliveClientMixin<UpcomingAppointmentsOnePage> {
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
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
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
          return CardsItemWidget();
        },
      ),
    );
  }
}
