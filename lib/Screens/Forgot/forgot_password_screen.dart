import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/custom_textfild.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailController.text);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Password reset email sent. Check your inbox.')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getAssetWidget("forgot_logo.svg"),
              verticalSpace(12.h),
              Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 24.sp,
                ),
              ),
              Text(
                "No worries, we’ll send you reset instruction.",
                style:
                    TextStyle(color: const Color(0xff8A8A8A), fontSize: 14.sp),
              ),
              verticalSpace(12.h),
              customTextformfield("Enter E-mail", "E-mail", _emailController,
                  (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              }, TextInputType.emailAddress, false, null, null),
              verticalSpace(15.h),
              GestureDetector(
                onTap: _resetPassword,
                child: Container(
                  width: double.infinity,
                  height: 60.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.h),
                      color: const Color(0xff0D5785)),
                  child: getCustomFont("Reset Password",
                      fontWeight: FontWeight.w500,
                      textSize: 18.sp,
                      textColor: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
