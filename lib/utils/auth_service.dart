import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter/material.dart';

class AuthService {
  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        final userDoc =
            FirebaseFirestore.instance.collection('users').doc(user.uid);
        final userSnapshot = await userDoc.get();

        if (!userSnapshot.exists) {
          await userDoc.set({
            'name': user.displayName,
            'email': user.email,
            'approved': false, // Set default approval status
          }).catchError((error) {
            print("Error writing to Firestore: $error");
          });
        }

        // Check if the user is approved
        if (userSnapshot.data()?['approved'] == true) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('userid', user.uid);
          await prefs.setString('email', user.email!);
          await prefs.setString('name', user.displayName ?? '');

          print('User ID stored: ${user.uid}');
          return user;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'You are not eligible for login. Please wait at least 24 hours.')),
          );
          await FirebaseAuth.instance.signOut();
          return null;
        }
      }
      return null;
    } catch (e) {
      print("Error during Google Sign-In: $e");
      return null;
    }
  }

  Future<User?> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.tokenString);

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      User? user = userCredential.user;

      if (user != null) {
        final userDoc =
            FirebaseFirestore.instance.collection('users').doc(user.uid);
        final userSnapshot = await userDoc.get();

        if (!userSnapshot.exists) {
          await userDoc.set({
            'name': user.displayName,
            'email': user.email,
            'approved': false, // Set default approval status
          }).catchError((error) {
            print("Error writing to Firestore: $error");
          });
        }

        // Check if the user is approved
        if (userSnapshot.data()?['approved'] == true) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('userid', user.uid);
          await prefs.setString('email', user.email!);
          await prefs.setString('name', user.displayName ?? '');

          print('User ID stored: ${user.uid}');
          return user;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'You are not eligible for login. Please wait at least 24 hours.')),
          );
          await FirebaseAuth.instance.signOut();
          return null;
        }
      }
      return null;
    } catch (e) {
      print("=== error is here ===>$e");
      return null;
    }
  }

  // Sign in with Apple (Add similar approval check if needed)
  Future<User?> signInWithApple(BuildContext context) async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final credential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        // Implement similar approval check here if needed
      }

      return user;
    } catch (e) {
      print("Error during Apple Sign-In: $e");
      return null;
    }
  }
}
