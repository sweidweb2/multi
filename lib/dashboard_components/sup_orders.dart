import 'package:flutter/material.dart';
import 'package:udemy_project2/widgets/appbar_widgets.dart';

class SupplierOrders extends StatelessWidget {
  const SupplierOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title:'Supplier orders'),
        leading: AppBarBackButton(),
      ),
    );
  }
}
