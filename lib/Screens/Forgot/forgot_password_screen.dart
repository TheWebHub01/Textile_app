import 'package:flutter/material.dart';
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
