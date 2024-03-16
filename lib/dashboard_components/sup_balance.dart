import 'package:flutter/material.dart';
import 'package:udemy_project2/widgets/appbar_widgets.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title:'Balance Screen'),
        leading: AppBarBackButton(),
      ),
    );
  }
}
