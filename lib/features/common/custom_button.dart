import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snowboard/features/common/skibo_color.dart';

class CustomButton extends StatelessWidget {
  final bool showBlackColor;
  final String text;
  final Function()? onTap;
  final bool isTextCentered;
  final double borderRadius;
  final double? height;
  final String? leftIcon;
  final String? rightIcon;
  final Color? leftIconColor;
  final double? leftIconTextSpacing;
  final double rigthPadding;

  const CustomButton({
    super.key,
    this.showBlackColor = true,
    required this.text,
    this.onTap,
    this.isTextCentered = false,
    this.borderRadius = 45,
    this.height,
    this.leftIcon,
    this.rightIcon,
    this.leftIconColor,
    this.leftIconTextSpacing,
    this.rigthPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        padding: isTextCentered
            ? const EdgeInsets.symmetric(vertical: 16).r
            : EdgeInsets.only(
                top: 16,
                bottom: 16,
                left: 52,
                right: rigthPadding,
              ).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius.r),
          color: showBlackColor == true
              ? SkiboColor.defaultColorButton
              : SkiboColor.secondaryColorButton,
        ),
        child: Row(
          mainAxisAlignment: isTextCentered
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            leftIcon == null
                ? const SizedBox()
                : SvgPicture.asset(
                    leftIcon!,
                    color: leftIconColor,
                  ),
            SizedBox(width: leftIconTextSpacing?.w),
            Padding(
              padding: (showBlackColor == false && !isTextCentered)
                  ? const EdgeInsets.only(left: 80).r
                  : EdgeInsets.zero,
              child: Text(
                text,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (rightIcon != null) ...[
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(rightIcon!),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
