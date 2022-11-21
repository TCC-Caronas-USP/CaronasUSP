import 'package:flutter/material.dart';

class FieldWrapper extends StatefulWidget {
  Widget fieldInput;

  FieldWrapper({Key? key, required this.fieldInput}) : super(key: key);

  @override
  State<FieldWrapper> createState() => _FieldWrapperState();
}

class _FieldWrapperState extends State<FieldWrapper> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 12),
        widget.fieldInput,
        const SizedBox(height: 12),
      ],
    );
  }
}
