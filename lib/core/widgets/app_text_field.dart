import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool isPassword;
  final Function(String)? onChanged;

  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType,
    this.isPassword = false,
    this.validator,
    this.onChanged,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isObscure = false;
  @override
  void initState() {
    super.initState();
    _isObscure = widget.isPassword;
  }

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        obscureText: _isObscure,
        controller: widget.controller,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          label: Text(widget.label),
          border: const OutlineInputBorder(),
          prefixIcon: Icon(widget.icon),
          suffixIcon: (widget.isPassword == false)
              ? null
              : GestureDetector(
                  onTap: () => _toggleObscure(),
                  child: (_isObscure)
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility_outlined),
                ),
        ),
      ),
    );
  }
}
