import 'package:caronas_usp/widget/field_wrapper_widget.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final Function(TextFieldWidget, dynamic)? onFieldChanged;
  final String? Function(String?)? onValidation;
  final TextEditingController? fieldController;
  final FocusNode? focusNode;
  final Icon? suffixIcon;
  final TextInputType textInputType;
  final bool enabled;

  TextFieldWidget(
      {Key? key,
      required this.label,
      this.onFieldChanged,
      this.onValidation,
      this.fieldController,
      this.focusNode,
      this.suffixIcon,
      this.textInputType = TextInputType.name,
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
  Widget build(BuildContext context) => FieldWrapper(
          fieldInput: TextFormField(
        enabled: widget.enabled,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.onValidation,
        onChanged: onChanged,
        controller: widget.fieldController,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: widget.label,
          suffixIcon: widget.suffixIcon,
        ),
      ));

  void onChanged(value) {
    if (widget.onFieldChanged != null) {
      widget.onFieldChanged!(widget, value);
    }
  }
}
