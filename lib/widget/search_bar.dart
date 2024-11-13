import 'package:flutter/material.dart';

class CustomeSearchbar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearchChanged;

  const CustomeSearchbar(
      {super.key, required this.controller, required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        onChanged: onSearchChanged,
        decoration: const InputDecoration(
          hintText: "Search Account...",
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
        ),
      ),
    );
  }
}
