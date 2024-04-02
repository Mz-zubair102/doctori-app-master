import 'package:doctari/DoctorsScreens/doctor_menu_screen.dart';
import 'package:doctari/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../theme/theme_helper.dart';


class DoctorsDashBoard extends StatelessWidget {
  const DoctorsDashBoard();

  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);

    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(
            bottom: mediaQuery.size.height*0.1
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mediaQuery.size.height*0.43,
                width: mediaQuery.size.width,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: mediaQuery.size.height*0.18,
                      width: mediaQuery.size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(25)
                        ),
                        gradient: LinearGradient(
                          colors: [
                            appTheme.lightBlueA200,
                            theme.colorScheme.primary,
                          ],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 19.h,
                              top: 16.v,
                              bottom: 48.v,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Hi Dr. Aaron!", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300, color: Colors.white, inherit: false),),
                                ),
                                Text("Upcoming Appointments", style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500, color: Colors.white, inherit: false),)
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator
                                  .push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DoctorMenuScreen(),
                                  )
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 15
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    "https://i.pinimg.com/564x/68/41/87/6841874b97182f7125403fd68d26e126.jpg"
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: mediaQuery.size.height*0.12,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: mediaQuery.size.height*0.3,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: mediaQuery.size.width*0.06
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  blurStyle: BlurStyle.outer
                              )
                            ],
                            borderRadius: BorderRadius.circular(
                                15
                            )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "In-Person Visit",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  inherit: false,
                                  fontSize: 16
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 20
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: mediaQuery.size.height*0.13,
                                      width: mediaQuery.size.width*0.27,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                "https://www.erc.com.pk/wp-content/uploads/person2.jpg"
                                              )
                                          ),
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(
                                              12
                                          )
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5
                                            ),
                                            child: Text("Sep 30, 2024", style: TextStyle(
                                                fontSize: 15,
                                                inherit: false,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5
                                            ),
                                            child: Text("10:00 AM", style: TextStyle(
                                                fontSize: 15,
                                                inherit: false,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8
                                            ),
                                            child: Text("Abdul Rahman", style: TextStyle(
                                                fontSize: 12,
                                                inherit: false,
                                                color: Color(0xff4B5563),
                                                fontWeight: FontWeight.bold
                                            ),),
                                          ),
                                          Text("Age: 22yrs Gender: Male", style: TextStyle(
                                              fontSize: 12,
                                              inherit: false,
                                              color: Color(0xff4B5563),
                                              fontWeight: FontWeight.bold
                                          ),),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8
                                  ),
                                  child: SizedBox(
                                    height: 35,
                                    width: mediaQuery.size.width*0.35,
                                    child: ElevatedButton(
                                        onPressed: (){},
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStatePropertyAll(
                                                Color(0xffE5E7EB)
                                            )
                                        ),
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(fontSize: 15),
                                        )
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8
                                  ),
                                  child: SizedBox(
                                    height: 35,
                                    width: mediaQuery.size.width*0.35,
                                    child: ElevatedButton(
                                        onPressed: (){},
                                        child: Text(
                                          "Reschedule",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white
                                          ),
                                        )
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 20
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // OVERVIEW SECTION
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Overview",
                        style: TextStyle(
                            inherit: false,
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    overViewContainer(context, "Patients", "2341", Icons.group),
                    overViewContainer(context, "Consultation", "134", Icons.join_full),
                    overViewContainer(context, "Revenue", "1023.42\$", Icons.attach_money),

                    // REVIEW SECTION
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Reviews",
                            style: TextStyle(
                                inherit: false,
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){

                          },
                          child: Text(
                            "See All",
                            style: TextStyle(
                                inherit: false,
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 60,
                      width: mediaQuery.size.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            radius: 25,
                            backgroundImage: NetworkImage(
                                "https://i.pinimg.com/564x/68/41/87/6841874b97182f7125403fd68d26e126.jpg"
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Emily Anderson", style: TextStyle(inherit: false, fontSize: 14, color: Colors.black),),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("5", style: TextStyle(inherit: false, fontSize: 14, color: Colors.grey),),
                                      RatingBar.builder(
                                        initialRating: 5, // Initial rating value
                                        minRating: 1, // Minimum rating
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5, // Number of rating items (stars)
                                        itemSize: 15, // Size of each rating item
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          // Handle the updated rating
                                          print(rating);
                                        },
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: mediaQuery.size.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            radius: 25,
                            backgroundImage: NetworkImage(
                                "https://i.pinimg.com/564x/68/41/87/6841874b97182f7125403fd68d26e126.jpg"
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Emily Anderson", style: TextStyle(inherit: false, fontSize: 14, color: Colors.black),),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("5", style: TextStyle(inherit: false, fontSize: 14, color: Colors.grey),),
                                      RatingBar.builder(
                                        initialRating: 5, // Initial rating value
                                        minRating: 1, // Minimum rating
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5, // Number of rating items (stars)
                                        itemSize: 15, // Size of each rating item
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          // Handle the updated rating
                                          print(rating);
                                        },
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: mediaQuery.size.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            radius: 25,
                            backgroundImage: NetworkImage(
                                "https://i.pinimg.com/564x/68/41/87/6841874b97182f7125403fd68d26e126.jpg"
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Emily Anderson", style: TextStyle(inherit: false, fontSize: 14, color: Colors.black),),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("5", style: TextStyle(inherit: false, fontSize: 14, color: Colors.grey),),
                                      RatingBar.builder(
                                        initialRating: 5, // Initial rating value
                                        minRating: 1, // Minimum rating
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5, // Number of rating items (stars)
                                        itemSize: 15, // Size of each rating item
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          // Handle the updated rating
                                          print(rating);
                                        },
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget alertDiaLogBox(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);

    return Container(
      height: mediaQuery.size.height*0.3,
      padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                blurStyle: BlurStyle.outer
            )
          ],
          borderRadius: BorderRadius.circular(
              15
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "In-Person Visit",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                inherit: false,
                fontSize: 16
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 20
              ),
              child: Row(
                children: [
                  Container(
                    height: mediaQuery.size.height*0.13,
                    width: mediaQuery.size.width*0.27,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(
                            12
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 5
                          ),
                          child: Text("Sep 30, 2024", style: TextStyle(
                              fontSize: 15,
                              inherit: false,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 5
                          ),
                          child: Text("10:00 AM", style: TextStyle(
                              fontSize: 15,
                              inherit: false,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8
                          ),
                          child: Text("Abdul Rahman", style: TextStyle(
                              fontSize: 12,
                              inherit: false,
                              color: Color(0xff4B5563),
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Text("Age: 22yrs Gender: Male", style: TextStyle(
                            fontSize: 12,
                            inherit: false,
                            color: Color(0xff4B5563),
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8
                ),
                child: SizedBox(
                  height: 35,
                  width: mediaQuery.size.width*0.35,
                  child: ElevatedButton(
                      onPressed: (){},
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color(0xffE5E7EB)
                          )
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 15),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8
                ),
                child: SizedBox(
                  height: 35,
                  width: mediaQuery.size.width*0.35,
                  child: ElevatedButton(
                      onPressed: (){},
                      child: Text(
                        "Reschedule",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white
                        ),
                      )
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget overViewContainer(
      BuildContext context,
      String title, String subtitle, IconData iconData)
  {

    var mediaQuery = MediaQuery.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
            radius: 32,
            backgroundColor: Color(0xffE5E7EB),
            child: Icon(iconData, color: Color(0xff0066FF), size: 30,)
        ),
        Container(
          height: 70,
          width: mediaQuery.size.width*0.625,
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          margin: EdgeInsets.only(
            top: 5,
            bottom: 8
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  12
              ),
              border: Border.all(
                color: Color(0xff677294),
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: TextStyle(inherit: false,fontSize: 15,fontWeight: FontWeight.bold, color: Color(0xff0066FF)),),
              Text(subtitle, style: TextStyle(inherit:false, fontSize: 15, color: Colors.black,),)
            ],
          ),
        ),
      ],
    );
  }

}
