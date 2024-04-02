import 'package:doctari/core/app_export.dart';
import 'package:doctari/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:doctari/widgets/custom_text_form_field.dart';

class ForgetPasswordThreeBottomSheet extends StatefulWidget {
  ForgetPasswordThreeBottomSheet({Key? key}) : super(key: key);

  @override
  _ForgetPasswordThreeBottomSheetState createState() =>
      _ForgetPasswordThreeBottomSheetState();
}

class _ForgetPasswordThreeBottomSheetState
    extends State<ForgetPasswordThreeBottomSheet> {
  TextEditingController _bottomSheetPasswordController =
      TextEditingController();
  TextEditingController _bottomSheetConfirmPasswordController =
      TextEditingController();

  bool newPassword = false;
  bool confirmPassword = false;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: MediaQuery.of(context).size.width,
        height: 550,
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
      
            Text(
              'Reset Password',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                color: Colors.black,
                fontFamily: 'Nunito'
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Set the new password for your account so you can\nlogin and access all the features',
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
            SizedBox(height: 30.0),
            _buildPassword(context),
            SizedBox(height: 25.0),
            _buildConfirmPassword(context),
            SizedBox(height: 30.0),
            _buildContinueButton(context),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return CustomElevatedButton(

      text: "Update Password",
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      buttonStyle: CustomButtonStyles.fillPrimary,
      buttonTextStyle: CustomTextStyles.titleMediumOnErrorContainerSemiBold,
      onPressed: () {
        Navigator.pop(context);
        ScaffoldMessenger
            .of(context)
            .showSnackBar(
            SnackBar(
              backgroundColor: Colors.white,
                content: Text(
                  "Your Password is Successfully Updated",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito'
                  ),
                )
            ),
        );
      },
    );
  }

  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      controller: _bottomSheetPasswordController,
      hintText: "New Password",
      textInputType: TextInputType.emailAddress,
      borderDecoration: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          width: 1,
          color: Colors.grey.shade300
        )
      ),
      suffix: IconButton(
          onPressed: (){
            if(newPassword){
              newPassword = false;
            }
            else{
              newPassword = true;
            }
            setState(() {
              
            });
            
          }, icon: Icon(
        newPassword?
        Icons.visibility:
        Icons.visibility_off,
        size: 20,
        color: Color(0xff677294),
      )),
      obscureText: !newPassword,
    );
  }

  Widget _buildConfirmPassword(BuildContext context) {
    return CustomTextFormField(
      controller: _bottomSheetConfirmPasswordController,
      hintText: "Re-enter Password",
      textInputType: TextInputType.emailAddress,
        borderDecoration: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 1,
                color: Colors.grey.shade300
            )
        ),
        suffix: IconButton(
            onPressed: (){
              if(confirmPassword){
                confirmPassword = false;
              }
              else{
                confirmPassword = true;
              }
              setState(() {

              });

            }, icon: Icon(
          confirmPassword?
          Icons.visibility:
          Icons.visibility_off,
          size: 20,
          color: Color(0xff677294),
        )),
      obscureText: !confirmPassword,
    );
  }

  @override
  void dispose() {
    _bottomSheetPasswordController.dispose();
    super.dispose();
  }
}
