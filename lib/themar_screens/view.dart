import 'package:api/themar_screens/components/slider_section.dart';
import 'package:flutter/material.dart';

import 'components/category_section/view.dart';
import 'components/products_section.dart';

class Views extends StatefulWidget {
  const Views({super.key});

  @override
  State<Views> createState() => _ViewsState();
}

class _ViewsState extends State<Views> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("منتجات"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SliderSection(),
              SizedBox(
                height: 16,
              ),
              CategorySection(),
              SizedBox(
                height: 16,
              ),
              ProductsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
