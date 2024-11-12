// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:textile_app/Screens/Login/login_screen.dart';
// import 'package:textile_app/utils/widget.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isObscured = true;

//   String? _validateEmail(String? value) {
//     if (value == null || value.isEmpty) return 'Email cannot be empty';
//     String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
//     RegExp regex = RegExp(pattern);
//     if (!regex.hasMatch(value)) return 'Enter a valid email address';
//     return null;
//   }

//   String? _validatePassword(String? value) {
//     if (value == null || value.isEmpty) return 'Password cannot be empty';
//     if (value.length < 6) return 'Password must be at least 6 characters long';
//     return null;
//   }

//   void _signUp() async {
//     String email = _emailController.text;
//     String password = _passwordController.text;

//     await UserPreferences.saveUserDetails(email, password);

//     Get.off(const LoginScreen());
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('User signed up successfully!')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             getAssetWidget("login_logo.svg"),
//             verticalSpace(12.h),
//             const Text(
//               "Welcome Back",
//               style: TextStyle(
//                 fontSize: 27,
//               ),
//             ),
//             const Text(
//               "Join a Company",
//               style: TextStyle(color: Color(0xff8A8A8A), fontSize: 17),
//             ),
//             verticalSpace(12.h),
//             TextFormField(
//                 controller: _emailController,
//                 decoration: const InputDecoration(
//                     labelText: 'Email',
//                     labelStyle: TextStyle(color: Color(0xff797979)),
//                     hintText: "Enter Your E-mail",
//                     enabled: true,
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Color(0xffCDCDCD))),
//                     enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Color(0xffCDCDCD))),
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Color(0xffCDCDCD)))),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: _validateEmail),
//             verticalSpace(10.h),
//             TextFormField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(
//                     labelText: 'Password',
//                     labelStyle: const TextStyle(color: Color(0xff797979)),
//                     hintText: 'Enter Your password',
//                     enabled: true,
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _isObscured ? Icons.visibility : Icons.visibility_off,
//                         color: const Color(0xffC5C5C5),
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _isObscured = !_isObscured;
//                         });
//                       },
//                     ),
//                     enabledBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: Color(0xffCDCDCD))),
//                     focusedBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: Color(0xffCDCDCD))),
//                     border: const OutlineInputBorder(
//                         borderSide: BorderSide(color: Color(0xffCDCDCD)))),
//                 obscureText: _isObscured,
//                 validator: _validatePassword),
//             verticalSpace(20.h),
//             GestureDetector(
//               onTap: _signUp,
//               child: Container(
//                 width: double.infinity,
//                 height: 50.h,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12.h),
//                     color: const Color(0xff0D5785)),
//                 child: getCustomFont("Sign Up",
//                     fontWeight: FontWeight.w500,
//                     textSize: 18.sp,
//                     textColor: Colors.white),
//               ),
//             ),
//             verticalSpace(20.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 getAssetWidget("google.svg"),
//                 horizontalSpace(15.h),
//                 getAssetWidget("facebook.svg"),
//                 horizontalSpace(15.h),
//                 getAssetWidget("ios.svg"),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:textile_app/progress_loader/progress_loader.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/custom_textfild.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool password1 = false;
  final bool _loading = false;
  bool checkBoxValue = false;

  _togglePasswordVisibility2() {
    setState(() {
      password1 = !password1;
      print("=== password1 ===>$password1");
    });
  }

  Future<void> signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailController.text.trim(),
                password: _passwordController.text.trim());

        // Store only the email in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'email': _emailController.text.trim(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign-Up Successful.')),
        );

        // Navigate to the login tab or any other relevant tab
      } on FirebaseAuthException catch (e) {
        String errorMessage = '';
        if (e.code == 'email-already-in-use') {
          errorMessage = 'The email is already in use.';
        } else if (e.code == 'weak-password') {
          errorMessage = 'The password is too weak.';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'The email is invalid.';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      } catch (e) {
        debugPrint('Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('An unexpected error occurred.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ProgressLoader pl = ProgressLoader(context, isDismissible: true);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getAssetWidget("login_logo.svg"),
                  verticalSpace(12.h),
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 27,
                    ),
                  ),
                  const Text(
                    "Join a Company",
                    style: TextStyle(color: Color(0xff8A8A8A), fontSize: 17),
                  ),
                  verticalSpace(12.h),
                  customTextformfield("Enter E-mail", "E-mail",
                      "assets/svg/email.svg", _emailController, (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  }, TextInputType.emailAddress, false, null, null),
                  verticalSpace(10.h),
                  customTextformfield("Enter Password", "Password",
                      "assets/svg/password.svg", _passwordController, (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  }, null, true, password1, _togglePasswordVisibility2),
                  verticalSpace(15.h),
                  GestureDetector(
                    onTap: () async {
                      await pl.show();
                      await signUp();
                      await pl.hide();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: const Color(0xFF0D5785)),
                      child: Center(
                          child: _loading
                              ? const SizedBox(
                                  height: 19,
                                  width: 19,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  verticalSpace(15.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
