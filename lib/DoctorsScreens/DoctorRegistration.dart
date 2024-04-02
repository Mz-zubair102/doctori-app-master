import 'package:doctari/Services/API_services.dart';
import 'package:doctari/patientFlow/registration_screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:doctari/widgets/custom_text_form_field.dart';
import 'package:flutter/widgets.dart';
import 'package:doctari/widgets/custom_icon_button.dart';
import 'package:doctari/core/app_export.dart';
import 'package:intl/intl.dart';
import 'DoctorRegistration2.dart';

class DoctorRegistration extends StatefulWidget {
  DoctorRegistration({Key? key})
      : super(
    key: key,
  );

  @override
  State<DoctorRegistration> createState() => _DoctorRegistrationState();
}

class _DoctorRegistrationState extends State<DoctorRegistration> {

  TextEditingController nameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController birthDateController = TextEditingController();



  String selectedGender = '';


  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    Text(
                      "Register as a Doctor",
                      style: CustomTextStyles.headlineSmallff000000,
                    ),
                    SizedBox(height: 45.v),
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
                            onTap: (){
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
                            onTap: (){
                              debugPrint("first Name: ${nameController.text.toString()}");
                              debugPrint("last Name: ${lastNameController.text.toString()}");
                              debugPrint("Birthday: ${birthDateController.text.toString()}");
                              debugPrint("gender: ${selectedGender}");
                              debugPrint("phone number: ${phoneNumberController.text.toString()}");
                              debugPrint("email: ${emailController.text.toString()}");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DoctorRegistration2(
                                          Dob:birthDateController.text.toString(),
                                          email: emailController.text.toString(),
                                          firstName:nameController.text.toString(),
                                          gender: selectedGender,
                                          lastName:lastNameController.text.toString(),
                                          phoneNumber: phoneNumberController.text.toString(),
                                        )
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 15.h),
                              child: CustomIconButton(
                                // onTap: (){
                                //   Navigator.pop(context);
                                // },
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
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Have an account? ",
                              style: CustomTextStyles.bodyMediumff000000,
                            ),
                            TextSpan(
                              text: "Log in",
                              style: CustomTextStyles.bodyMediumff004687,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
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
        borderSide: BorderSide(
          color: Colors.grey.shade300,
          width: 1
        )
      ),
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
          borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 1
          )
      ),
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
      setState(() {
        birthDateController.text = DateFormat('yyyy-MM-dd').format(picked);
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
              fontSize: 15, color: Colors.grey.shade500,
              fontWeight: FontWeight.w500
          ),
          controller: birthDateController,
          decoration: InputDecoration(
            suffix: Text("YYY-MM-DD"),
            labelText: "Birthdate",
            enabled: false,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8)
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGender(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              8
          ),
          border: Border.all(
              color: Colors.grey.shade300,
              width: 1
          )
      ),
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
                fillColor: MaterialStatePropertyAll(
                    Colors.grey.shade300
                ),
                onChanged: (String? value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),
              Text("Male", style: TextStyle(color: Colors.grey),),
              SizedBox(width: 20),
              Radio(
                value: "F",
                groupValue: selectedGender,
                activeColor: Colors.grey.shade300,
                fillColor: MaterialStatePropertyAll(
                    Colors.grey.shade300
                ),
                onChanged: (String? value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),
              Text("Female", style: TextStyle(color: Colors.grey),),
              SizedBox(width: 20),
              Radio(
                value: "O",
                activeColor: Colors.grey.shade300,
                fillColor: MaterialStatePropertyAll(
                    Colors.grey.shade300
                ),
                groupValue: selectedGender,
                onChanged: (String? value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),
              Text("Custom", style: TextStyle(color: Colors.grey),),
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
      contentPadding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 16.v,
      ),
      borderDecoration: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade300,
          width: 1
        )
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: "Email",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.emailAddress,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 16.v,
      ),
      borderDecoration: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 1
          )
      ),
    );
  }

}