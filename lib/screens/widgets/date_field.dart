// ISO (yyyy-MM-dd) date text field with a picker button — every date in the
// schema is stored as an ISO date string, so this keeps the stored format
// and the input format identical rather than converting at save time.

import 'package:flutter/material.dart';

class DateField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool required;

  const DateField({super.key, required this.controller, required this.label, this.required = false});

  Future<void> _pickDate(BuildContext context) async {
    final initial = DateTime.tryParse(controller.text) ?? DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1990),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = picked.toIso8601String().substring(0, 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: required ? '$label *' : label,
        suffixIcon: const Icon(Icons.calendar_today),
      ),
      onTap: () => _pickDate(context),
    );
  }
}
