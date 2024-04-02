import 'package:doctari/patientFlow/MainPatientNavigationScreen/PatientMainBottomNavigation.dart';
import 'package:doctari/patientFlow/registration_screens/login_screen/login_screen.dart';
import 'package:doctari/presentation/patient_login_screen/patient_login_screen.dart';
import 'package:doctari/widgets/app_bar/custom_app_bar.dart';
import 'package:doctari/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:doctari/widgets/custom_icon_button.dart';
import 'package:doctari/widgets/custom_text_form_field.dart';
import 'package:doctari/widgets/custom_drop_down.dart';
import 'package:doctari/widgets/custom_checkbox_button.dart';
import 'package:doctari/widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../Services/API_services.dart';

class SignUpScreenThreeScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String Dob;
  final String gender;
  final String phoneNumber;

  SignUpScreenThreeScreen(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.Dob,
      required this.email,
      required this.gender,
      required this.phoneNumber})
      : super(
          key: key,
        );

  @override
  State<SignUpScreenThreeScreen> createState() =>
      _SignUpScreenThreeScreenState();
}

class _SignUpScreenThreeScreenState extends State<SignUpScreenThreeScreen> {
  TextEditingController documentController = TextEditingController();

  TextEditingController licenseNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  TextEditingController cityNameController = TextEditingController();

  bool isShowPassword = false;

  bool isShowConfirmPassword = false;

  bool _isLoading = false;

  String? city;

  bool iagreewiththeTermsofServicePri = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DropdownItem? country;
  List<DropdownItem> dropdownItemList = [
    DropdownItem(value: '1', label: 'Country One'),
    DropdownItem(value: '2', label: 'Country Two'),
    // Add more countries as needed, with their respective primary key values
  ];
  List<String> dropdownItemList1 = [
    "city One",
    "city Two",
    "city Three",
  ];

  List<String> _countries = [];

  String? _selectedCountry;

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

  void initState() {
    super.initState();
    _fetchCountries();
  }

  Api_Services _apiService = Api_Services();


  void _registerpatient() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // if (_selectedCountry != null) {
      //   // Perform registration with the selected country
      //   bool registrationSuccessful = await _apiService.registerDoctor(
      //     // Pass other registration parameters along with the selected country
      //     // For example:
      //     // firstName, lastName, email, password, etc.
      //     country: _selectedCountry!,
      //   );
      bool registerDoctor = await _apiService.registerPatient(
          "${widget.email}",
          passwordController.text.toString(),
          "${widget.firstName}",
          "${widget.lastName}",
          documentController.text.toString(),
          "${widget.Dob}",
          "${widget.gender}",
          "${widget.phoneNumber}",
          cityNameController.text.toString(),
          licenseNumberController.text.toString(),
        _selectedCountry.toString(),
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
        debugPrint("license number: ${licenseNumberController.text.toString()}");
        debugPrint("city: ${cityNameController.text.toString()}");
        debugPrint("email: ${widget.email}");
        debugPrint("document number: ${documentController.text.toString()}");
        debugPrint("password: ${passwordController.text.toString()}");
        debugPrint("country: ${_selectedCountry.toString()}");


        Navigator.push(context,MaterialPageRoute(
            builder:(context) => (PatientLoginScreen())//Replace with patient Bottom Navigation
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
  // Future<void> registerPatient(
  //   String email,
  //   String password,
  //   String firstName,
  //   String lastName,
  //   String identityDoc,
  //   String Dob,
  //   String gender,
  //   String telephone,
  //   String country,
  //   String city,
  //   String license,
  // ) async {
  //   String apiUrl =
  //       "https://api-b2c-refactor.doctari.com/patient/account/signup/";

  //   var headers = {
  //     'Content-Type': 'application/json',
  //     // Add any additional headers if required, such as an API key
  //   };

  //   var body = {
  //     "email": email,
  //     "password": password,
  //     "first_name": firstName,
  //     "last_name": lastName,
  //     "identity_document": identityDoc,
  //     "date_of_birth": Dob,
  //     "gender": gender,
  //     "telephone": telephone,
  //     "country": country,
  //     "city": city,
  //     "license_number": license,
  //     // "weight": 12,
  //     // "height": 200,
  //     // "surgeries": ""
  //   };

  //   try {
  //     print("Sending registration request to: $apiUrl");
  //     print("Request body: $body");

  //     var response = await http.post(Uri.parse(apiUrl),
  //         headers: headers, body: json.encode(body));

  //     print("Response status code: ${response.statusCode}");
  //     print("Response body: ${response.body}");

  //     if (response.statusCode == 200) {
  //       // Registration successful
  //       print("Patient registered successfully!");
  //     } else {
  //       // Registration failed
  //       print("Failed to register patient: ${response.reasonPhrase}");
  //     }
  //   } catch (error) {
  //     print("Error registering patient: $error");
  //   }
  // }
  Future<void> registerPatient(
    String email,
    String password,
    String firstName,
    String lastName,
    String identityDoc,
    String Dob,
    String gender,
    String telephone,
    DropdownItem? country, // Change parameter type to DropdownItem
    String city,
    String license,
  ) async {
    String apiUrl =
        "https://api-b2c-refactor.doctari.com/patient/account/signup/";

    var headers = {
      'Content-Type': 'application/json',
      // Add any additional headers if required, such as an API key
    };

    var body = {
      "email": email,
      "password": password,
      "first_name": firstName,
      "last_name": lastName,
      "identity_document": identityDoc,
      "date_of_birth": Dob,
      "gender": gender,
      "telephone": telephone,
      "country": country?.value, // Access value property
      "city": city,
      "license_number": license,
      // "weight": 12,
      // "height": 200,
      // "surgeries": ""
    };

    try {
      print("Sending registration request to: $apiUrl");
      print("Request body: $body");

      var response = await http.post(Uri.parse(apiUrl),
          headers: headers, body: json.encode(body));

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Registration successful
        print("Patient registered successfully!");
      } else {
        // Registration failed
        print("Failed to register patient: ${response.reasonPhrase}");
      }
    } catch (error) {
      print("Error registering patient: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              _buildDocumentNumber(context),
              SizedBox(height: 20.v),
              _buildName(context),
              SizedBox(height: 20.v),
              _buildCountryList(context),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 19),
              //   child: DropdownButtonFormField<DropdownItem>(
              //     decoration: InputDecoration(
              //       hintText: 'Country',
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(12),
              //         borderSide: BorderSide(
              //           color: Colors.grey.withOpacity(0.6),
              //           width: 1,
              //         ),
              //       ),
              //       contentPadding:
              //           EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              //     ),
              //     value: country, // Make sure country is of type DropdownItem
              //     items: dropdownItemList.map((item) {
              //       return DropdownMenuItem<DropdownItem>(
              //         value: item,
              //         child: Text(
              //           item.label,
              //           style: TextStyle(
              //             fontSize: 16,
              //             color: Colors.black,
              //           ),
              //         ),
              //       );
              //     }).toList(),
              //     onChanged: (selectedItem) {
              //       setState(() {
              //         country =
              //             selectedItem; // Assign the selected item directly
              //       });
              //     },
              //   ),
              // ),
              SizedBox(height: 20.v),
              _buildCityName(context),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 19),
              //   child: CustomDropDown(
              //     hintText: "City",
              //     icon: Icon(
              //       Icons.arrow_drop_down,
              //       size: 30,
              //       color: Colors.grey.shade400,
              //     ),
              //     hintStyle: TextStyle(
              //         color: Colors.grey, fontWeight: FontWeight.w500),
              //     alignment: Alignment.center,
              //     width: MediaQuery.of(context).size.width * 0.9,
              //     items: dropdownItemList1,
              //     onChanged: (value) {
              //       city = value;
              //     },
              //   ),
              // ),
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
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => PatientLoginScreen())));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account? ",
                      style: CustomTextStyles.bodyMediumff000000,
                    ),
                    Text(
                      "Log in",
                      style: CustomTextStyles.bodyMediumff004687,
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
              onTap: () {
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
        controller: documentController,
        hintText: "Document Number",
        textInputType: TextInputType.number,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 25.h,
          vertical: 16.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
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
        controller: licenseNumberController,
        hintText: "License Number",
        textInputType: TextInputType.number,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 25.h,
          vertical: 16.v,
        ),
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
        controller: passwordController,
        hintText: "Password",
        hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        textInputType: TextInputType.visiblePassword,
        suffix: IconButton(
            onPressed: () {
              if (isShowPassword) {
                isShowPassword = false;
              } else {
                isShowPassword = true;
              }
              setState(() {});
            },
            icon: Icon(
              isShowPassword ? Icons.visibility : Icons.visibility_off,
              color: Color(0xff677294),
            )),
        suffixConstraints: BoxConstraints(
          maxHeight: 54.v,
        ),
        obscureText: !isShowPassword,
      ),
    );
  }
  /// Section Widget
  Widget _buildConfirmpassword(BuildContext context) {
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
        controller: confirmpasswordController,
        hintText: "Confirm Password",
        hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        suffix: IconButton(
            onPressed: () {
              if (isShowConfirmPassword) {
                isShowConfirmPassword = false;
              } else {
                isShowConfirmPassword = true;
              }
              setState(() {});
            },
            icon: Icon(
              isShowConfirmPassword ? Icons.visibility : Icons.visibility_off,
              color: Color(0xff677294),
            )),
        suffixConstraints: BoxConstraints(
          maxHeight: 54.v,
        ),
        obscureText: !isShowConfirmPassword,
      ),
    );
  }

  /// Section Widget
  Widget _buildIagreewiththeTermsofServicePri(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 50.h,
        right: 64.h,
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
    return _isLoading?CircularProgressIndicator(color: Colors.blue,strokeWidth: 4.0,):CustomElevatedButton(
      width: MediaQuery.of(context).size.width * 0.8,
      onPressed: () async {
        _registerpatient();
        // await registerPatient(
        //     widget.email,
        //     passwordController.text.toString(),
        //     widget.firstName,
        //     widget.lastName,
        //     documentController.text.toString(),
        //     widget.Dob,
        //     widget.gender,
        //     widget.phoneNumber,
        //     country.toString(),
        //     city!,
        //     licenseNumberController.text.toString());
        ///
        // await registerPatient(
        //   widget.email,
        //   passwordController.text.toString(),
        //   widget.firstName,
        //   widget.lastName,
        //   documentController.text.toString(),
        //   widget.Dob,
        //   widget.gender,
        //   widget.phoneNumber,
        //   country, // Pass the DropdownItem object directly
        //   city!,
        //   licenseNumberController.text.toString(),
        // );
        //
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => PatientBottomNavigation(),
        //     ));
        // debugPrint("first Name: ${widget.firstName}");
        // debugPrint("last Name: ${widget.lastName}");
        //
        // debugPrint("Birthday: ${widget.Dob}");
        //
        // debugPrint("gender: ${widget.gender}");
        // debugPrint("phone number: ${widget.phoneNumber}");
        // debugPrint("email: ${widget.email}");
        // debugPrint("document id: ${documentController.text.toString()}");
        // debugPrint(
        //     "lisence number: ${licenseNumberController.text.toString()}");
        // debugPrint("country: ${country}");
        // debugPrint("city: ${city}");
        // debugPrint("document id: ${passwordController.text.toString()}");
        // debugPrint("document id: ${confirmpasswordController.text.toString()}");
      },
      text: "Sign Up",
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      buttonStyle: CustomButtonStyles.fillPrimary,
      buttonTextStyle: CustomTextStyles.titleMediumOnErrorContainerSemiBold,
    );
  }

  /// Section Widget
  Widget _buildCountryList(BuildContext context) {
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
      ),
    );
  }
}

// Define a custom class to represent each dropdown item
class DropdownItem {
  final String value;
  final String label;

  DropdownItem({required this.value, required this.label});
}
