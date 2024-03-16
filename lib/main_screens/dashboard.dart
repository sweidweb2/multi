import 'package:flutter/material.dart';
import 'package:udemy_project2/dashboard_components/edit_business.dart';
import 'package:udemy_project2/dashboard_components/manage_products.dart';
import 'package:udemy_project2/dashboard_components/my_store.dart';
import 'package:udemy_project2/dashboard_components/sup_balance.dart';
import 'package:udemy_project2/dashboard_components/sup_orders.dart';
import 'package:udemy_project2/dashboard_components/sup_statics.dart';
import 'package:udemy_project2/widgets/appbar_widgets.dart';

List<String> label=[
  'my store',
  'orders',
  'edit profile',
  'manage products',
  'balance',
  'statics',
];

List<IconData> icons=[
  Icons.store,
  Icons.shop_2_outlined,
  Icons.edit,
  Icons.settings,
  Icons.attach_money,
  Icons.show_chart
];

List<Widget> mydashboard=[
  MyStore(),
  SupplierOrders(),
  EditBusiness(),
  ManageProducts(),
  BalanceScreen(),
  StaticsScreen()
];


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const AppBarTitle(title: 'Dashboard'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/welcome_screen');
            },
            icon:const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 50,
          crossAxisSpacing: 50,
          children: List.generate(6,(index){
                return InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=> mydashboard[index]
                        ),
                    );
                  },
                  child: Card(
                    elevation: 20,
                    shadowColor: Colors.purpleAccent.shade200,
                    color: Colors.blueGrey.withOpacity(0.7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          icons[index],
                          color: Colors.yellowAccent,
                          size: 50,
                        ),
                        Text(
                            label[index].toUpperCase(),
                            style: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Acme',
                            letterSpacing: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                );
            }
          ),
        ),
      ),
    );
  }
}
