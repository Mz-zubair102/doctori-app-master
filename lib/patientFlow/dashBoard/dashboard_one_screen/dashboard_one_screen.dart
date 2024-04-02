import 'package:doctari/patientFlow/patientMenu/PatientDrawer/MainDrawerScreen.dart';
import 'package:doctari/widgets/app_bar/appbar_subtitle_eight.dart';
import 'package:doctari/widgets/app_bar/appbar_title.dart';
import 'package:doctari/widgets/custom_search_view.dart';
import 'package:doctari/widgets/custom_drop_down.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'widgets/dashboardone_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';

class DashboardOneScreen extends StatelessWidget {
  DashboardOneScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.grey.shade100,
        child: Column(
          children: [
            _buildHiAbdul(context),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 19.h),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1
                          )
                        ),
                        child: CustomDropDown(
                          hintText: "Select Specialty",
                          hintStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey
                          ),
                          items: dropdownItemList,
                          borderDecoration: DropDownStyleHelper.outlineBlack,
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(height: 19.v),
                      _buildBanner(context),
                      SizedBox(height: 19.v),
                      _buildDashboardOne(context),
                      SizedBox(height: 20.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1
                              ),
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Center(
                              child: Icon(Icons.arrow_back_ios_new, size: 15, color: Colors.black,),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color(0xff0066FF),
                                borderRadius: BorderRadius.circular(8)

                            ),
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){},
                            child: Container(
                              height: 30,
                              width: 30,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1
                                  ),
                                  borderRadius: BorderRadius.circular(8)

                              ),
                              child: Center(
                                child: Text(
                                  "2",
                                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1
                                ),
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Center(
                              child: Text(
                                "...",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1
                                ),
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Center(
                              child: Icon(Icons.arrow_forward_ios, size: 15, color: Colors.black,),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.v),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHiAbdul(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 160.v,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.14,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(18),
              ),
              gradient: LinearGradient(
                  colors: [
                    Color(0xff33CEFF),
                    Color(0xff0066FF),
                  ]
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        AppbarSubtitleEight(
                          text: "Hi Abdul! ",
                          margin: EdgeInsets.only(right: 112.h),
                        ),
                        AppbarTitle(
                          text: "Find Your Doctor",
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    Navigator
                        .push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PatientMainDrawer(),
                        )
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 30,
                    backgroundImage: AssetImage(
                      ImageConstant.imgEllipse2660x60,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.h,
              right: 20.h,
              top: MediaQuery.of(context).size.height*0.11
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomSearchView(
                  borderDecoration: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1,
                          style: BorderStyle.solid
                      )
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  controller: searchController,
                  hintText: "Name",
                  prefix: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.search, color: Colors.grey, size: 20,),
                  ),
                  suffix: IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.filter_list,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // CustomAppBar(
          //   height: 127.v,
          //   title: Padding(
          //     padding: EdgeInsets.only(
          //       left: 19.h,
          //       top: 16.v,
          //       bottom: 48.v,
          //     ),
          //     child: Column(
          //       children: [
          //         AppbarSubtitleEight(
          //           text: "Hi Abdul! ",
          //           margin: EdgeInsets.only(right: 112.h),
          //         ),
          //         AppbarTitle(
          //           text: "Find Your Doctor",
          //         ),
          //       ],
          //     ),
          //   ),
          //   actions: [
          //     GestureDetector(
          //       onTap: (){
          //
          //       },
          //       child: Padding(
          //         padding: const EdgeInsets.only(
          //           bottom: 30,
          //           right: 10
          //         ),
          //         child: CircleAvatar(
          //           backgroundColor: Colors.black,
          //           radius: 30,
          //           backgroundImage: AssetImage(
          //             ImageConstant.imgEllipse2660x60,
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          //   styleType: Style.bgGradientnamelightblueA200nameprimary,
          // ),

        ],
      ),
    );
  }

  Widget _buildBanner(BuildContext context) {
    return SizedBox(
      height: 163.v,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage163x334,
            height: 163.v,
            width: 334.h,
            radius: BorderRadius.circular(12.h),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(right: 163.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 105.v,
                    width: 171.h,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        // CustomImageView(
                        //   imagePath: ImageConstant.imgBackground99x114,
                        //   height: 99.v,
                        //   width: 114.h,
                        //   alignment: Alignment.topLeft,
                        // ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(left: 11.h),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 160.h,
                                  child: Text(
                                    "Looking for\nSpecialist Doctors?",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.titleMediumTeal300
                                        .copyWith(
                                      height: 1.50,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.v),
                                Container(
                                  width: 138.h,
                                  margin: EdgeInsets.only(right: 21.h),
                                  child: Text(
                                    "Schedule an appointment with our top doctors.",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles
                                        .bodySmallSecondaryContainer
                                        .copyWith(
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
                  ),
                  SizedBox(height: 45.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 12.v,
                      width: 83.h,
                      margin: EdgeInsets.only(right: 20.h),
                      decoration: BoxDecoration(
                        color: appTheme.blueGray10033,
                        borderRadius: BorderRadius.circular(41.h),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardOne(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return SizedBox(height: 22.v);
      },
      itemCount: 8,
      itemBuilder: (context, index) {
        return DashboardoneItemWidget();
      },
    );
  }
}
