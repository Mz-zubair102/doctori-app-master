import 'package:doctari/DoctorsScreens/upcoming_appointments_for_doc_page/upcoming_appointments_for_doc_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import '../../presentation/completed_appointments_page/completed_appointments_page.dart';

class MainDoctorShedular extends StatefulWidget {
  const MainDoctorShedular();


  @override
  State<MainDoctorShedular> createState() => _MainDoctorShedularState();
}

class _MainDoctorShedularState extends State<MainDoctorShedular> {

  int selectedIndex= 0;

  List<Widget> screensList = [
    UpcomingAppointmentsForDocPage(),
    CompletedAppointmentsPage()
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade100,
        surfaceTintColor: Colors.white,
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
