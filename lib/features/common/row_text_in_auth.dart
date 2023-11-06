import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RowTextInAuth extends StatelessWidget {
  final String text;
  final String textSecond;
  final MainAxisAlignment mainAxisAlignment;
  final Function()? onTap;

  const RowTextInAuth({
    super.key,
    required this.text,
    required this.textSecond,
    this.onTap,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          text,
          style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 3.w,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            textSecond,
            style: GoogleFonts.inter(
                color: const Color(0xff1F4DAD),
                fontSize: 11.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
