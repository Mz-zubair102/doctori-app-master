import 'package:doctari/core/app_export.dart';
import 'package:doctari/patientFlow/registration_screens/login_screen/forget_password_bottom_sheet_two.dart/forget_password_bottom_sheet_two.dart';
import 'package:doctari/widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctari/core/utils/image_constant.dart';
import 'package:doctari/widgets/custom_image_view.dart';
import 'package:doctari/widgets/custom_text_form_field.dart';
import 'package:flutter/widgets.dart';

import '../../../../Services/API_services.dart';

class ForgetPasswordOneBottomSheet extends StatefulWidget {
  ForgetPasswordOneBottomSheet({Key? key}) : super(key: key);

  @override
  _ForgetPasswordOneBottomSheetState createState() =>
      _ForgetPasswordOneBottomSheetState();
}

class _ForgetPasswordOneBottomSheetState
    extends State<ForgetPasswordOneBottomSheet> {

  double bottomSheetHeight = 500;

  TextEditingController _bottomSheetEmailController = TextEditingController();

  bool _isLoading=false;

  Api_Services api_Services = Api_Services();

  void initiatePasswordReset(String email) async {
    setState(() {
      _isLoading = true;
    });

    bool resetSuccessful = await api_Services.requestResetPassword(email);

    setState(() {
      _isLoading = false;
    });
    if (resetSuccessful) {

      initiatePasswordReset(_bottomSheetEmailController.text.toString());
      Navigator.pop(context);
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ForgetPasswordTwoBottomSheet();
        },
      );
      // Password reset request successful
      ScaffoldMessenger
          .of(context)
          .showSnackBar(
        SnackBar(
            backgroundColor: Colors.white,
            content: Text(
              "Password reset request successful",
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
      // Password reset request failed
      // Display an error message to the user
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Failed",
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
            content: Text("Password reset request failed try Again!", textAlign: TextAlign.center,),
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Container(
        height: bottomSheetHeight,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 5,
                  width: MediaQuery.of(context).size.width*0.3,
                  decoration: BoxDecoration(
                      color: Color(0xffC4C4C4),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ],
            ),

            SizedBox(height: 30,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forget password',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: 'Nunito'
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Enter your email for the verification process we will send a 4-digit code to your email.',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
              ],
            ),

            SizedBox(height: 30.0),
            GestureDetector(
                onTap: (){
                  bottomSheetHeight = 500;
                },
                child: _buildEmail(context)
            ),
            SizedBox(height: 30.0),
            _buildContinueButton(context),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return _isLoading?Center(child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 4.0,)):CustomElevatedButton(
      text: "Continue",
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      buttonStyle: CustomButtonStyles.fillPrimary,
      buttonTextStyle: CustomTextStyles.titleMediumOnErrorContainerSemiBold,
      onPressed: () {
        initiatePasswordReset(_bottomSheetEmailController.text.toString());
        // Navigator.pop(context);
        // showModalBottomSheet(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return ForgetPasswordTwoBottomSheet();
        //   },
        // );
      },
    );
  }

  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      controller: _bottomSheetEmailController,
      hintText: "Email",
      borderDecoration: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
          width: 1
        )
      ),
      textInputType: TextInputType.emailAddress,
    );
  }

  @override
  void dispose() {
    _bottomSheetEmailController.dispose();
    super.dispose();
  }
}
