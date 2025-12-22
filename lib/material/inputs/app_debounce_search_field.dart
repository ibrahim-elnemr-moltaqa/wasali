import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';

class AppDebounceSearchField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget Function(bool isFocused)? prefixIcon;
  final Duration debounceDuration;
  final ValueChanged<String>? onChanged;
  final EdgeInsetsGeometry margin;

  const AppDebounceSearchField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.debounceDuration = const Duration(milliseconds: 500),
    this.onChanged,
    this.margin = const EdgeInsets.symmetric(vertical: 8),
  });

  @override
  State<AppDebounceSearchField> createState() => _AppDebounceSearchFieldState();
}

class _AppDebounceSearchFieldState extends State<AppDebounceSearchField> {
  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(widget.debounceDuration, () {
      widget.onChanged?.call(query);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: widget.controller,
      hintText: widget.hintText,
      prefixIcon: widget.prefixIcon,
      margin: widget.margin,
      onChanged: _onSearchChanged,
    );
  }
}
