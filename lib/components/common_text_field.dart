import 'package:flutter/material.dart';

Widget commonTextField(
    String label, String hint, TextEditingController controller,
    {bool email = false, int lines = 1}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: TextFormField(
      controller: controller,
      maxLines: lines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'This field is required';
        if (email && !value.contains('@')) return 'Enter a valid email';
        return null;
      },
    ),
  );
}
