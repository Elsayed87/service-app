import 'package:flutter/material.dart';
import 'package:service_app/const/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.lableText,
    required this.keyboardType,
    required this.controller,
    required this.onChanged,
    // required this.validator
  });
  final String lableText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  //final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'This Field Is Required';
        }
        return null;
      },
      onChanged: onChanged,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: lableText,
        labelStyle: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            color: AppColor.appTextFieldLabelColor),
        enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColor.appTextFieldEnabeldBorder, width: 3.0),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColor.appTextFieldFocusedBorder, width: 3.0),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColor.appTextFieldBorder, width: 3.0),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
