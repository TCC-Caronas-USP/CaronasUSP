String? phoneNumberValidator(String? value) {
  String pattern = r'^\([1-9]{2}\) 9?[0-9]{8}$';
  RegExp regExp = RegExp(pattern);
  if (value!.isEmpty) {
    return 'Campo obrigatório';
  } else if (!regExp.hasMatch(value)) {
    return 'Digite um número válido';
  }
  return null;
}

String? emptyValueValidator(String? value) {
  if (value!.isEmpty) {
    return 'Campo obrigatório';
  }
  return null;
}

String? emptyNumberValidator(String? value) {
  if (value!.isEmpty) {
    return 'Campo obrigatório';
  }
  double? valueAsNumber = double.tryParse(value);
  if (valueAsNumber == null || valueAsNumber == double.nan){
    return 'Digite um número válido';
  }
  return null;
}

String PHONE_MASK = '(00) 00000000#';
