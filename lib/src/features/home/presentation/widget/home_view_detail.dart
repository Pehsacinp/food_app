import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/features/home/domain/repositories/yemekler_model.dart';

@RoutePage(name: 'HomeDetailRoute')
class HomeViewDetail extends StatefulWidget {
  const HomeViewDetail({
    super.key,
  });

  @override
  _HomeViewDetailState createState() => _HomeViewDetailState();
}

class _HomeViewDetailState extends State<HomeViewDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
