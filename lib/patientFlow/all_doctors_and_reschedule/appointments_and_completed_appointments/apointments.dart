import 'package:doctari/patientFlow/all_doctors_and_reschedule/appointments_and_completed_appointments/completed_appointments_one_page/completed_appointments_one_page.dart';
import 'package:doctari/patientFlow/all_doctors_and_reschedule/appointments_and_completed_appointments/upcoming_appointments_one_page/upcoming_appointments_one_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen();


  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {

  int selectedIndex= 0;

  List<Widget> screensList = [
    UpcomingAppointmentsOnePage(),
    CompletedAppointmentsOnePage()
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        surfaceTintColor: Colors.grey.shade100,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title:  Text("Appointments", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
      ),
      body: SizedBox(
        height: mediaQuery.size.height,
        width: mediaQuery.size.width,
        child: Column(
          children: [
            buildCustomTabBars(context),
            Divider(
              color: Colors.grey.shade300,
            ),
            Expanded(
                child: SwipeDetector(
                    onSwipeRight: (offset) {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    onSwipeLeft: (offset) {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: screensList[selectedIndex]
                )
            )
          ],
        ),
      ),
    );
  }

  buildCustomTabBars(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: (){
            setState(() {
              selectedIndex = 0;
            });
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Upcoming", style: TextStyle(fontSize: 15, color: selectedIndex==0?Color(0xff0066FF):Color(0xff9CA3AF), fontWeight: FontWeight.bold),),
              ),
              Container(
                height: 5,
                width: MediaQuery.of(context).size.width*0.3,
                decoration: BoxDecoration(
                    color: selectedIndex==0?Color(0xff0066FF):Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),

                    )
                ),
              )
            ],
          ),
        ),

        GestureDetector(
          onTap: (){
            setState(() {
              selectedIndex = 1;
            });
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Completed", style: TextStyle(fontSize: 15, color: selectedIndex==1?Color(0xff0066FF):Color(0xff9CA3AF), fontWeight: FontWeight.bold),),
              ),
              Container(
                height: 5,
                width: MediaQuery.of(context).size.width*0.3,
                decoration: BoxDecoration(
                    color: selectedIndex==1?Color(0xff0066FF):Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

