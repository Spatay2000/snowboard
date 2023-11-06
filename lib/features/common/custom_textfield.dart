import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:snowboard/features/common/skibo_color.dart';

enum SkiboInputType { text, number, email }

class CustomTextField extends StatelessWidget {
  final SkiboInputType? type;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function()? onTap;
  final bool readOnly;
  final int? maxLength;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool obscureText;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    this.type = SkiboInputType.text,
    this.readOnly = false,
    this.validator,
    this.onChanged,
    this.onTap,
    this.maxLength,
    required this.controller,
    required this.hintText,
    this.floatingLabelBehavior,
    this.obscureText = false,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      readOnly: readOnly,
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: formatter,
      onTap: onTap,
      maxLength: maxLength,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelStyle: GoogleFonts.inter(
            color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
        contentPadding: EdgeInsets.only(left: 27.w),
        alignLabelWithHint: false,
        labelText: hintText,
        floatingLabelBehavior: floatingLabelBehavior,
        counterText: '',
        prefix: type == SkiboInputType.number ? const Text('+7 ') : null,
        prefixStyle: GoogleFonts.inter(
            color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w400),
        focusedBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: SkiboColor.focusedBorderColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: SkiboColor.focusedBorderColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
    );
  }

  TextInputType get keyboardType {
    switch (type) {
      case SkiboInputType.number:
        return TextInputType.number;
      case SkiboInputType.email:
        return TextInputType.emailAddress;
      default:
        return TextInputType.text;
    }
  }

  List<TextInputFormatter>? get formatter {
    switch (type) {
      case SkiboInputType.number:
        return [MaskTextInputFormatter(mask: "(###) ###-##-##")];
      default:
        return null;
    }
  }
}
