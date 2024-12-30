// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType inputType = TextInputType.visiblePassword;
  final String? hintText;
  final TextInputAction? actionType;

  const PasswordTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.actionType,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late FocusNode _focusNode;
  bool obsecureText = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      keyboardType: widget.inputType,
      textInputAction: widget.actionType,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obsecureText = !obsecureText;
            });
          },
          icon: Icon(
              obsecureText ? Ionicons.eye_off_outline : Ionicons.eye_outline),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 12.0,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      obscureText: obsecureText,
    );
  }
}
