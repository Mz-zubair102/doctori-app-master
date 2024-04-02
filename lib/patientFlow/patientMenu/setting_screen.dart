import 'package:doctari/widgets/app_bar/custom_app_bar.dart';
import 'package:doctari/widgets/app_bar/appbar_subtitle_nine.dart';
import 'package:doctari/widgets/custom_text_form_field.dart';
import 'package:doctari/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:doctari/core/app_export.dart';

// ignore_for_file: must_be_immutable
class PatientSettingScreen extends StatefulWidget {
  PatientSettingScreen({Key? key}) : super(key: key);

  @override
  State<PatientSettingScreen> createState() => _PatientSettingScreenState();

}

class _PatientSettingScreenState extends State<PatientSettingScreen> {
  TextEditingController passwordController = TextEditingController();

  TextEditingController newpasswordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  bool currentPassword = false;

  bool newPassword = false;

  bool confirmPassword = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Settings",
                style: CustomTextStyles.titleLargeBluegray800.copyWith(
                  color: appTheme.blueGray800,
                ),
              ),
            ),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: 375.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.h, vertical: 25.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Change Password",
                                      style:
                                          CustomTextStyles.titleLargeBlack900),
                                  SizedBox(height: 26.v),
                                  _buildPassword(context),
                                  SizedBox(height: 17.v),
                                  _buildNewpassword(context),
                                  SizedBox(height: 20.v),
                                  _buildConfirmpassword(context),
                                  SizedBox(height: 5.v)
                                ]))))),
            bottomNavigationBar: _buildChangePassword(context)
        )
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 70.v,
        leadingWidth: 50.h,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.grey,
          size: 20,
        )
        ),
        title: AppbarSubtitleNine(
            text: "Settings", margin: EdgeInsets.only(left: 19.h))
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
        controller: passwordController,
        hintText: "Current Password",
        hintStyle: CustomTextStyles.titleMediumBluegray500,
        textInputType: TextInputType.visiblePassword,
        suffix: IconButton(
            onPressed: (){
              if(currentPassword){
                currentPassword = false;
              }
              else{
                currentPassword = true;
              }
              setState(() {

              });
            },
            icon: Icon(currentPassword?Icons.visibility: Icons.visibility_off, color: Color(0xff677294),)
        ),
        suffixConstraints: BoxConstraints(maxHeight: 54.v),
        obscureText: !currentPassword);
  }

  /// Section Widget
  Widget _buildNewpassword(BuildContext context) {
    return CustomTextFormField(
        controller: newpasswordController,
        hintText: "New Password",
        hintStyle: CustomTextStyles.titleMediumBluegray500,
        textInputType: TextInputType.visiblePassword,
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
            },
            icon: Icon(newPassword?Icons.visibility: Icons.visibility_off, color: Color(0xff677294),)
        ),
        suffixConstraints: BoxConstraints(maxHeight: 54.v),
        obscureText: !newPassword);
  }

  /// Section Widget
  Widget _buildConfirmpassword(BuildContext context) {
    return CustomTextFormField(
        controller: confirmpasswordController,
        hintText: "Confirm Password",
        hintStyle: CustomTextStyles.titleMediumBluegray500,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
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
            },
            icon: Icon(confirmPassword?Icons.visibility: Icons.visibility_off, color: Color(0xff677294),)
        ),
        suffixConstraints: BoxConstraints(maxHeight: 54.v),
        obscureText: !confirmPassword
    );
  }

  /// Section Widget
  Widget _buildChangePassword(BuildContext context) {
    return CustomElevatedButton(
        height: 54.v,
        text: "Change Password",
        margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 27.v),
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.titleMediumOnErrorContainer_1);
  }
}
