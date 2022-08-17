import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomPasswordField extends StatefulWidget {
  CustomPasswordField({this.value}) : super();
  String? value;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  // Initially password is obscure
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      obscureText: _obscureText,
      name: "password",
      initialValue: widget.value,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
            errorText: "Veuillez saisir un mot de passe."),
        FormBuilderValidators.maxLength(24,
            errorText:
                "Votre mot de passe ne doit pas contenir plus de 24 caractères."),
        FormBuilderValidators.minLength(8,
            errorText:
                "Votre mot de passe doit contenir au moins 8 caractères."),
      ]),
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        label: Text("Mot de passe"),
        icon: Icon(Icons.security),
        suffixIcon: Padding(
          padding: EdgeInsetsDirectional.only(end: 12.0),
          child: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: _toggle,
          ),
        ),
      ),
    );
  }
}
