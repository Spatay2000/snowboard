import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snowboard/features/common/skibo_color.dart';

class CustomButton extends StatelessWidget {
  final bool showBlackColor;
  final bool showIcon;
  final String text;
  final Function()? onTap;
  const CustomButton(
      {super.key,
      this.showBlackColor = true,
      this.showIcon = false,
      required this.text,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 52).r,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45.r),
            color: showBlackColor == true
                ? SkiboColor.defaultColorButton
                : SkiboColor.secondaryColorButton),
        child: Row(
          children: [
            showIcon == false
                ? const SizedBox()
                : SvgPicture.asset('assets/svg/phone.svg'),
            showIcon == false
                ? const SizedBox()
                : SizedBox(
                    width: 61.w,
                  ),
            Padding(
              padding: showBlackColor == false
                  ? const EdgeInsets.only(left: 80).r
                  : EdgeInsets.zero,
              child: Text(
                text,
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
