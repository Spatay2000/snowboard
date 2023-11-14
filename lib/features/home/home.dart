import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snowboard/data/model/product_model.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.h),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 20, top: 50, bottom: 10).r,
          child: RichText(
              text: TextSpan(
                  text: 'Добро пожаловать',
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                TextSpan(
                  text: ' Snowboard',
                  style: GoogleFonts.inter(
                    color: const Color(0xff3776F6),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ])),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            SizedBox(
              height: 10.h,
            ),
            GridView.builder(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ).r,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: productModel.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 14),
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFCBCBCB),
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Stack(
                        children: [
                          Center(child: Image.asset(productModel[index].image)),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20).r,
                              child: Text(
                                productModel[index].name,
                                style: GoogleFonts.inder(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ));
                })
          ],
        ),
      ),
    );
  }
}
