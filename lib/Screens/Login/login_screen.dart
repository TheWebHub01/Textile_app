import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textile_app/Screens/Forgot/forgot_password_screen.dart';
import 'package:textile_app/Screens/Home/home_screen.dart';
import 'package:textile_app/Screens/Signup/signup_screen.dart';
import 'package:textile_app/Screens/companys_name.dart';
import 'package:textile_app/progress_loader/progress_loader.dart';
import 'package:textile_app/utils/auth_service.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/custom_textfild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        // Attempt sign-in
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(),
          password: password.trim(),
        );

        // Fetch user document from Firestore
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();

        if (userDoc.exists) {
          Map<String, dynamic> userData =
              userDoc.data() as Map<String, dynamic>;
          debugPrint("=== userData ===>${userData}");

          String name = userData['name'] ?? '';

          // Store user data in SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('email', email.trim());

          debugPrint("=== hello ===");

          // Navigate to the home screen
          await Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const PurchaseOutstanding()),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Welcome back, $name!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User data not found in Firestore')),
          );
        }
      } on FirebaseAuthException catch (e) {
        String errorMessage = 'An error occurred. Please try again.';
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Incorrect password.';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
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
                  customTextformfield(
                      "Enter E-mail", "E-mail", _emailController, (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  }, TextInputType.emailAddress, false, null, null),
                  verticalSpace(10.h),
                  customTextformfield(
                      "Enter Password", "Password", _passwordController,
                      (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  }, null, true, password1, _togglePasswordVisibility2),
                  Row(
                    children: [
                      Checkbox(
                          value: checkBoxValue,
                          onChanged: (bool? newValue) {
                            setState(() {
                              checkBoxValue = newValue!;
                            });
                          }),
                      const Text(
                        'Remember me',
                        style:
                            TextStyle(fontSize: 11, color: Color(0xff909090)),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () async {
                            _emailController.clear();
                            _passwordController.clear();
                            await Future.delayed(
                                const Duration(milliseconds: 200));
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotScreen()));
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(fontSize: 11),
                          ))
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      await pl.show();
                      await loginUser(_emailController.text,
                          _passwordController.text, context);
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
                                  "Login",
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
                  GestureDetector(
                    onTap: () {
                      Get.to(const SignUpScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xff0D5785), width: 2.0),
                        borderRadius: BorderRadius.circular(12.h),
                      ),
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
                                  "Join as Member",
                                  style: TextStyle(
                                      color: Color(0xff0D5785),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )),
                    ),
                  ),
                  verticalSpace(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () async {
                            await pl.show();

                            User? user =
                                await AuthService().signInWithGoogle(context);
                            await pl.hide();

                            if (user != null) {
                              await Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CompanysNameScreen()),
                              );
                            } else {
                              print('Login failed');
                            }
                          },
                          child: getAssetWidget("google.svg")),
                      horizontalSpace(15.w),
                      GestureDetector(
                          onTap: () async {
                            await pl.show();

                            User? user =
                                await AuthService().signInWithFacebook(context);
                            await pl.hide();

                            if (user != null) {
                              await Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PurchaseOutstanding()),
                              );
                            } else {
                              print('Login failed');
                            }
                          },
                          child: getAssetWidget("facebook.svg")),
                      horizontalSpace(15.w),
                      GestureDetector(
                          onTap: () async {}, child: getAssetWidget("ios.svg")),
                    ],
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
