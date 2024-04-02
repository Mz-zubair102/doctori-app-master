import 'package:doctari/patientFlow/registration_screens/sign_up_screen_two_for_patient_screen/sign_up_screen_two_for_patient_screen.dart';
import 'package:doctari/presentation/patient_login_screen/patient_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Added import for showDatePicker
import 'package:doctari/widgets/custom_text_form_field.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../../../Services/API_services.dart';
import 'widgets/gender_item_widget.dart';
import 'package:doctari/widgets/custom_icon_button.dart';
import 'package:doctari/core/app_export.dart';

class SignUpScreenOneForPatientScreen extends StatefulWidget {
  SignUpScreenOneForPatientScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SignUpScreenOneForPatientScreen> createState() =>
      _SignUpScreenOneForPatientScreenState();
}

class _SignUpScreenOneForPatientScreenState
    extends State<SignUpScreenOneForPatientScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  String selectedGender = ''; // Add a variable to store the selected gender

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  // Added birthDateController
  TextEditingController birthDateController = TextEditingController();

  bool passwordVisible = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  // bool _isLoading = false;


  bool isTab1 = false;
  bool isTab2 = false;
  bool isTab3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                vertical: 23.v,
              ),
              child: Column(
                children: [
                  SizedBox(height: 21.v),
                  SizedBox(
                    width: 218.h,
                    child: RichText(
                      text: TextSpan(
                        style: CustomTextStyles.headlineSmallff000000,
                        children: [
                          TextSpan(
                            text: "Find ",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: "Doctors, \n",
                            style: TextStyle(color: Color(0xff00008B)),
                          ),
                          TextSpan(
                            text: "Book ",
                            style: CustomTextStyles.headlineSmallff000000,
                          ),
                          TextSpan(
                            text: "Appointments",
                            style: TextStyle(color: Color(0xff00008B)),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 55.v),
                  _buildName(context),
                  SizedBox(height: 20.v),
                  _buildLastName(context),
                  SizedBox(height: 20.v),
                  _buildBirthdate(context),
                  SizedBox(height: 20.v),
                  _buildGender(context),
                  SizedBox(height: 20.v),
                  _buildPhoneNumber(context),
                  SizedBox(height: 20.v),
                  _buildEmail(context),
                  SizedBox(height: 22.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomIconButton(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          height: 54.adaptSize,
                          width: 54.adaptSize,
                          padding: EdgeInsets.all(20.h),
                          decoration: IconButtonStyleHelper.outlineBlueGray,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgArrowLeftGray50002,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // _registerPatient();
                            debugPrint(
                                "first Name: ${nameController.text.toString()}");
                            debugPrint(
                                "last Name: ${lastNameController.text.toString()}");

                            debugPrint(
                                "Birthday: ${birthDateController.text.toString()}");

                            debugPrint("gender: ${selectedGender}");
                            debugPrint(
                                "phone number: ${phoneNumberController.text.toString()}");
                            debugPrint(
                                "email: ${emailController.text.toString()}");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreenThreeScreen(
                                        Dob:
                                            birthDateController.text.toString(),
                                        email: emailController.text.toString(),
                                        firstName:
                                            nameController.text.toString(),
                                        gender: selectedGender,
                                        lastName:
                                            lastNameController.text.toString(),
                                        phoneNumber: phoneNumberController.text
                                            .toString(),
                                      )),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.h),
                            child: CustomIconButton(
                              height: 54.adaptSize,
                              width: 54.adaptSize,
                              padding: EdgeInsets.all(20.h),
                              decoration: IconButtonStyleHelper.fillPrimary,
                              child: CustomImageView(
                                imagePath: ImageConstant.imgArrowRight,
                                color: Colors.white,
                                height: 60,
                                width: 60,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 51.v),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PatientLoginScreen(),
                          ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Have an account? ",
                          style: CustomTextStyles.bodyMediumff000000,
                        ),
                        Text(
                          "Log in ",
                          style: CustomTextStyles.bodyMediumff004687,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      hintText: "Name",
      contentPadding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 16.v,
      ),
      borderDecoration: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1)),
    );
  }

  /// Section Widget
  Widget _buildLastName(BuildContext context) {
    return CustomTextFormField(
      controller: lastNameController,
      hintText: "Last Name",
      contentPadding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 16.v,
      ),
      borderDecoration: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1)),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      String formattedDate = DateFormat('yyy-MM-dd').format(picked);
      setState(() {
        birthDateController.text = formattedDate;
      });
    }
  }

  /// Section Widget
  Widget _buildBirthdate(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _selectDate(context);
      },
      child: AbsorbPointer(
        child: TextFormField(
          readOnly: true,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w500,
          ),
          controller: birthDateController,
          decoration: InputDecoration(
            suffix: Text("YYYY-MM-DD"),
            labelText: "Birthdate",
            enabled: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGender(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gender",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Row(
            children: [
              Radio(
                value: "M",
                activeColor: Colors.grey.shade300,
                groupValue: selectedGender,
                fillColor: MaterialStatePropertyAll(Colors.grey.shade300),
                onChanged: (String? value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),
              Text(
                "M",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(width: 20),
              Radio(
                value: "F",
                groupValue: selectedGender,
                activeColor: Colors.grey.shade300,
                fillColor: MaterialStatePropertyAll(Colors.grey.shade300),
                onChanged: (String? value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),
              Text(
                "F",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(width: 20),
              Radio(
                value: "O",
                activeColor: Colors.grey.shade300,
                fillColor: MaterialStatePropertyAll(Colors.grey.shade300),
                groupValue: selectedGender,
                onChanged: (String? value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),
              Text(
                "Custom",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );

  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return CustomTextFormField(
      controller: phoneNumberController,
      hintText: "Phone Number",
      textInputType: TextInputType.phone,
      borderDecoration: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1)),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 16.v,
      ),
    );
  }


  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: "Email",
      borderDecoration: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1)),
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.emailAddress,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 16.v,
      ),
    );
  }
}


