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
  List<ProductModel> productModel = [
    ProductModel(id: 1, name: 'Комбо', image: ''),
    ProductModel(id: 2, name: 'Шлем', image: ''),
    ProductModel(id: 3, name: 'Очки', image: ''),
    ProductModel(id: 4, name: 'Куртка', image: ''),
    ProductModel(id: 5, name: 'Лыжи', image: ''),
    ProductModel(id: 6, name: 'Борд', image: ''),
    ProductModel(id: 7, name: 'Штаны', image: ''),
    ProductModel(id: 8, name: 'Обувь', image: ''),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 20, top: 50).r,
        child: Column(
          children: [
            RichText(
                text: TextSpan(
                    text: 'Добро пожаловать',
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                  TextSpan(
                    text: '\nSnowboard',
                    style: GoogleFonts.inter(
                      color: const Color(0xff3776F6),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ])),
          ],
        ),
      ),
    );
  }
}
