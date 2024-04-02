import 'package:doctari/widgets/app_bar/custom_app_bar.dart';import 'package:doctari/widgets/app_bar/appbar_leading_iconbutton.dart';import 'package:doctari/widgets/app_bar/appbar_subtitle_eleven.dart';import 'package:doctari/widgets/custom_icon_button.dart';import 'package:doctari/widgets/custom_floating_text_field.dart';import 'package:doctari/widgets/custom_radio_button.dart';import '../profile_screen_one_screen/widgets/dentist_item_widget.dart';import '../profile_screen_one_screen/widgets/dentist2_item_widget.dart';import '../profile_screen_one_screen/widgets/dentist4_item_widget.dart';import '../profile_screen_one_screen/widgets/dentist6_item_widget.dart';import 'package:doctari/widgets/custom_elevated_button.dart';import 'package:flutter/material.dart';import 'package:doctari/core/app_export.dart';
// ignore_for_file: must_be_immutable
class ProfileScreenOneScreen extends StatelessWidget {ProfileScreenOneScreen({Key? key}) : super(key: key);

TextEditingController nameController = TextEditingController();

TextEditingController lastNameController = TextEditingController();

TextEditingController mobileNoController = TextEditingController();

TextEditingController dateOfBirthController = TextEditingController();

TextEditingController emailController = TextEditingController();

String gender = "";

List<String> radioList = ["lbl_male", "lbl_female", "lbl_others"];

TextEditingController countryController = TextEditingController();

TextEditingController cityController = TextEditingController();

TextEditingController nYGSGController = TextEditingController();

TextEditingController weightKgController = TextEditingController();

TextEditingController heightCmController = TextEditingController();

TextEditingController selectMedicineController = TextEditingController();

TextEditingController selectAllergieController = TextEditingController();

TextEditingController selectDiseaseController = TextEditingController();

TextEditingController nameSurgeriesController = TextEditingController();

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: appTheme.gray50, resizeToAvoidBottomInset: false, body: Form(key: _formKey, child: SizedBox(width: 375.h, child: Column(children: [_buildProfile(context), SizedBox(height: 14.v), Expanded(child: SingleChildScrollView(child: Container(margin: EdgeInsets.only(bottom: 5.v), padding: EdgeInsets.symmetric(horizontal: 20.h), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Personal information", style: CustomTextStyles.titleMediumBluegray90005), SizedBox(height: 8.v), _buildName(context), SizedBox(height: 11.v), _buildLastName(context), SizedBox(height: 11.v), _buildMobileNo(context), SizedBox(height: 11.v), _buildDateOfBirth(context), SizedBox(height: 11.v), _buildEmail(context), SizedBox(height: 11.v), _buildLocation(context), SizedBox(height: 11.v), _buildCountry(context), SizedBox(height: 11.v), _buildCity(context), SizedBox(height: 11.v), _buildNYGSG(context), SizedBox(height: 14.v), Text("Medical Data", style: CustomTextStyles.titleMediumBluegray90005), SizedBox(height: 8.v), _buildWeightKg(context), SizedBox(height: 11.v), _buildHeightCm(context), SizedBox(height: 11.v), _buildSelectMedicine(context), SizedBox(height: 11.v), _buildDentist(context), SizedBox(height: 11.v), _buildSelectAllergie(context), SizedBox(height: 11.v), _buildDentist1(context), SizedBox(height: 11.v), _buildSelectDisease(context), SizedBox(height: 11.v), _buildDentist2(context), SizedBox(height: 11.v), _buildNameSurgeries(context), SizedBox(height: 11.v), _buildDentist3(context)]))))]))), bottomNavigationBar: _buildContinue(context))); } 
/// Section Widget
Widget _buildProfile(BuildContext context) { return Container(padding: EdgeInsets.symmetric(vertical: 9.v), decoration: AppDecoration.fillPrimary.copyWith(borderRadius: BorderRadiusStyle.customBorderBL30), child: Column(mainAxisSize: MainAxisSize.min, children: [CustomAppBar(height: 30.v, leadingWidth: 50.h, leading: AppbarLeadingIconbutton(imagePath: ImageConstant.imgArrowLeftBlueGray500, margin: EdgeInsets.only(left: 20.h), onTap: () {onTapArrowLeft(context);}), title: AppbarSubtitleEleven(text: "Profile", margin: EdgeInsets.only(left: 19.h))), SizedBox(height: 34.v), Text("Set up your profile", style: CustomTextStyles.titleMediumOnErrorContainer_1), SizedBox(height: 8.v), Container(width: 282.h, margin: EdgeInsets.only(left: 46.h, right: 45.h), child: Text("Update your profile to connect your doctor with\nbetter impression.", maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: CustomTextStyles.bodyMediumOnErrorContainer.copyWith(height: 1.68))), SizedBox(height: 20.v), SizedBox(height: 130.v, width: 138.h, child: Stack(alignment: Alignment.bottomRight, children: [CustomImageView(imagePath: ImageConstant.imgEllipse164, height: 130.adaptSize, width: 130.adaptSize, radius: BorderRadius.circular(65.h), alignment: Alignment.centerLeft), Padding(padding: EdgeInsets.only(bottom: 13.v), child: CustomIconButton(height: 36.adaptSize, width: 36.adaptSize, padding: EdgeInsets.all(8.h), decoration: IconButtonStyleHelper.fillBlueGray, alignment: Alignment.bottomRight, child: CustomImageView(imagePath: ImageConstant.imgCamera)))])), SizedBox(height: 20.v)])); } 
/// Section Widget
Widget _buildName(BuildContext context) { return CustomFloatingTextField(controller: nameController, labelText: "Name", labelStyle: theme.textTheme.bodyLarge!, hintText: "Name", suffix: Container(margin: EdgeInsets.symmetric(horizontal: 20.h), child: CustomImageView(imagePath: ImageConstant.imgEdit, height: 14.v, width: 15.h)), suffixConstraints: BoxConstraints(maxHeight: 60.v)); } 
/// Section Widget
Widget _buildLastName(BuildContext context) { return CustomFloatingTextField(controller: lastNameController, labelText: "Last Name", labelStyle: theme.textTheme.bodyLarge!, hintText: "Last Name", suffix: Container(margin: EdgeInsets.symmetric(horizontal: 20.h), child: CustomImageView(imagePath: ImageConstant.imgEdit, height: 14.v, width: 15.h)), suffixConstraints: BoxConstraints(maxHeight: 60.v)); } 
/// Section Widget
Widget _buildMobileNo(BuildContext context) { return CustomFloatingTextField(controller: mobileNoController, labelText: "Contact Number", labelStyle: theme.textTheme.bodyLarge!, hintText: "Contact Number", textInputType: TextInputType.number, suffix: Container(margin: EdgeInsets.symmetric(horizontal: 20.h), child: CustomImageView(imagePath: ImageConstant.imgEdit, height: 14.v, width: 15.h)), suffixConstraints: BoxConstraints(maxHeight: 60.v)); } 
/// Section Widget
Widget _buildDateOfBirth(BuildContext context) { return CustomFloatingTextField(controller: dateOfBirthController, labelText: "Date of birth", labelStyle: CustomTextStyles.bodyLargeRubik, hintText: "Date of birth", hintStyle: CustomTextStyles.bodyLargeRubik, suffix: Container(margin: EdgeInsets.symmetric(horizontal: 20.h), child: CustomImageView(imagePath: ImageConstant.imgEdit, height: 14.v, width: 15.h)), suffixConstraints: BoxConstraints(maxHeight: 60.v), contentPadding: EdgeInsets.fromLTRB(20.h, 27.v, 20.h, 13.v)); } 
/// Section Widget
Widget _buildEmail(BuildContext context) { return CustomFloatingTextField(controller: emailController, labelText: "Email", labelStyle: theme.textTheme.bodyLarge!, hintText: "Email", textInputType: TextInputType.emailAddress, suffix: Container(margin: EdgeInsets.symmetric(horizontal: 20.h), child: CustomImageView(imagePath: ImageConstant.imgEdit, height: 14.v, width: 15.h)), suffixConstraints: BoxConstraints(maxHeight: 60.v)); } 
/// Section Widget
Widget _buildLocation(BuildContext context) { return Container(padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 7.v), decoration: AppDecoration.fillOnErrorContainer1.copyWith(borderRadius: BorderRadiusStyle.roundedBorder12), child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [Text("Gender", style: theme.textTheme.labelMedium), SizedBox(height: 11.v), Padding(padding: EdgeInsets.only(right: 31.h), child: Row(children: [Padding(padding: EdgeInsets.only(top: 1.v), child: CustomRadioButton(text: "Male", value: radioList[0], groupValue: gender, onChange: (value) {gender = value;})), Padding(padding: EdgeInsets.only(left: 27.h, bottom: 1.v), child: CustomRadioButton(text: "Female", value: radioList[1], groupValue: gender, onChange: (value) {gender = value;})), Padding(padding: EdgeInsets.only(left: 27.h, bottom: 1.v), child: CustomRadioButton(text: "Others", value: radioList[2], groupValue: gender, onChange: (value) {gender = value;}))])), SizedBox(height: 3.v)])); } 
/// Section Widget
Widget _buildCountry(BuildContext context) { return CustomFloatingTextField(controller: countryController, labelText: "Country", labelStyle: theme.textTheme.bodyLarge!, hintText: "Country", suffix: Container(margin: EdgeInsets.symmetric(horizontal: 20.h), child: CustomImageView(imagePath: ImageConstant.imgEdit, height: 14.v, width: 15.h)), suffixConstraints: BoxConstraints(maxHeight: 60.v)); } 
/// Section Widget
Widget _buildCity(BuildContext context) { return CustomFloatingTextField(controller: cityController, labelText: "City", labelStyle: theme.textTheme.bodyLarge!, hintText: "City", suffix: Container(margin: EdgeInsets.symmetric(horizontal: 20.h), child: CustomImageView(imagePath: ImageConstant.imgEdit, height: 14.v, width: 15.h)), suffixConstraints: BoxConstraints(maxHeight: 60.v)); } 
/// Section Widget
Widget _buildNYGSG(BuildContext context) { return CustomFloatingTextField(controller: nYGSGController, labelText: "Document Number", labelStyle: theme.textTheme.bodyLarge!, hintText: "Document Number", textInputType: TextInputType.number, suffix: Container(margin: EdgeInsets.symmetric(horizontal: 20.h), child: CustomImageView(imagePath: ImageConstant.imgEdit, height: 14.v, width: 15.h)), suffixConstraints: BoxConstraints(maxHeight: 60.v)); } 
/// Section Widget
Widget _buildWeightKg(BuildContext context) { return CustomFloatingTextField(controller: weightKgController, labelText: "Weight", labelStyle: theme.textTheme.bodyLarge!, hintText: "Weight", suffix: Container(margin: EdgeInsets.symmetric(horizontal: 20.h), child: CustomImageView(imagePath: ImageConstant.imgEdit, height: 14.v, width: 15.h)), suffixConstraints: BoxConstraints(maxHeight: 60.v)); } 
/// Section Widget
Widget _buildHeightCm(BuildContext context) { return CustomFloatingTextField(controller: heightCmController, labelText: "Height", labelStyle: theme.textTheme.bodyLarge!, hintText: "Height", suffix: Container(margin: EdgeInsets.symmetric(horizontal: 20.h), child: CustomImageView(imagePath: ImageConstant.imgEdit, height: 14.v, width: 15.h)), suffixConstraints: BoxConstraints(maxHeight: 60.v)); } 
/// Section Widget
Widget _buildSelectMedicine(BuildContext context) { return CustomFloatingTextField(controller: selectMedicineController, labelText: "Medicines", labelStyle: theme.textTheme.bodyLarge!, hintText: "Medicines", suffix: Container(margin: EdgeInsets.symmetric(horizontal: 20.h), child: CustomImageView(imagePath: ImageConstant.imgArrowdown, height: 8.v, width: 15.h)), suffixConstraints: BoxConstraints(maxHeight: 60.v)); } 
/// Section Widget
Widget _buildDentist(BuildContext context) { return Wrap(runSpacing: 10.v, spacing: 10.h, children: List<Widget>.generate(3, (index) => DentistItemWidget())); } 
/// Section Widget
Widget _buildSelectAllergie(BuildContext context) { return CustomFloatingTextField(controller: selectAllergieController, labelText: "Allergies", labelStyle: CustomTextStyles.bodyLargeRubik, hintText: "Allergies", hintStyle: CustomTextStyles.bodyLargeRubik, suffix: Container(margin: EdgeInsets.symmetric(horizontal: 20.h), child: CustomImageView(imagePath: ImageConstant.imgArrowdown, height: 8.v, width: 15.h)), suffixConstraints: BoxConstraints(maxHeight: 60.v)); } 
/// Section Widget
Widget _buildDentist1(BuildContext context) { return Wrap(runSpacing: 10.v, spacing: 10.h, children: List<Widget>.generate(3, (index) => Dentist2ItemWidget())); } 
/// Section Widget
Widget _buildSelectDisease(BuildContext context) { return CustomFloatingTextField(controller: selectDiseaseController, labelText: "Diseases", labelStyle: theme.textTheme.bodyLarge!, hintText: "Diseases", suffix: Container(margin: EdgeInsets.symmetric(horizontal: 20.h), child: CustomImageView(imagePath: ImageConstant.imgArrowdown, height: 8.v, width: 15.h)), suffixConstraints: BoxConstraints(maxHeight: 60.v)); } 
/// Section Widget
Widget _buildDentist2(BuildContext context) { return Wrap(runSpacing: 10.v, spacing: 10.h, children: List<Widget>.generate(3, (index) => Dentist4ItemWidget())); } 
/// Section Widget
Widget _buildNameSurgeries(BuildContext context) { return CustomFloatingTextField(controller: nameSurgeriesController, labelText: "Past Surgeries", labelStyle: theme.textTheme.bodyLarge!, hintText: "Past Surgeries", textInputAction: TextInputAction.done, suffix: Container(margin: EdgeInsets.symmetric(horizontal: 20.h), child: CustomImageView(imagePath: ImageConstant.imgArrowdown, height: 8.v, width: 15.h)), suffixConstraints: BoxConstraints(maxHeight: 60.v)); } 
/// Section Widget
Widget _buildDentist3(BuildContext context) { return Wrap(runSpacing: 10.v, spacing: 10.h, children: List<Widget>.generate(2, (index) => Dentist6ItemWidget())); } 
/// Section Widget
Widget _buildContinue(BuildContext context) { return CustomElevatedButton(text: "Continue", margin: EdgeInsets.only(left: 40.h, right: 40.h, bottom: 18.v), buttonStyle: CustomButtonStyles.fillPrimary, buttonTextStyle: CustomTextStyles.titleMediumRubikOnErrorContainer); } 

/// Navigates back to the previous screen.
onTapArrowLeft(BuildContext context) { Navigator.pop(context); } 
 }
