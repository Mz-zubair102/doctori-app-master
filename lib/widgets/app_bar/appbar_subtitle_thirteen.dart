import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';

// ignore: must_be_immutable
class AppbarSubtitleThirteen extends StatelessWidget {
  AppbarSubtitleThirteen({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: CustomTextStyles.bodySmallOnErrorContainer.copyWith(
            color: theme.colorScheme.onErrorContainer.withOpacity(1),
          ),
        ),
      ),
    );
  }
}
