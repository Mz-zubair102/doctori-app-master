// import 'package:flutter/material.dart';
// import 'package:doctari/core/app_export.dart';

// // ignore: must_be_immutable
// class HourstabsForAppointmentItemWidget extends StatelessWidget {
//   const HourstabsForAppointmentItemWidget({Key? key})
//       : super(
//           key: key,
//         );

//   @override
//   Widget build(BuildContext context) {
//     return RawChip(
//       padding: EdgeInsets.symmetric(
//         horizontal: 20.h,
//         vertical: 10.v,
//       ),
//       showCheckmark: false,
//       labelPadding: EdgeInsets.zero,
//       label: Text(
//         "09:00 AM",
//         style: TextStyle(
//           color: appTheme.gray600,
//           fontSize: 14.fSize,
//           fontFamily: 'Nunito',
//           fontWeight: FontWeight.w700,
//         ),
//       ),
//       selected: false,
//       backgroundColor: appTheme.gray5002,
//       selectedColor: theme.colorScheme.primary,
//       shape: RoundedRectangleBorder(
//         side: BorderSide.none,
//         borderRadius: BorderRadius.circular(
//           8.h,
//         ),
//       ),
//       onSelected: (value) {},
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';

class HourstabsForAppointmentItemWidget extends StatelessWidget {
  final String time;
  final String selectedTime;
  final Function(String) onTimeSelected;

  const HourstabsForAppointmentItemWidget({
    Key? key,
    required this.time,
    required this.selectedTime,
    required this.onTimeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = time == selectedTime;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          onTimeSelected(time);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff0066FF) : appTheme.gray5002,
          borderRadius: BorderRadius.circular(8.h),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: isSelected ? Colors.white : appTheme.gray600,
            fontSize: 14.fSize,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class HourstabsForAppointmentWidget extends StatefulWidget {
  @override
  _HourstabsForAppointmentWidgetState createState() =>
      _HourstabsForAppointmentWidgetState();
}

class _HourstabsForAppointmentWidgetState
    extends State<HourstabsForAppointmentWidget> {
  String _selectedTime = '';

  @override
  Widget build(BuildContext context) {
    List<String> hours = [
      '08:00 AM',
      '08:30 AM',
      '09:00 AM',
      '09:30 AM',
      '10:00 AM',
      '10:30 AM',
      '11:00 AM',
      '11:30 AM',
      '12:00 PM',
      '12:30 PM',
      '01:00 PM',
      '01:30 PM',
      '02:00 PM',
      '02:30 PM',
      '03:00 PM',
      '03:30 PM',
      '04:00 PM',
      '04:30 PM',
      '05:00 PM',
      '05:30 PM',
      '06:00 PM',
      '06:30 PM',
      '07:00 PM'
    ];

    return Wrap(
      runSpacing: 13.5.v,
      spacing: 20.5.h,
      children: hours
          .map(
            (hour) => HourstabsForAppointmentItemWidget(
              time: hour,
              selectedTime: _selectedTime,
              onTimeSelected: (selectedTime) {
                setState(() {
                  _selectedTime = selectedTime;
                });
              },
            ),
          )
          .toList(),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:doctari/core/app_export.dart';

// class HourstabsForAppointmentItemWidget extends StatefulWidget {
//   final String time;

//   const HourstabsForAppointmentItemWidget({
//     Key? key,
//     required this.time,
//   }) : super(key: key);

//   @override
//   _HourstabsForAppointmentItemWidgetState createState() =>
//       _HourstabsForAppointmentItemWidgetState();
// }

// class _HourstabsForAppointmentItemWidgetState
//     extends State<HourstabsForAppointmentItemWidget> {
//   bool _isSelected = false;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _isSelected = !_isSelected;
//           if (_isSelected) {
//             // Print the selected time when it's selected
//             print('Selected time: ${widget.time}');
//           }
//         });
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
//         decoration: BoxDecoration(
//           color: _isSelected ? Colors.blue : appTheme.gray5002,
//           borderRadius: BorderRadius.circular(8.h),
//         ),
//         child: Text(
//           widget.time,
//           style: TextStyle(
//             color: _isSelected ? Colors.white : appTheme.gray600,
//             fontSize: 14.fSize,
//             fontFamily: 'Nunito',
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//     );
//   }
// }
