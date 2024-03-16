import 'package:flutter/material.dart';
import 'package:udemy_project2/widgets/appbar_widgets.dart';

class CustomerOrders extends StatelessWidget {
  const CustomerOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title:'Customer Orders'),
        leading: AppBarBackButton(),
      ),
    );
  }
}
