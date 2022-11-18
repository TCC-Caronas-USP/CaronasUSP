import 'package:caronas_usp/utils/input_validators.dart';
import 'package:caronas_usp/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

List<Widget> getPersonalInformationFields(
    {required TextEditingController name,
    required TextEditingController instituto,
    required TextEditingController curso,
    required TextEditingController ano,
    required MaskedTextController telefone}) {
  return [
    TextFieldWidget(
      fieldController: name,
      label: "Nome",
      suffixIcon: const Icon(Icons.text_fields_outlined),
      onValidation: (String? value) => emptyValueValidator(value),
    ),
    TextFieldWidget(
      fieldController: instituto,
      label: "Instituto",
      suffixIcon: const Icon(Icons.school_outlined),
      onValidation: (String? value) => emptyValueValidator(value),
    ),
    TextFieldWidget(
      fieldController: curso,
      label: "Curso",
      suffixIcon: const Icon(Icons.school_outlined),
      onValidation: (String? value) => emptyValueValidator(value),
    ),
    TextFieldWidget(
      fieldController: ano,
      label: "Ano de Ingresso",
      textInputType: TextInputType.number,
      suffixIcon: const Icon(Icons.timelapse_outlined),
      onValidation: (String? value) => emptyNumberValidator(value),
    ),
    TextFieldWidget(
        fieldController: telefone,
        label: "Telefone",
        suffixIcon: const Icon(Icons.phone_enabled),
        textInputType: const TextInputType.numberWithOptions(
            decimal: false, signed: false),
        onValidation: (String? value) => phoneNumberValidator(value)),
  ];
}
