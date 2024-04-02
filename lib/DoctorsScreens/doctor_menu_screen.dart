import 'package:doctari/DoctorsScreens/Appointments&ShedulerForDoctor/MainDoctorShedular.dart';
import 'package:doctari/DoctorsScreens/DoctorBottomNavigationManager/SubBottomNavigationScreens/DoctorsChatScreens.dart';
import 'package:doctari/DoctorsScreens/doctor_profile_screen/doctor_profile_screen.dart';
import 'package:doctari/patientFlow/patientMenu/contact_us.dart';
import 'package:doctari/patientFlow/patientMenu/setting_screen.dart';
import 'package:doctari/presentation/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';
import 'DoctorsNotificationScreen.dart';

class DoctorMenuScreen extends StatelessWidget {
  DoctorMenuScreen({Key? key})
      : super(
          key: key,
        );

  List<String> menuOptions = [
    "Profile",
    "Chat",
    "Appointments",
    "Notifications",
    "Contact Us",
    "Change Password"
  ];

  List<IconData> menuIcons = [
    Icons.person,
    Icons.chat,
    Icons.calendar_month_outlined,
    Icons.notifications,
    Icons.domain_verification,
    Icons.settings
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
              backgroundImage: NetworkImage(
                "https://as1.ftcdn.net/v2/jpg/01/72/18/66/1000_F_172186647_e93OQdc8KSoBzIPqfKG0UoJSJhR15HLa.jpg"
              ),
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
                          if(menuOptions[index]=="Profile") {
                            Navigator
                                .push(
                                context, MaterialPageRoute(
                              builder: (context) => DoctorProfileScreen(),
                            ));
                          }
                          else if(menuOptions[index]=="Chat") {
                            Navigator
                                .push(
                                context, MaterialPageRoute(
                              builder: (context) {
                                return Scaffold(
                                  body: DoctorChatsScreens(),
                                );
                              },
                            ));
                          }
                          else if(menuOptions[index]=="Appointments") {
                            Navigator
                                .push(
                                context, MaterialPageRoute(
                              builder: (context) => MainDoctorShedular(),
                            ));
                          }
                          else if(menuOptions[index]=="Notifications") {
                            Navigator
                                .push(
                                context, MaterialPageRoute(
                              builder: (context) => DoctorsNotifications(),
                            ));
                          }
                          else if(menuOptions[index]=="Contact Us") {
                            Navigator
                                .push(
                                context, MaterialPageRoute(
                              builder: (context) => ContactUsScreen(),
                            ));
                          }
                          else if(menuOptions[index]=="Change Password") {
                            Navigator.push(
                                context, MaterialPageRoute(
                              builder: (context) => PatientSettingScreen(),
                            ));
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Its in Progress")));
                          }
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 22,
                          child: Icon(
                            menuIcons[index],
                            color: Colors.white,
                          ),
                        ),
                        title: Text(menuOptions[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),),
                        // subtitle: Text("dr.aaron@gmail.com", style: TextStyle(fontSize: 12, color: Colors.white),),
                      ),
                    );
                  },
                    itemCount: 6,
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
