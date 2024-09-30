import 'package:flutter/material.dart';

import '../../../helpers/validators/validators.dart';
import '../common_text_form_field_widget.dart';

class NameFormWidget extends StatelessWidget {
  final TextEditingController nameController;
  final String? Function(String?)? nameOnChanged;

  const NameFormWidget({
    super.key,
    required this.nameController,
    required this.nameOnChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CommonTextFormField(
      controller: nameController,
      hintKey: "Full Name",
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is empty';
        } else if (nameValidator(value)) {
          return 'Bad format';
        } else if (value.length < 3) {
          return 'Lenght must be equal or more than 3';
        } else {
          return null;
        }
      },
      onChanged: nameOnChanged,
    );
  }
}
