import 'package:doctari/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';

// ignore: must_be_immutable
class TabbarItemWidget extends StatelessWidget {

  int index;

  TabbarItemWidget({Key? key,required this.index})
      : super(
          key: key,
        );

  List<String> iconsList = [
    'assets/images/img_close_primary.svg',
    'assets/myassets/medal.svg',
    'assets/myassets/star.svg',
    'assets/myassets/messages.svg',
  ];

  List<String> textType = [
    'patient',
    'experience',
    'rating',
    'reviews'
  ];

  List<String> numberOfExperience = [
    '2,000+',
    '10+',
    '5',
    '1,872',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.h,
      child: Column(
        children: [
          CustomIconButton(
            height: 56.adaptSize,
            width: 56.adaptSize,
            padding: EdgeInsets.all(12.h),
            child: CustomImageView(
              imagePath: iconsList[index],
              color: Color(0xff0066FF),
            ),
          ),
          SizedBox(height: 2.v),
          Text(
            numberOfExperience[index],
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: CustomTextStyles.titleSmallBluegray700_1,
          ),
          SizedBox(height: 3.v),
          Text(
            textType[index],
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: CustomTextStyles.titleSmallMedium,
          ),
        ],
      ),
    );
  }
}
