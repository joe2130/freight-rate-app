import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;

  const CustomDatePicker({
    required this.selectedDate,
    required this.onDateSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(DateTime.now().year + 1),
        );
        if (pickedDate != null) onDateSelected(pickedDate);
      },
      child: Text(
        selectedDate == null
            ? "Select Cut Off Date"
            : "Date: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}",
      ),
    );
  }
}