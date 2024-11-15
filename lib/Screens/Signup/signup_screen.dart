import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:textile_app/Screens/Login/login_screen.dart';
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
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign-Up Successful.')),
        );


        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
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
