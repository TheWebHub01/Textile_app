// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:textile_app/utils/widget.dart';
// import 'package:textile_app/widget/custom_textfild.dart';

// class ForgotScreen extends StatefulWidget {
//   const ForgotScreen({super.key});

//   @override
//   State<ForgotScreen> createState() => _ForgotScreenState();
// }

// class _ForgotScreenState extends State<ForgotScreen> {
//   final TextEditingController _emailController = TextEditingController();

//   final _formKey = GlobalKey<FormState>();
//   Future<void> _resetPassword() async {
//     if (_formKey.currentState != null && _formKey.currentState!.validate()) {
//       try {
//         final email = _emailController.text;
//         if (email.isNotEmpty) {
//           await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Password reset email sent. Check your inbox.'),
//             ),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Please enter your email address.')),
//           );
//         }
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: ${e.toString()}')),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               getAssetWidget("forgot_logo.svg"),
//               verticalSpace(12.h),
//               Text(
//                 "Forgot Password?",
//                 style: TextStyle(
//                   fontSize: 24.sp,
//                 ),
//               ),
//               Text(
//                 "No worries, we’ll send you reset instruction.",
//                 style:
//                     TextStyle(color: const Color(0xff8A8A8A), fontSize: 14.sp),
//               ),
//               verticalSpace(12.h),
//               customTextformfield("Enter E-mail", "E-mail", _emailController,
//                   (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your email';
//                 }
//                 return null;
//               }, TextInputType.emailAddress, false, null, null),
//               verticalSpace(15.h),
//               GestureDetector(
//                 onTap: () => _resetPassword(),
//                 child: Container(
//                   width: double.infinity,
//                   height: 60.h,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12.h),
//                       color: const Color(0xff0D5785)),
//                   child: getCustomFont("Reset Password",
//                       fontWeight: FontWeight.w500,
//                       textSize: 18.sp,
//                       textColor: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/custom_textfild.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: getAssetWidget("forgot_logo.svg"),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 11),
                  const Text(
                    "No worries, we’ll send you reset instructions.",
                    style: TextStyle(fontSize: 13, color: Color(0xff727272)),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 7),
                  customTextformfield("Enter your email",
                      "assets/svg/email.svg", _emailController, (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  }, TextInputType.emailAddress, false, null, null),
                  const SizedBox(height: 15),
                  Center(
                    child: GestureDetector(
                      onTap: _resetPassword,
                      child: Container(
                        height: 60,
                        width: 370,
                        decoration: BoxDecoration(
                          color: const Color(0xff0D5785),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: const Center(
                          child: Text(
                            "Reset",
                            style: TextStyle(
                                fontSize: 20, color: Color(0xffFFFFFF)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
