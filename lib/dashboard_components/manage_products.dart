import 'package:flutter/material.dart';
import 'package:udemy_project2/widgets/appbar_widgets.dart';

class ManageProducts extends StatelessWidget {
  const ManageProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title:'Manage Products'),
        leading: AppBarBackButton(),
      ),
    );
  }
}
