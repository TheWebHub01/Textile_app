import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:textile_app/utils/widget.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final _confiromPassword = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isObscured = true;
  bool _isObscured1 = true;

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
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Color(0xff797979)),
                    hintText: 'Enter Your password',
                    enabled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscured ? Icons.visibility : Icons.visibility_off,
                        color: const Color(0xffC5C5C5),
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffCDCDCD))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffCDCDCD))),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffCDCDCD)))),
                obscureText: _isObscured,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              verticalSpace(10.h),
              TextFormField(
                controller: _confiromPassword,
                decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: const TextStyle(color: Color(0xff797979)),
                    hintText: 'Enter Your password',
                    enabled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscured1 ? Icons.visibility : Icons.visibility_off,
                        color: const Color(0xffC5C5C5),
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured1 = !_isObscured1;
                        });
                      },
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffCDCDCD))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffCDCDCD))),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffCDCDCD)))),
                obscureText: _isObscured1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              verticalSpace(20.h),
              GestureDetector(
                onTap: () {},
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
