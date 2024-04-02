import 'package:doctari/patientFlow/registration_screens/login_screen/login_screen.dart';
import 'package:doctari/widgets/app_bar/custom_app_bar.dart';
import 'package:doctari/widgets/custom_icon_button.dart';
import 'package:doctari/widgets/custom_text_form_field.dart';
import 'package:doctari/widgets/custom_drop_down.dart';
import 'package:doctari/widgets/custom_checkbox_button.dart';
import 'package:doctari/widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';

import '../Services/API_services.dart';


class DoctorRegistration2 extends StatefulWidget {

  final String firstName;
  final String lastName;
  final String email;
  final String Dob;
  final String gender;
  final String phoneNumber;
  DoctorRegistration2({Key? key, required this.firstName, required this.lastName, required this.email, required this.Dob, required this.gender, required this.phoneNumber})
      : super(
    key: key,
  );

  @override
  State<DoctorRegistration2> createState() =>
      _DoctorRegistration2State();
}

class _DoctorRegistration2State extends State<DoctorRegistration2> {
  TextEditingController documentnumberController = TextEditingController();

  TextEditingController licensenumberController = TextEditingController();

  TextEditingController cityNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  List<String> dropdownItemList = [
    "Item One",
    "Item Two",
    "Item Three",
  ];
  List<String> dropdownItemList1 = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  bool isShowPassword = false;

  bool isShowConfirmPassword = false;
  
  bool iagreewiththeTermsofServicePri = false;

  bool _isLoading = false;
  

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Api_Services _apiService = Api_Services();
  List<String> _countries = [];
  List<String> _universties = [];
  List<String> _specialists = [];
  String? _selectedCountry;
  String? _selectedUniversity;
  String? _selectedSpecialist;


  Future<void> _fetchCountries() async {
    try {
      List<String> countries = await _apiService.fetchCountries();
      setState(() {
        _countries = countries;
      });
    } catch (e) {
      // Handle error
      print('Error fetching countries: $e');
    }
  }
  Future<void> _fetchUniversties() async {
    try {
      List<String> universties = await _apiService.fetchUniversties();
      setState(() {
        _universties = universties;
      });
    } catch (e) {
      // Handle error
      print('Error fetching universties: $e');
    }
  }
  Future<void> _fetchSpecialists() async {
    try {
      List<String> specialists = await _apiService.fetchSpecialists();
      setState(() {
        _specialists = specialists;
      });
    } catch (e) {
      // Handle error
      print('Error fetching specialists: $e');
    }
  }

  void _registerdoctor() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });


      bool registerDoctor = await _apiService.registerDoctor(
          "${widget.email}",
          passwordController.text.toString(),
          "${widget.firstName}",
          "${widget.lastName}",
          documentnumberController.text.toString(),
          "${widget.Dob}",
          "${widget.gender}",
          "${widget.phoneNumber}",
          cityNameController.text.toString(),
          licensenumberController.text.toString(),
        _selectedUniversity.toString(),
        _selectedCountry.toString(),
        _selectedSpecialist.toString(),
      );


      setState(() {
        _isLoading = false;
      });

      if (registerDoctor) {
        debugPrint("first Name: ${widget.firstName}");
        debugPrint("last Name: ${widget.firstName}");
        debugPrint("Birthday: ${widget.firstName}");
        debugPrint("gender: ${widget.firstName}");
        debugPrint("phone number: ${widget.firstName}");
        debugPrint("license number: ${licensenumberController.text.toString()}");
        debugPrint("city: ${cityNameController.text.toString()}");
        debugPrint("email: ${widget.email}");
        debugPrint("document number: ${documentnumberController.text.toString()}");
        debugPrint("password: ${passwordController.text.toString()}");
        debugPrint("university: ${_selectedUniversity}");
        debugPrint("country: ${_selectedUniversity}");
        debugPrint("specialist: ${_selectedUniversity}");


        Navigator.push(context,MaterialPageRoute(
            builder:(context) => (LoginScreen())

        ),
        );
        ScaffoldMessenger
            .of(context)
            .showSnackBar(
          SnackBar(
              backgroundColor: Colors.white,
              content: Text(
                "Doctor registered successfully!",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito'
                ),
              )
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Registration Failed",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color(0xff0066FF)
                ),
                textAlign: TextAlign.center,
              ),
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              elevation: 8,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              shadowColor: Colors.grey.shade300,
              content: Text("Failed to register doctor", textAlign: TextAlign.center,),
              contentPadding: EdgeInsets.all(15),
              contentTextStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Nunito'
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width*0.3,
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Close", style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold
                            ),
                            )
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        );
      }
    }
  }
  @override
  void initState() {
    super.initState();
    _fetchCountries();
    _fetchUniversties();
    _fetchSpecialists();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: 375.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 21.v,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 19.v),
                    _buildDocumentNumber(context),
                    SizedBox(height: 20.v),
                    _buildLicenseNumber(context),
                    SizedBox(height: 20.v),
                    _buildSpecialityList(context),
                    SizedBox(height: 20.v),
                    _buildCountryList(context),
                    SizedBox(height: 20.v),
                    _buildUniversityList(context),
                    SizedBox(height: 20.v),
                    _buildCityName(context),
                    SizedBox(height: 20.v),
                    _buildPassword(context),
                    SizedBox(height: 20.v),
                    _buildConfirmpassword(context),
                    SizedBox(height: 90.v),
                    _buildIagreewiththeTermsofServicePri(context),
                    SizedBox(height: 14.v),
                    _buildSendRequest(context),
                    SizedBox(height: 17.v),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Have an account? ",
                            style: CustomTextStyles.bodyMediumff000000,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                            },
                            child: Text(
                              "Log in",
                              style: CustomTextStyles.bodyMediumff004687,
                            ),
                          )
                        ],
                      ),
                    ),

                    // RichText(
                    //   text: TextSpan(
                    //     children: [
                    //       TextSpan(
                    //         text: "Have an account? ",
                    //         style: CustomTextStyles.bodyMediumff000000,
                    //       ),
                    //       TextSpan(
                    //         text: "Log in",
                    //         style: CustomTextStyles.bodyMediumff004687,

                    //       ),
                    //     ],
                    //   ),
                    //   textAlign: TextAlign.left,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 70,
      leadingWidth: 375.h,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: CustomIconButton(
                height: 40.adaptSize,
                width: 40.adaptSize,
                padding: EdgeInsets.all(10),
                decoration: IconButtonStyleHelper.outlineBlueGray,
                child: CustomImageView(
                  imagePath: ImageConstant.imgArrowLeftGray50002,
                  color: Colors.grey,
                  height: 60,
                  width: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDocumentNumber(BuildContext context) {
    return CustomTextFormField(
      controller: documentnumberController,
      hintText: "Document Number",
      textInputType: TextInputType.number,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 16.v,
      ),
      borderDecoration: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          width: 1,
          color: Colors.grey.shade300
        )
      ),
    );
  }

  /// Section Widget
  Widget _buildLicenseNumber(BuildContext context) {
    return CustomTextFormField(
      controller: licensenumberController,
      hintText: "License Number",
      textInputType: TextInputType.number,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 16.v,
      ),
      borderDecoration: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              width: 1,
              color: Colors.grey.shade300
          )
      ),
    );
  }
  /// Section Widget
  Widget _buildCityName(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: CustomTextFormField(
        borderDecoration: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        controller: cityNameController,
        hintText: "City",
        textInputType: TextInputType.number,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 25.h,
          vertical: 16.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      hintText: "Password",
      borderDecoration: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              width: 1,
              color: Colors.grey.shade300
          )
      ),
      hintStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade500
      ),
      textInputType: TextInputType.visiblePassword,
      suffix: IconButton(
          onPressed: (){
            if(isShowPassword){
              isShowPassword = false;
            }
            else{
              isShowPassword = true;
            }
            setState(() {

            });
          },
          icon: Icon(
            isShowPassword?Icons.visibility:Icons.visibility_off,
            color: Color(0xff677294),
          )
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 54.v,
      ),
      obscureText: !isShowPassword,
    );
  }

  /// Section Widget
  Widget _buildConfirmpassword(BuildContext context) {
    return CustomTextFormField(
      hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade500
      ),
      controller: confirmpasswordController,
      hintText: "Confirm Password",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      suffix: IconButton(
          onPressed: (){
            if(isShowConfirmPassword){
              isShowConfirmPassword = false;
            }
            else{
              isShowConfirmPassword = true;
            }
            setState(() {

            });
          },
          icon: Icon(
            isShowConfirmPassword?Icons.visibility:Icons.visibility_off,
            color: Color(0xff677294),
          )
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 54.v,
      ),
      obscureText: !isShowConfirmPassword,
    );
  }

  /// Section Widget
  Widget _buildIagreewiththeTermsofServicePri(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 25.h,
        right: 32.h,
      ),
      child: CustomCheckboxButton(
        text: "I agree Terms of Service & Privacy Policy",
        value: iagreewiththeTermsofServicePri,
        onChange: (value) {
          setState(() {
            iagreewiththeTermsofServicePri = value;
          });
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildSendRequest(BuildContext context) {
    return _isLoading?CircularProgressIndicator(color: Colors.blue,strokeWidth: 2.0,):CustomElevatedButton(
      onPressed: (){
        _registerdoctor();
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => LoginScreen(),
        //     )
        // );
      },
      text: "Sign Up",
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      buttonStyle: CustomButtonStyles.fillPrimary,
      buttonTextStyle: CustomTextStyles.titleMediumOnErrorContainerSemiBold,
    );
  }

  /// Section Widget
  Widget _buildCountryList(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(
      //     horizontal: 10,
      //     vertical: 10
      // ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              8
          ),
          border: Border.all(
              color: Colors.grey.shade300,
              width: 1
          )
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: "Select Country",
          hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade500
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none
          ),
        ),
        // value: null,
        ///
        value: _selectedCountry,
        onChanged: (String? value) {
          // Handle countries selection
          setState(() {
            _selectedCountry = value;
          });
        },
        items:
        // [
        //   "Pakistan",
        //   "Itly",
        //   "Kuwait",
        //   "Turkey",
        //   "Japan",
        //   "China",
        //   "Usa"]
        _countries.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        // onChanged: (String? newValue) {
        //   // Handle gender selection
        // },
      ),
    );
  }

  /// Section Widget
  Widget _buildUniversityList(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Container(
        // padding: EdgeInsets.symmetric(
        //     horizontal: 10,
        //     vertical: 10
        // ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                8
            ),
            border: Border.all(
                color: Colors.grey.shade300,
                width: 1
            )
        ),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: "Select University",
            hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade500
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none
            ),
          ),
          // value: null,

          value: _selectedUniversity,
          onChanged: (String? value) {
            // Handle universties selection
            setState(() {
              _selectedUniversity = value;
            });
          },
          items:
          // [
          //   "COMSATS",
          //   "FAST",
          //   "NUST",
          //   "Tsinghua University",
          //   "University of Naples Federico II",
          //   "Bilkent University",
          // ]
          _universties.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSpecialityList(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(
      //     horizontal: 10,
      //     vertical: 10
      // ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              8
          ),
          border: Border.all(
              color: Colors.grey.shade300,
              width: 1
          )
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: "Select Specialty",
          hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade500
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none
          ),
        ),
        // value: null,
        value: _selectedSpecialist,
        onChanged: (String? value) {
          // Handle specialists selection
          setState(() {
            _selectedSpecialist = value;
          });
        },
        items:
        // [
        //   "Cardiology",
        //   "Dentist",
        //   "Gynecologists",
        //   "Endocrinology",
        //   "Gynecology",
        //   "Neuroanesthesiology",
        //   "Anesthesiology"]
        _specialists .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}


