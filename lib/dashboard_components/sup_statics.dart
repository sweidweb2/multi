import 'package:flutter/material.dart';
import 'package:udemy_project2/widgets/appbar_widgets.dart';

class StaticsScreen extends StatelessWidget {
  const StaticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title:'Statics Screen'),
        leading: AppBarBackButton(),
      ),
    );
  }
}
