import 'package:doctari/patientFlow/all_doctors_and_reschedule/all_doctors/all_doctors_page/widgets/horizontal_tabs.dart';
import 'package:doctari/widgets/app_bar/appbar_subtitle_seven.dart';
import 'package:doctari/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'widgets/alldoctors1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';

class AllDoctorsScreen extends StatelessWidget {
  AllDoctorsScreen({Key? key})
      : super(
          key: key,
        );

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        color: Colors.grey.shade100,
        width: SizeUtils.width,
        child: Column(
          children: [
            AppBar(
              surfaceTintColor: Colors.grey.shade100,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.grey.shade100,
              title: AppbarSubtitleSeven(
                text: "All Doctors",
              ),
              centerTitle: true,
            ),
            SizedBox(height: 10.v),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20
                  ),
                  child: CustomTextFormField(
                    // width: 197.h,
                    controller: _searchController,
                    prefix: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.search, color: Colors.grey, size: 20,),
                    ),
                    hintText: "Search",
                    hintStyle: CustomTextStyles.bodyLargeInterGray50001,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.h,
                      vertical: 13.v,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    borderDecoration: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1
                      )
                    )
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                HorizontalScrollableTabs(
                  tabTitles: [
                    'All',
                    'General',
                    'Cardialogist',
                    'Dentist',
                    'Surgan',
                    'Child Specilist'
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20
                  ),
                  child: Text(
                    "532 founds",
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: 20.v),
                Container(
                    height: MediaQuery.of(context).size.height*0.7,
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height*0.05
                    ),
                    child: _buildAllDoctors(context)
                ),
                SizedBox(height: 50.v),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAllDoctors(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.h),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
            horizontal: 20
        ),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 22.v,
          );
        },
        itemCount: 6,
        itemBuilder: (context, index) {
          return Alldoctors1ItemWidget();
        },
      ),
    );
  }
}
