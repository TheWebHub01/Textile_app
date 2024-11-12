import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

TextFormField customTextformfield(
  String hintText,
  String label,
  String prefixImagePath,
  TextEditingController controller,
  String? Function(String?)? validator,
  TextInputType? keyboardType,
  bool password,
  bool? passwordVisible,
  VoidCallback? togglePasswordVisibility, {
  bool isMobile = false,
}) {
  return TextFormField(
    validator: validator,
    keyboardType: keyboardType,
    controller: controller,
    obscureText: password && !passwordVisible!,
    textInputAction: isMobile ? TextInputAction.done : TextInputAction.next,
    decoration: InputDecoration(
      hintText: hintText,
      label: Text(label),
      suffixIcon: password
          ? GestureDetector(
              onTap: togglePasswordVisibility,
              child: Container(
                color: Colors.transparent,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child: passwordVisible!
                        ? SvgPicture.asset("assets/svg/eye.svg")
                        : SvgPicture.asset("assets/svg/hide.svg")),
              ),
            )
          : const SizedBox(
              height: 10,
              width: 10,
            ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFDADADA)),
        borderRadius: BorderRadius.circular(10),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFDADADA)),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
