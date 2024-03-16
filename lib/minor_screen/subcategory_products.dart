import 'package:flutter/material.dart';

import '../widgets/appbar_widgets.dart';

class SubCategProduct extends StatelessWidget {

  final String maincategName;
  final String subcategName;

  const SubCategProduct({super.key,required this.subcategName,required this.maincategName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:const AppBarBackButton(),
        title: AppBarTitle(title: subcategName),
        centerTitle: true,
      ),
      body: Center(child: Text(maincategName),),
    );
  }
}


