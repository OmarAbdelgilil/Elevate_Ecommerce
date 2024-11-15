import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:elevate_ecommerce/core/widgets/custom_appbar.dart';
import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _firstName = '';
  String _lastName= '';
  String _rePassword = '';
  String _phone = '';
  String _email = '';
  TextEditingController emailController =;
  String _password = '';
  bool _isButtonEnabled = false;
  String? selectedGender;

  void _checkFields() {
    setState(() {
      _isButtonEnabled = _email.isNotEmpty && _password.isNotEmpty && _firstName.isNotEmpty
      && _lastName.isNotEmpty && _phone.isNotEmpty && _rePassword.isNotEmpty && selectedGender!.isNotEmpty;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leadingWidth: 300.w,leading: CustomAppBar(title: "Sign Up",onPressed: (){},),),
     body: Padding(
       padding: const EdgeInsets.all(20.0),
       child: SingleChildScrollView(

         child: Column(

           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 CustomtextField(
                     hint: "Enter first name", onChange:  (value) {
                       _firstName = value;
                       _checkFields();
                     }, lable: "First name", controller: _,),
                 CustomtextField(
                     hint: "Enter last name",
                    onChange:  (value) {
                          _lastName = value;
                          _checkFields();
                                 }
                     ,lable: "Last name"),
               ],
             ),
             SizedBox(height: 30.h,),
             CustomtextField(
                 hint: "Enter your email", onChange:  (value) {
               _email = value;
               _checkFields();
             }, lable: "Email"),
             SizedBox(height: 30.h,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 CustomtextField(width: 170.w,
                     hint: "Enter password", onChange: (value) {
                       _password = value;
                       _checkFields();
                     }, lable: "password"),
                 CustomtextField(width: 170.w,
                     hint: "Confirm password", onChange:  (value) {
                       _rePassword = value;
                       _checkFields();
                     }, lable: "Confirm password"),
               ],
             ),
             SizedBox(height: 30.h,),
             CustomtextField(hint: "Enter phone number", onChange: (value) {
               _phone = value;
               _checkFields();
             }, lable: "Phone number",),
             SizedBox(height: 25.h,),
             Row(
               children: [
                 Text(
                   'Gender',
                   style: TextStyle(
                     fontSize: 18.sp,
                     fontWeight: FontWeight.w500,
                     color: gray53Color,
                   ),
                 ),
                 SizedBox(width:40.w),
                 Row(
                   children: [
                     Radio<String>(
                       value: 'female',
                       activeColor: primaryColor,
                       groupValue: selectedGender,
                       onChanged: (value) {
                         setState(() {
                           selectedGender = value!;
                         });

                       },
                     ),
                     Text('Female',style: TextStyle(
                       fontSize: 14.sp,
                       fontWeight: FontWeight.w400,
                       color: gray53Color,
                     ),),
                   ],
                 ),
                 SizedBox(width:40.w),
                 Row(
                   children: [
                     Radio<String>(

                       value: 'male',
                       activeColor: primaryColor,
                       groupValue: selectedGender,
                       onChanged: (value) {
                         setState(() {
                           selectedGender = value!;
                         });

                       },
                     ),
                     Text('Male',style: TextStyle(
                       fontSize: 14.sp,
                       fontWeight: FontWeight.w400,
                       color: gray53Color,
                     ),),
                   ],
                 ),
               ],
             ),
             SizedBox(height:15.h,),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text("Creating an account, you agree to our" ,
                   style: TextStyle(
                       fontWeight: FontWeight.w400,
                       color: blackFontColor,
                       fontSize: 12.sp
                   ),)
                 ,InkWell(
                   child: Text('Terms&Conditions',style: TextStyle(
                     decoration: TextDecoration.underline,
                     fontWeight: FontWeight.w600,
                     color: blackFontColor,
                     fontSize: 12.sp,
                     fontStyle: FontStyle.italic,

                   ),
                   ),
                 )
               ],
             ),

             SizedBox(height: 50.h,),
             CustomButton(text: "Sign up",color: _isButtonEnabled
                 ?primaryColor
                 : Colors.grey,),
             SizedBox(height: 15.h,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Already have an account?" ,style: TextStyle(
                   fontWeight: FontWeight.w400,
                   color: blackFontColor,
                   fontSize: 16.sp
               ),)
                   ,InkWell(
                     child: Text('  Login', style: TextStyle(
                     decoration: TextDecoration.underline,
                     fontWeight: FontWeight.w400,
                     color: primaryColor,
                     fontSize: 16.sp,


                                    ),
                                    ),
                   )
               ],
             )
           ],
         ),
       ),
     ),

    );
  }
}*/

