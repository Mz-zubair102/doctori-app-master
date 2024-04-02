import 'package:doctari/patientFlow/patientMenu/AllDocotorsMainScreen.dart';
import 'package:doctari/presentation/chatbox_one_screen/chatbox_one_screen.dart';
import 'package:doctari/patientFlow/patientMenu/contact_us.dart';
import 'package:doctari/patientFlow/patientMenu/notification_screen/notification_screen.dart';
import 'package:doctari/patientFlow/patientMenu/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../all_doctors_and_reschedule/appointments_and_completed_appointments/apointments.dart';
import 'SubDrawerScreens/PatientProfile.dart';


class PatientMainDrawer extends StatelessWidget {
  PatientMainDrawer({Key? key})
      : super(
    key: key,
  );

  List<String> menuOptions = [
    "Profile",
    "Chat",
    "Appointments",
    "My Doctors",
    "Notifications",
    "Contact Us",
    "Change Password"
  ];

  List<String> menuIcons = [
    "assets/myassets/user.svg",
    "assets/myassets/bottom4.svg",
    "assets/myassets/calender.svg",
    "assets/myassets/bottom2.svg",
    "assets/myassets/notification.svg",
    "assets/myassets/contact.svg",
    "assets/myassets/setting.svg",
  ];


  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size(
              mediaQuery.size.width,
              mediaQuery.size.height*0.15
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(ImageConstant.imgEllipse2660x60,),
              radius: 25,
            ),
            title: Text("Dr. Aaron Smith", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),),
            subtitle: Text("dr.aaron@gmail.com", style: TextStyle(fontSize: 12, color: Colors.white),),
            trailing: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.red,
                child: Icon(Icons.close_sharp, color: Colors.white,),
              ),
            ),
          ),
        ),
        body: Container(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.5, -0.28),
                end: Alignment(0.5, 1),
                colors: [
                  appTheme.lightBlueA200,
                  theme.colorScheme.primary,
                ],
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: mediaQuery.size.height*0.05
                    ),
                    child: ListView.builder(itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5
                        ),
                        child: ListTile(
                          onTap: (){
                            if(index == 0){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PatientProfileScreen(),));
                            }
                            else if(index == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChatboxOneScreen(),
                                  )
                              );
                            }
                            else if(index == 2) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AppointmentScreen(),
                                  )
                              );
                            }
                            else if(index == 3) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AllDocotrsMainScreen(),
                                  )
                              );
                            }
                            else if(index == 4) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NotificationScreen(),
                                  )
                              );
                            }
                            else if(index == 5) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ContactUsScreen(),
                                  )
                              );
                            }
                            else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PatientSettingScreen(),
                                  )
                              );
                            }
                          },
                          leading: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 22,
                            child: SvgPicture.asset(menuIcons[index], color: Colors.white,)
                          ),
                          title: Text(menuOptions[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),),
                          // subtitle: Text("dr.aaron@gmail.com", style: TextStyle(fontSize: 12, color: Colors.white),),
                        ),
                      );
                    },
                      itemCount: menuOptions.length,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 22,
                      child: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                    title: Text("Logout", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),),
                    // subtitle: Text("dr.aaron@gmail.com", style: TextStyle(fontSize: 12, color: Colors.white),),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
