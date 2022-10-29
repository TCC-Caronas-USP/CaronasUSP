import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  String? text;
  final Function(TextFieldWidget, dynamic)? onFieldChanged;
  final String? Function(String?)? onValidation;
  final TextEditingController? fieldController;
  final FocusNode? focusNode;
  final Icon? suffixIcon;
  final TextInputType textInputType;
  final String type;
  final bool enabled;

  TextFieldWidget(
      {Key? key,
      required this.label,
      this.text,
      this.onFieldChanged,
      this.onValidation,
      this.fieldController,
      this.focusNode,
      this.suffixIcon,
      this.textInputType = TextInputType.name,
      this.type = "text",
      this.enabled = true})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        enabled: widget.enabled,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.onValidation,
        initialValue: widget.text,
        onChanged: onChanged,
        controller: widget.fieldController,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: widget.label,
          suffixIcon: widget.suffixIcon,
        ),
      );

  void onChanged(value) {

    if (widget.onFieldChanged != null){
      widget.onFieldChanged!(widget, value);
    }
    setState(() {
      widget.text = value;
    });
  }
}
