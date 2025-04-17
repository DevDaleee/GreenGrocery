import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isSecret;
  final String? initialValue;
  final bool isReadOnly;
  final List<TextInputFormatter>? inputFormatter;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.label,
    this.initialValue,
    this.isReadOnly = false,
    this.isSecret = false,
    this.inputFormatter,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;
  @override
  void initState() {
    isObscure = widget.isSecret;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        readOnly: widget.isReadOnly,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatter,
        obscureText: isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isSecret == true
              ? IconButton(
                  onPressed: () => setState(() {
                    isObscure = !isObscure;
                  }),
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                )
              : null,
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
