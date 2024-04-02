import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';

// ignore: must_be_immutable
class GenderItemWidget extends StatelessWidget {
  const GenderItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Text(
      "Gender",
      style: theme.textTheme.bodyLarge,
    );
  }
}
