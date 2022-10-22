import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatetimeFieldWidget extends StatefulWidget {
  final DateTimeFieldPickerMode type;
  final String label;

  final onDateSelected;

  const DatetimeFieldWidget(
      {Key? key, required this.label, this.type = DateTimeFieldPickerMode.date, this.onDateSelected})
      : super(key: key);

  @override
  State<DatetimeFieldWidget> createState() => _DatetimeFieldWidgetState();
}

class _DatetimeFieldWidgetState extends State<DatetimeFieldWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      dateFormat: widget.type == DateTimeFieldPickerMode.date
          ? DateFormat("dd/MM/yyyy")
          : DateFormat("HH:mm"),
      mode: widget.type,
      firstDate: DateTime.now(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null) {
          return 'Campo obrigatório';
        }
        return null;
      },
      onDateSelected: widget.onDateSelected,
      decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: widget.label,
          suffixIcon: widget.type == DateTimeFieldPickerMode.date
              ? const Icon(Icons.event)
              : const Icon(Icons.watch_later_outlined)),
    );
  }
}
