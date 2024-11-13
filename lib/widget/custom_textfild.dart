import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

TextFormField customTextformfield(
    String hintText,
    String label,
    TextEditingController controller,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    bool password,
    bool? passwordVisible,
    VoidCallback? togglePasswordVisibility,
    {bool isMobile = false,
    void Function()? onTap,
    bool labelText = false,
    bool readOnly = false}) {
  return TextFormField(
    onTap: onTap,
    readOnly: readOnly,
    validator: validator,
    keyboardType: keyboardType,
    controller: controller,
    obscureText: password && !passwordVisible!,
    textInputAction: isMobile ? TextInputAction.done : TextInputAction.next,
    decoration: InputDecoration(
      hintText: hintText,
      label: labelText ? Text(label) : null,
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
        borderSide: const BorderSide(color: Color(0xFFC1C1C1)),
        borderRadius: BorderRadius.circular(10),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFC1C1C1)),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
